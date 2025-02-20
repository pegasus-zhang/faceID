#include"face_id_thread.h"
#include <future>
#include <chrono>
#include <glog/logging.h>
#include "cmdline.h"
#include <fstream>
#include "ros_interface/Face.h"
#include "ros_interface/FaceList.h"
#include <cv_bridge/cv_bridge.h>

typedef nlohmann::json json;
FaceDetectThread::FaceDetectThread(/* args */)
{
}

FaceDetectThread::~FaceDetectThread()
{
}

void FaceDetectThread::run()
{
    ros::Rate rate(3); // 5 Hz
    int num_all = 0;
    double all_used_times = 0.0;
    double used_times_mean = 0.0;
    json name2id_dict;
    face_recognizer_->GetName2IDDict(name2id_dict);
    cv::Mat camera2robot_extrinsic = jsonToCvMat(config_["camera_parameter"]["camera2robot_extrinsic"],4,4,2);
    while (!is_stopped() && ros::ok()) {
        // 处理挂起逻辑
        std::unique_lock<std::mutex> lock(cv_mtx_);
        cv_.wait(lock, [this] { return !is_suspended() || is_stopped(); });

        if (is_stopped()) break;
        auto time_start = std::chrono::high_resolution_clock::now();

        // std::cout << "Thread is running custom logic." << std::endl;
        cv::cuda::GpuMat gpu_frame;
        ros_adapter_->GetImage(gpu_frame);
        // 检测人脸并提取特征
        FaceInfo face_infos;
        int ret = face_recognizer_->DetectFace(gpu_frame, face_infos);
        if (ret != 0)
        {
            std::cerr << "Error: No face detected." << std::endl;
            continue;
        }   
        YoloGpu::IYolo::BoxArray body_bbox = body_detector_->Inference(gpu_frame).get();
        int width = config_["camera_parameter"]["image_size"][0];   // 获取宽度
        int height = config_["camera_parameter"]["image_size"][1];  // 获取高度
        ros_interface::FaceList face_lists;
        face_lists.header.stamp = ros::Time::now();
        std::vector<cv::Point2f> foot_point_pixel;
        for (size_t i = 0; i < face_infos.face_ids.size(); ++i) 
        {
            std::string host_name = GetHostName();
            double max_confidence = 0.0;
            if (host_name == face_infos.face_ids[i]&& face_infos.scores[i] > max_confidence) { // 置信度阈值
                ros_interface::Face face;
                face.name = face_infos.face_ids[i];
                face.confidence = face_infos.scores[i];
                max_confidence = face_infos.scores[i];
                face.face_box.xmin = std::max(0, (int)face_infos.boxes[i].left);
                face.face_box.ymin = std::max(0, (int)face_infos.boxes[i].top);
                face.face_box.xmax = std::min(width, (int)face_infos.boxes[i].right);
                face.face_box.ymax = std::min(height, (int)face_infos.boxes[i].bottom);
                
                // 提取人脸区域
                cv::Mat face_image;
                gpu_frame(cv::Rect(face.face_box.xmin, face.face_box.ymin,
                                  face.face_box.xmax - face.face_box.xmin,
                                  face.face_box.ymax - face.face_box.ymin)).download(face_image);
                cv_bridge::CvImage img_bridge;
                img_bridge.image = face_image;
                img_bridge.encoding = "bgr8";
                img_bridge.toImageMsg(face.image);
                
                // 计算3D坐标
                GetFootPointPixel(face_infos.boxes[i], body_bbox,foot_point_pixel);
                std::vector<cv::Point3f> foot_point_camera;
                int ret = ipm_->get3DPos(foot_point_pixel, foot_point_camera);
                //camera坐标转robot坐标
                std::vector<cv::Point3f> foot_point_robot;
                Camera2Robot(foot_point_camera,camera2robot_extrinsic,foot_point_robot);
                if (0 == ret)
                {
                    face.center_point_abs.x = foot_point_robot[0].x;
                    face.center_point_abs.y = foot_point_robot[0].y;
                    face.center_point_abs.z = foot_point_robot[0].z;
                    face_lists.face.push_back(face);
                    ROS_INFO("Detected face: %s, Confidence: %.2f, 3d pos(camera): (%f, %f, %f)", face.name.c_str(), face.confidence, foot_point_camera[0].x, foot_point_camera[0].y, foot_point_camera[0].z);
                    ROS_INFO("Detected face: %s, Confidence: %.2f, 3d pos(robot): (%f, %f, %f)", face.name.c_str(), face.confidence, face.center_point_abs.x, face.center_point_abs.y, face.center_point_abs.z);
                }
                
            }
        }
        // // 输出检测结果
        // std::cout << "Detected " << face_info.face_ids.size() << " faces." << std::endl;
        // for (size_t i = 0; i < face_info.face_ids.size(); i++)
        // {
        //     std::cout << "Face " << i << ": ID = " << face_info.face_ids[i] << ", Score = " << face_info.scores[i] << std::endl;
        // }
        // // 在图像上绘制人脸边界框并显示人脸 ID 和分数
        // cv::Mat cpu_img;
        // gpu_frame.download(cpu_img);
        // for (size_t i = 0; i < face_infos.boxes.size(); i++)
        // {
        //     const auto& box = face_infos.boxes[i];
        //     cv::rectangle(cpu_img, cv::Point(box.left, box.top), cv::Point(box.right, box.bottom), cv::Scalar(0, 0, 255), 2);
        //     std::string label = "ID: " + face_infos.face_ids[i] + ", Score: " + std::to_string(face_infos.scores[i]);
        //     int baseline = 0;
        //     cv::Size label_size = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseline);
        //     cv::putText(cpu_img, label, cv::Point(box.left, box.top - label_size.height - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 255, 0), 2);
        // }
        // for (size_t i = 0; i < body_bbox.size(); i++)
        // {
        //     const auto& box = body_bbox[i];
        //     cv::rectangle(cpu_img, cv::Point(box.left, box.top), cv::Point(box.right, box.bottom), cv::Scalar(0, 0, 255), 2);
        // }
        // for(size_t i = 0; i < foot_point_pixel.size(); i++)
        // {
        //     cv::circle(cpu_img, cv::Point((int)foot_point_pixel[i].x, (int)foot_point_pixel[i].y), 5, cv::Scalar(0, 255, 0), -1);
        // }
        // // 显示图像
        // cv::imshow("Detected Faces", cpu_img);
        // cv::waitKey(40);
        // // cv::imwrite("/home/jetson/workspace/faceID_jzb/data/backup/frame_1733835120220579455_result.png", cpu_img);
        pub_.publish(face_lists);
        
        auto time_end = std::chrono::high_resolution_clock::now();
        auto used_time = std::chrono::duration<double>(time_end - time_start).count();
        
        // 计算平均时间
        num_all++;
        all_used_times += used_time;
        used_times_mean = all_used_times / num_all;
        ROS_INFO("Used time: %.4f, Mean time: %.4f", used_time, used_times_mean);
        rate.sleep(); // 等待直到下一个周期
    }
    std::cout << "FaceDetectThread stopped." << std::endl;

}
int FaceDetectThread::Init(nlohmann::json config)
{
    config_ = config;
    #ifdef ROS_ENABLE 
        ros::NodeHandle nh; 
        ros_adapter_ = std::make_unique<Ros1Adapter>(); 
        pub_ = nh.advertise<ros_interface::FaceList>("/perception/result/FaceList", 1);
        pub_img_ = nh.advertise<sensor_msgs::CompressedImage>("/cam_front/csi_cam/welcome_image", 1);
 
    #endif  

    #ifdef ROS2_ENABLE  
        ros_adapter_ = std::make_unique<Ros2Adapter>();  
    #endif
    
    if (!ros_adapter_) 
    {  
        std::cerr << "No ROS version enabled. Define either ROS_ENABLE or ROS2_ENABLE." << std::endl;  
        return 1;  
    } 
    ros_adapter_->Init("faceID", config["camera_parameter"]["fisheye_rostopic"], 1); 
    face_recognizer_ = std::make_shared<FaceRecognizer>();
    face_recognizer_->Init(config);
    body_detector_ = YoloGpu::IYoloManager::create();
    body_detector_->Init(config["model_parameter"]["body_detector"]["model_path"],
                        config["model_parameter"]["body_detector"]["build_engine"],
                        config["model_parameter"]["body_detector"]["confidence_threshold"],
                        config["model_parameter"]["body_detector"]["nms_threshold"]
                        );
    //IPM
    cv::Mat cameraMatrix = jsonToCvMat(config["camera_parameter"]["camera_intrinsics"], 3, 3, 2);
    cv::Mat distCoeffs = jsonToCvMat(config["camera_parameter"]["camera_distortion"], 1, 4, 1);
    cv::Mat perspectiveMatrix = jsonToCvMat(config["3d_calibration_parameter"]["PERPECTIVE_MATRIX"], 3, 3, 2);
    std::vector<cv::Point2f> calibratePointsPixel = jsonToPoints2f(config["3d_calibration_parameter"]["CALIBRATE_POINTS_PIXEL"]);
    std::vector<cv::Point3f> calibratePointsCamera = jsonToPoints3f(config["3d_calibration_parameter"]["CALIBRATE_POINTS_CAMERA"]); 
    int image_width = config["camera_parameter"]["image_size"][0];
    int image_height = config["camera_parameter"]["image_size"][1];
    IPM ipm(calibratePointsPixel, calibratePointsCamera, perspectiveMatrix, cameraMatrix, distCoeffs,image_width, image_height);
    ipm_ = std::make_shared<IPM>(ipm);
    SetHostName(config["debug_parameters"]["host_name"]);
    return 0;
}
void FaceDetectThread::Spin()
{
    ros_adapter_->spin();
}

void FaceDetectThread::GetImageTask(cv::cuda::GpuMat& gpu_frame)
{
    ros_adapter_->GetImage(gpu_frame);
}

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
    std::lock_guard<std::mutex> lock(mutex_);
    print_flag_ = !print_flag_;
    return 0;
}
void FaceDetectThread::GetFootPointPixel(const ScrfdGpu::IScrfd::Box& target_face_box,
                                        const YoloGpu::IYolo::BoxArray& body_boxes,
                                        std::vector<cv::Point2f>& foot_point_pixels)
{
    foot_point_pixels.clear();
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