#include"face_id_thread.h"
#include <future>
#include <chrono>
#include <glog/logging.h>
#include "cmdline.h"
#include <fstream>
#include <cv_bridge/cv_bridge.h>
#include <sys/stat.h>
#include "median_filter.h"

typedef nlohmann::json json;
FaceDetectThread::FaceDetectThread(/* args */)
{
}

FaceDetectThread::~FaceDetectThread()
{
}

struct EulerAngles {
    double roll;
    double pitch;
    double yaw;
};

EulerAngles ToEulerAngles(const Eigen::Quaterniond& q) {
    EulerAngles angles;

    // roll (x-axis rotation)
    double sinr_cosp = 2 * (q.w() * q.x() + q.y() * q.z());
    double cosr_cosp = 1 - 2 * (q.x() * q.x() + q.y() * q.y());
    angles.roll = std::atan2(sinr_cosp, cosr_cosp);

    // pitch (y-axis rotation)
    double sinp = 2 * (q.w() * q.y() - q.z() * q.x());
    if (std::abs(sinp) >= 1)
        angles.pitch = std::copysign(M_PI / 2, sinp); // use 90 degrees if out of range
    else
        angles.pitch = std::asin(sinp);

    // yaw (z-axis rotation)
    double siny_cosp = 2 * (q.w() * q.z() + q.x() * q.y());
    double cosy_cosp = 1 - 2 * (q.y() * q.y() + q.z() * q.z());
    angles.yaw = std::atan2(siny_cosp, cosy_cosp);

    return angles;
}

