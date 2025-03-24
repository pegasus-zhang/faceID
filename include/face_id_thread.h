#pragma once
#include "my_thread.h"
#include "ros_adapter.h"
#include "face_recognizer.h"
#include <json.hpp>
#include <memory>
#include "simple_yolo_cuda.h"
#include "ipm.h"
#include "geometry_msgs/PoseStamped.h"

class FaceDetectThread: public MyThread
{
private:
    /* data */
    std::unique_ptr<RosAdapter> ros_adapter_ = nullptr;
    std::shared_ptr<FaceRecognizer> face_recognizer_ = nullptr;
    std::shared_ptr<YoloGpu::IYolo> body_detector_ = nullptr;
    std::shared_ptr<IPM> ipm_ = nullptr;
    nlohmann::json config_;
    std::string host_name_="";
    std::atomic<bool> print_flag_{false};
    std::mutex mutex_;
    ros::Publisher pub_;
    ros::Publisher pub_img_;
    ros::Publisher pub_pos_world_;
    void GetFootPointPixel(const ScrfdGpu::IScrfd::Box& target_face_box,const YoloGpu::IYolo::BoxArray& body_boxes,std::vector<cv::Point2f>& foot_point_pixels);
    void Camera2Robot(const std::vector<cv::Point3f>&foot_point_camera,const cv::Mat& camera2robot_extrinsic,std::vector<cv::Point3f>& foot_point_robot);

public:
    FaceDetectThread(/* args */);
    ~FaceDetectThread();
    void run() override;
    int Init(nlohmann::json config);
    void Spin();
    // void GetImageTask(cv::cuda::GpuMat& gpu_frame);
    int SetHostName(std::string host_name);
    std::string GetHostName();
    int FlipPrintFlag();
    int GetNameList(std::vector<std::string>& name_list);
};