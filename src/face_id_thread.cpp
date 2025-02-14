#include"face_id_thread.h"
#include <future>
#include <chrono>
FaceDetectThread::FaceDetectThread(/* args */)
{
}

FaceDetectThread::~FaceDetectThread()
{
}

void FaceDetectThread::run()
{
    std::cout << "FaceDetectThread started." << std::endl;
    ros::Rate rate(3); // 3 Hz
    while (!is_stopped() && ros::ok()) {
        // 处理挂起逻辑
        std::unique_lock<std::mutex> lock(cv_mtx_);
        cv_.wait(lock, [this] { return !is_suspended() || is_stopped(); });

        if (is_stopped()) break;

        // std::cout << "Thread is running custom logic." << std::endl;
        cv::cuda::GpuMat gpu_frame;
        ros_adapter_->GetImage(gpu_frame);

        // 检测人脸并提取特征
        FaceInfo face_info;
        int ret = face_recognizer_->DetectFace(gpu_frame, face_info);
        if (ret != 0)
        {
            std::cerr << "Error: No face detected." << std::endl;
            continue;
        }

        // 输出检测结果
        std::cout << "Detected " << face_info.face_ids.size() << " faces." << std::endl;
        for (size_t i = 0; i < face_info.face_ids.size(); i++)
        {
            std::cout << "Face " << i << ": ID = " << face_info.face_ids[i] << ", Score = " << face_info.scores[i] << std::endl;
        }
        // 在图像上绘制人脸边界框并显示人脸 ID 和分数
        cv::Mat cpu_img;
        gpu_frame.download(cpu_img);
        for (size_t i = 0; i < face_info.boxes.size(); i++)
        {
            const auto& box = face_info.boxes[i];
            cv::rectangle(cpu_img, cv::Point(box.left, box.top), cv::Point(box.right, box.bottom), cv::Scalar(0, 0, 255), 2);
            std::string label = "ID: " + face_info.face_ids[i] + ", Score: " + std::to_string(face_info.scores[i]);
            int baseline = 0;
            cv::Size label_size = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseline);
            cv::putText(cpu_img, label, cv::Point(box.left, box.top - label_size.height - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 255, 0), 2);
        }

        // 显示图像
        cv::imshow("Detected Faces", cpu_img);
        cv::waitKey(40);
        // // cv::imwrite("/home/jetson/workspace/faceID_jzb/data/backup/frame_1733835120220579455_result.png", cpu_img);

        rate.sleep(); // 等待直到下一个周期
    }
    std::cout << "FaceDetectThread stopped." << std::endl;

}
int FaceDetectThread::Init(nlohmann::json config)
{
    config_ = config;
    #ifdef ROS_ENABLE  
        ros_adapter_ = std::make_unique<Ros1Adapter>();  
    #endif  

    #ifdef ROS2_ENABLE  
        ros_adapter_ = std::make_unique<Ros2Adapter>();  
    #endif
    
    if (!ros_adapter_) 
    {  
        std::cerr << "No ROS version enabled. Define either ROS_ENABLE or ROS2_ENABLE." << std::endl;  
        return 1;  
    } 
    ros_adapter_->Init("faceID", "/cam_front/csi_cam/image_raw/compressed", 1); 
    face_recognizer_ = std::make_shared<FaceRecognizer>();
    face_recognizer_->Init("/home/jetson/workspace/faceID_jzb/data/known_people/database-resnet50.json", 0.5, 0.5);

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


int main(int argc, char** argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "face_id");

    // 创建一个配置对象
    nlohmann::json config;

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