void FaceDetectThread::run()
{
    ros::Rate rate(5); // 5 Hz
    int num_all = 0;
    double all_used_times = 0.0;
    double used_times_mean = 0.0;
    int width = config_["camera_parameter"][0]["image_size"][0];   // 获取宽度
    int height = config_["camera_parameter"][0]["image_size"][1];  // 获取高度
    json name2id_dict;
    bool first_flag = true;
    face_recognizer_->GetName2IDDict(name2id_dict);
    std::vector<cv::Mat> camera2robot_extrinsics;
    int camera_id = 0;
    for(size_t i = 0;i<camera_nums_;i++)
    {
        cv::Mat camera2robot_extrinsic = jsonToCvMat(config_["camera_parameter"][i]["camera2robot_extrinsic"],4,4,2);
        camera2robot_extrinsics.push_back(camera2robot_extrinsic);
    }
    if(config_["debug_parameters"]["show_flag"])
    {
        cv::namedWindow("Detected Faces",cv::WINDOW_NORMAL);
    }
    if(config_["debug_parameters"]["print_log"])
    {
        print_flag_ = true;
    }
    while (!is_stopped() && ros::ok()) {
        // 处理挂起逻辑
        std::unique_lock<std::mutex> lock(cv_mtx_);
        if (is_suspended())
        {
            first_flag = true;
        }
        cv_.wait(lock, [this] {return !is_suspended() || is_stopped(); });

        if (is_stopped()) break;
        auto time_start = std::chrono::high_resolution_clock::now();

        // std::cout << "Thread is running custom logic." << std::endl;
        std::vector<Input> input_datas(camera_nums_); // 获取数据
        for(size_t i=0;i<camera_nums_;i++)
        {
            ros_adapters_[i]->GetImage(input_datas[i].gpu_frame,input_datas[i].frame_timestamp);
            // std::cout << "input_datas[i].gpu_frame.size(): "<< input_datas[i].gpu_frame.size() << std::endl;
            ros_adapters_[i]->GetOdom(input_datas[i].odom_pos,input_datas[i].odom_quat,input_datas[i].odom_timestamp); 
        }

        // 推理
        std::vector<std::future<int>> ret_futures(camera_nums_);
        std::vector<std::shared_future<YoloGpu::IYolo::BoxArray>> body_bbox_futures(camera_nums_);
        // std::vector<cv::cuda::GpuMat> gpu_frames(camera_nums_);
        for (size_t i = 0; i < camera_nums_; i++)
        {
            ret_futures[i] = face_recognizer_->DetectFaceAsync(input_datas[i].gpu_frame, input_datas[i].face_infos);
            body_bbox_futures[i] = body_detector_->Inference(input_datas[i].gpu_frame);
        }
        for (size_t i = 0; i < camera_nums_; i++)
        {
            int ret = ret_futures[i].get();
            input_datas[i].body_bbox = body_bbox_futures[i].get();
        }
        
        //后处理
        std::string host_name = GetHostName();
        double max_confidence = 0.0;
        Output output;
        for (size_t j = 0; j < camera_nums_; j++)
        {
            FaceInfo &face_infos = input_datas[j].face_infos;
            for (size_t i = 0; i < face_infos.face_ids.size(); ++i) 
            {
                if (host_name == face_infos.face_ids[i]&& face_infos.scores[i] > max_confidence) { // 置信度阈值
                    output.frame_timestamp = input_datas[j].frame_timestamp;
                    camera_id = j;
                    ros_interface::Face face;
                    face.name = face_infos.face_ids[i];
                    face.id = name2id_dict[face.name];
                    face.confidence = face_infos.scores[i];
                    max_confidence = face_infos.scores[i];
                    face.face_box.xmin = std::max(0, (int)face_infos.boxes[i].left);
                    face.face_box.ymin = std::max(0, (int)face_infos.boxes[i].top);
                    face.face_box.xmax = std::min(width, (int)face_infos.boxes[i].right);
                    face.face_box.ymax = std::min(height, (int)face_infos.boxes[i].bottom);
                    
                    // 提取人脸区域
                    cv::Mat face_image;
                    input_datas[j].gpu_frame(cv::Rect(face.face_box.xmin, face.face_box.ymin,
                                    face.face_box.xmax - face.face_box.xmin,
                                    face.face_box.ymax - face.face_box.ymin)).download(face_image);
                    cv_bridge::CvImage img_bridge;
                    img_bridge.image = face_image;
                    img_bridge.encoding = "bgr8";
                    img_bridge.toImageMsg(face.image);
                    
                    // 计算3D坐标
                    GetFootPointPixel(face_infos.boxes[i], input_datas[j].body_bbox,output.foot_point_pixel,output.body_bbox);
                    if(output.foot_point_pixel.size() > 0)
                    {
                        face.body_box.xmin = std::max(0, (int)output.body_bbox[0].left);
                        face.body_box.ymin = std::max(0, (int)output.body_bbox[0].top);
                        face.body_box.xmax = std::min(width, (int)output.body_bbox[0].right);
                        face.body_box.ymax = std::min(height, (int)output.body_bbox[0].bottom);
                    }
                    
                    ipms_[j]->get3DPos(output.foot_point_pixel, output.foot_point_camera);
                    //camera坐标转robot坐标
                    Camera2Robot(output.foot_point_camera,camera2robot_extrinsics[j],output.foot_point_robot);
                    // std::cout<<"camera2robot_extrinsic: "<<camera2robot_extrinsic;
                    Robot2World(output.foot_point_robot,input_datas[j].odom_pos,input_datas[j].odom_quat,output.foot_point_world);
                    for(size_t k=0;k<output.foot_point_world.size();k++)
                    {
                        face.center_point_abs.x = output.foot_point_robot[k].x;
                        face.center_point_abs.y = output.foot_point_robot[k].y;
                        face.center_point_abs.z = output.foot_point_robot[k].z;
                        output.face.push_back(face);
                        if(print_flag_)
                        {
                            // 输出转换后的目标位置
                            ROS_INFO("Camera ID: %d",j);
                            ROS_INFO("Delta time: %f", input_datas[j].odom_timestamp.toSec() - input_datas[j].frame_timestamp.toSec());
                            ROS_INFO("Position: x: %f, y: %f, z: %f", input_datas[j].odom_pos[0], input_datas[j].odom_pos[1], input_datas[j].odom_pos[2]);
                            ROS_INFO("Orientation: x: %f, y: %f, z: %f, w: %f", input_datas[j].odom_quat.x(), input_datas[j].odom_quat.y(), input_datas[j].odom_quat.z(), input_datas[j].odom_quat.w());
                            EulerAngles euler_angle = ToEulerAngles(input_datas[j].odom_quat);
                            ROS_INFO("Orientation: r: %f, p: %f, y: %f", euler_angle.roll, euler_angle.pitch, euler_angle.yaw);
                            ROS_INFO("Detected face: %s, Confidence: %.2f, 3d pos(camera): (%f, %f, %f)", face.name.c_str(), face.confidence, output.foot_point_camera[k].x, output.foot_point_camera[k].y, output.foot_point_camera[k].z);
                            ROS_INFO("Detected face: %s, Confidence: %.2f, 3d pos(robot): (%f, %f, %f)", face.name.c_str(), face.confidence, output.foot_point_robot[k].x, output.foot_point_robot[k].y, output.foot_point_robot[k].z);
                            ROS_INFO("Detected face: %s, Confidence: %.2f, 3d pos(world): (%f, %f, %f)", face.name.c_str(), face.confidence, output.foot_point_world[k].x, output.foot_point_world[k].y, output.foot_point_world[k].z);
                            std::cout<<std::endl;
                        }                          
                    }
                  
                    //实现启动后ros只发送一次原图
                    if(first_flag)
                    {
                        first_flag = false;
                        cv::Mat cpu_img;
                        input_datas[camera_id].gpu_frame.download(cpu_img);
                        img_bridge.image = cpu_img;
                        img_bridge.encoding = "bgr8";
                        sensor_msgs::CompressedImage welcome_image;
                        img_bridge.toCompressedImageMsg(welcome_image);
                        pub_img_.publish(welcome_image);
                        ROS_INFO("Publish welcome image");
                        for (size_t i = 0; i < output.face.size(); i++)
                        {
                            const auto& face = output.face[i];
                            cv::rectangle(cpu_img, cv::Point(face.face_box.xmin, face.face_box.ymin), cv::Point(face.face_box.xmax, face.face_box.ymax), cv::Scalar(0, 0, 255), 2);
                            std::string label = "ID: " + face.name + ", Score: " + std::to_string(face.confidence);
                            int baseline = 0;
                            cv::Size label_size = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseline);
                            cv::putText(cpu_img, label, cv::Point(face.face_box.xmin, face.face_box.ymin - label_size.height - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 255, 0), 2);
                        }
                        for (size_t i = 0;i<output.body_bbox.size();i++)
                        {
                            cv::rectangle(cpu_img, cv::Point(output.body_bbox[i].left, output.body_bbox[i].top), cv::Point(output.body_bbox[i].right, output.body_bbox[i].bottom), cv::Scalar(0, 255, 0), 2);
                        }
                        for(size_t i = 0; i < output.foot_point_pixel.size(); i++)
                        {
                            cv::circle(cpu_img, cv::Point((int)output.foot_point_pixel[i].x, (int)output.foot_point_pixel[i].y), 5, cv::Scalar(0, 255, 0), -1);
                        }
                        //保存图片
                        std::string image_timestamp = std::to_string(ros::Time::now().toSec());
                        std::string image_path = "outputs/welcome_image_" + image_timestamp + ".jpg";
                        std::string folder_path = "outputs";
                        struct stat info;
                        if (stat(folder_path.c_str(), &info) != 0) {
                            // 创建文件夹
                            mkdir(folder_path.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
                        }
                        cv::imwrite(image_path, cpu_img);
                    }                
                }
            }
        }               
        
        if(config_["debug_parameters"]["show_flag"] && !input_datas[camera_id].gpu_frame.empty())
        {
            // 在图像上绘制人脸边界框并显示人脸 ID 和分数
            cv::Mat cpu_img;
            input_datas[camera_id].gpu_frame.download(cpu_img);
            for (size_t i = 0; i < output.face.size(); i++)
            {
                const auto& face = output.face[i];
                cv::rectangle(cpu_img, cv::Point(face.face_box.xmin, face.face_box.ymin), cv::Point(face.face_box.xmax, face.face_box.ymax), cv::Scalar(0, 0, 255), 2);
                std::string label = "ID: " + face.name + ", Score: " + std::to_string(face.confidence);
                int baseline = 0;
                cv::Size label_size = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseline);
                cv::putText(cpu_img, label, cv::Point(face.face_box.xmin, face.face_box.ymin - label_size.height - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 255, 0), 2);
            }
            for (size_t i = 0;i<output.body_bbox.size();i++)
            {
                cv::rectangle(cpu_img, cv::Point(output.body_bbox[i].left, output.body_bbox[i].top), cv::Point(output.body_bbox[i].right, output.body_bbox[i].bottom), cv::Scalar(0, 255, 0), 2);
            }
            for(size_t i = 0; i < output.foot_point_pixel.size(); i++)
            {
                cv::circle(cpu_img, cv::Point((int)output.foot_point_pixel[i].x, (int)output.foot_point_pixel[i].y), 5, cv::Scalar(0, 255, 0), -1);
            }
            // 显示图像
            cv::imshow("Detected Faces", cpu_img);
            cv::waitKey(40);
        }
        
        // 打包和发布结果
        ros_interface::FaceList face_lists;
        geometry_msgs::PoseStamped host_pos_msg;
        face_lists.header.stamp = output.frame_timestamp;
        host_pos_msg.header.stamp = output.frame_timestamp;
        for(size_t i = 0;i < output.face.size();i++)
        {
            host_pos_msg.pose.position.x = output.foot_point_world[i].x;
            host_pos_msg.pose.position.y = output.foot_point_world[i].y;
            host_pos_msg.pose.position.z = output.foot_point_world[i].z;                    
            face_lists.face.push_back(output.face[i]);
        }

        pub_.publish(face_lists);
        pub_pos_world_.publish(host_pos_msg);
        
        auto time_end = std::chrono::high_resolution_clock::now();
        auto used_time = std::chrono::duration<double>(time_end - time_start).count();
        
        // 计算平均时间
        num_all++;
        all_used_times += used_time;
        used_times_mean = all_used_times / num_all;
        if(print_flag_)
        {
            ROS_INFO("Used time: %.4f, Mean time: %.4f", used_time, used_times_mean);
        }
        rate.sleep(); // 等待直到下一个周期
    }
    std::cout << "FaceDetectThread stopped." << std::endl;

}
int FaceDetectThread::Init(nlohmann::json config)
{
    config_ = config;
    #ifdef ROS_ENABLE 
        ros::NodeHandle nh; 
        ros_adapters_.resize(camera_nums_);
        for(size_t i=0;i<camera_nums_;i++)
        {
            ros_adapters_[i] = std::make_unique<Ros1Adapter>(); 
            ros_adapters_[i]->Init("faceID", config["camera_parameter"][i]["fisheye_rostopic"], 1);
        }
        pub_ = nh.advertise<ros_interface::FaceList>("/perception/result/FaceList", 1);
        pub_img_ = nh.advertise<sensor_msgs::CompressedImage>("/cam_front/csi_cam/welcome_image", 1);
        pub_pos_world_ = nh.advertise<geometry_msgs::PoseStamped>("/perception/result/HostPosWorld", 1);
 
    #endif  

    #ifdef ROS2_ENABLE  
        ros_adapter_ = std::make_unique<Ros2Adapter>();  
    #endif
    
    if (0 == ros_adapters_.size()) 
    {  
        std::cerr << "No ROS version enabled. Define either ROS_ENABLE or ROS2_ENABLE." << std::endl;  
        return -1;  
    } 
    face_recognizer_ = std::make_shared<FaceRecognizer>();
    face_recognizer_->Init(config);
    body_detector_ = YoloGpu::IYoloManager::create();
    body_detector_->Init(config["model_parameter"]["body_detector"]["model_path"],
                        config["model_parameter"]["body_detector"]["build_engine"],
                        config["model_parameter"]["body_detector"]["confidence_threshold"],
                        config["model_parameter"]["body_detector"]["nms_threshold"]
                        );
    //IPM
    ipms_.resize(camera_nums_);
    for(size_t i =0;i<camera_nums_;i++)
    {
        cv::Mat cameraMatrix = jsonToCvMat(config["camera_parameter"][i]["camera_intrinsics"], 3, 3, 2);
        cv::Mat distCoeffs = jsonToCvMat(config["camera_parameter"][i]["camera_distortion"], 1, 4, 1);
        cv::Mat perspectiveMatrix = jsonToCvMat(config["camera_parameter"][i]["3d_calibration_parameter"]["PERPECTIVE_MATRIX"], 3, 3, 2);
        std::vector<cv::Point2f> calibratePointsPixel = jsonToPoints2f(config["camera_parameter"][i]["3d_calibration_parameter"]["CALIBRATE_POINTS_PIXEL"]);
        std::vector<cv::Point3f> calibratePointsCamera = jsonToPoints3f(config["camera_parameter"][i]["3d_calibration_parameter"]["CALIBRATE_POINTS_CAMERA"]); 
        int image_width = config["camera_parameter"][i]["image_size"][0];
        int image_height = config["camera_parameter"][i]["image_size"][1];        
        IPM ipm(calibratePointsPixel, calibratePointsCamera, perspectiveMatrix, cameraMatrix, distCoeffs,image_width, image_height);
        ipms_[i] = std::make_shared<IPM>(ipm);
    }
    SetHostName(config["debug_parameters"]["host_name"]);
    return 0;
}
void FaceDetectThread::Spin()
{
    ros_adapter_->spin();
}

// void FaceDetectThread::GetImageTask(cv::cuda::GpuMat& gpu_frame)
// {
//     ros_adapter_->GetImage(gpu_frame);
// }

int FaceDetectThread::SetHostName(std::string host_name)
{
    std::lock_guard<std::mutex> lock(mutex_);
    host_name_ = host_name;
    return 0;
}
std::string FaceDetectThread::GetHostName()
{
    std::lock_guard<std::mutex> lock(mutex_);
    return host_name_;
}
int FaceDetectThread::FlipPrintFlag()
{
    print_flag_ = !print_flag_;
    return 0;
}
void FaceDetectThread::GetFootPointPixel(const ScrfdGpu::IScrfd::Box& target_face_box,
                                        const YoloGpu::IYolo::BoxArray& body_boxes,
                                        std::vector<cv::Point2f>& foot_point_pixels,YoloGpu::IYolo::BoxArray& target_body_boxes)
{
    foot_point_pixels.clear();
    target_body_boxes.clear();
    for(size_t i=0;i<body_boxes.size();i++)
    {
        if(body_boxes[i].keypoints[0].confidence>0.5 && 
           body_boxes[i].keypoints[0].point.x>=target_face_box.left &&
           body_boxes[i].keypoints[0].point.x<=target_face_box.right &&
           body_boxes[i].keypoints[0].point.y>=target_face_box.top &&
           body_boxes[i].keypoints[0].point.y<=target_face_box.bottom)
        {
            cv::Point2f foot_point_pixel;
            foot_point_pixel.x = (body_boxes[i].left + body_boxes[i].right)/2;
            foot_point_pixel.y = body_boxes[i].bottom;
            foot_point_pixels.push_back(foot_point_pixel);
            target_body_boxes.push_back(body_boxes[i]);
        }
    }
}
void FaceDetectThread::Camera2Robot(const std::vector<cv::Point3f>&foot_point_camera,const cv::Mat& camera2robot_extrinsic,std::vector<cv::Point3f>& foot_point_robot)
{
 // 确保外参矩阵是 4x4
    CV_Assert(camera2robot_extrinsic.rows == 4 && camera2robot_extrinsic.cols == 4);

    foot_point_robot.clear();
    for (const auto& pt : foot_point_camera) {
        // 构造齐次坐标 (x, y, z, 1)
        cv::Mat point_camera = (cv::Mat_<double>(4, 1) << pt.x, pt.y, pt.z, 1.0);

        // 进行坐标变换
        cv::Mat point_robot = camera2robot_extrinsic * point_camera;

        // 存储转换后的坐标
        foot_point_robot.emplace_back(point_robot.at<double>(0, 0),
                                      point_robot.at<double>(1, 0),
                                      point_robot.at<double>(2, 0));
    }
}

void FaceDetectThread::Robot2World(const std::vector<cv::Point3f>& foot_point_robot,const Eigen::Vector3d& robot_pos,const Eigen::Quaterniond& robot_quat,std::vector<cv::Point3f>& foot_point_world)
{
    foot_point_world.clear();
    for(size_t i=0;i<foot_point_robot.size();i++)
    {
        Eigen::Vector3d foot_point_robot_eigen(foot_point_robot[i].x,foot_point_robot[i].y,foot_point_robot[i].z);
        Eigen::Vector3d foot_point_world_eigen = robot_quat*foot_point_robot_eigen + robot_pos;
        foot_point_world.emplace_back(cv::Point3f(foot_point_world_eigen.x(),foot_point_world_eigen.y(),foot_point_world_eigen.z()));
    }
}


int FaceDetectThread::GetNameList(std::vector<std::string>& name_list)
{
    if(nullptr == face_recognizer_ )
    {
        return -1;
    }
    return face_recognizer_->GetNameList(name_list);
}


int main(int argc, char** argv)
{
    FLAGS_logtostderr=true;
    FLAGS_colorlogtostderr=true;
    google::InitGoogleLogging(argv[0]);
    cmdline::parser cmd_parser;
    cmd_parser.add<std::string>("config_path",'c',"config path",false,"/home/titan/02_project/faceID/config/default.json");
    cmd_parser.add("show",'\0',"show result flag");
    cmd_parser.add<bool>("suspend",'\0',"suspend thread flag",false,true);
    cmd_parser.parse_check(argc,argv);
    bool show_flag = cmd_parser.exist("show");
    std::string config_path = cmd_parser.get<std::string>("config_path");
    
    // 初始化ROS节点
    ros::init(argc, argv, "face_id");

    // 创建一个配置对象
    nlohmann::json config;
    std::ifstream file(config_path);  // 打开 JSON 文件
    if (!file) {
        std::cerr << "无法打开配置文件!" << std::endl;
        return -1;
    }
    file >> config;  // 解析 JSON
    config["debug_parameters"]["suspend"] = cmd_parser.get<bool>("suspend");
    // 创建一个FaceDetectThread对象
    FaceDetectThread face_detect_thread;

    // 初始化FaceDetectThread对象
    face_detect_thread.Init(config);

    // 启动FaceDetectThread对象
    face_detect_thread.start();

    // 等待线程结束
    face_detect_thread.Spin();

    return 0;
}