#pragma once
#include "my_thread.h"
#include "ros_adapter.h"
#include "face_recognizer.h"
#include <json.hpp>
#include <memory>
#include "simple_yolo_cuda.h"
#include "ipm.h"
#include "geometry_msgs/PoseStamped.h"
#include "ros_interface/Face.h"
#include "ros_interface/FaceList.h"

struct Input
{
    ros::Time frame_timestamp;
    cv::cuda::GpuMat gpu_frame;
    Eigen::Vector3d odom_pos;
    Eigen::Quaterniond odom_quat;
    ros::Time odom_timestamp;
    FaceInfo face_infos;
    YoloGpu::IYolo::BoxArray body_bbox;
};

struct Output
{
    ros::Time frame_timestamp;
    std::vector<ros_interface::Face> face;
    std::vector<cv::Point2f> foot_point_pixel;
    std::vector<cv::Point3f> foot_point_camera;
    std::vector<cv::Point3f> foot_point_robot;
    std::vector<cv::Point3f> foot_point_world;
    YoloGpu::IYolo::BoxArray body_bbox;
};

class FaceDetectThread: public MyThread
{
private:
    /* data */
    int camera_nums_ = 2;
    std::unique_ptr<RosAdapter> ros_adapter_ = nullptr;
    std::vector<std::unique_ptr<RosAdapter>> ros_adapters_;
    std::shared_ptr<FaceRecognizer> face_recognizer_ = nullptr;
    std::shared_ptr<YoloGpu::IYolo> body_detector_ = nullptr;
    std::vector<std::shared_ptr<IPM>> ipms_;
    nlohmann::json config_;
    std::string host_name_="";
    std::atomic<bool> print_flag_{false};
    std::mutex mutex_;
    ros::Publisher pub_;
    ros::Publisher pub_img_;
    ros::Publisher pub_pos_world_;
    void GetFootPointPixel(const ScrfdGpu::IScrfd::Box& target_face_box,const YoloGpu::IYolo::BoxArray& body_boxes,std::vector<cv::Point2f>& foot_point_pixels,YoloGpu::IYolo::BoxArray& target_body_boxes);
    void Camera2Robot(const std::vector<cv::Point3f>&foot_point_camera,const cv::Mat& camera2robot_extrinsic,std::vector<cv::Point3f>& foot_point_robot);
    void Robot2World(const std::vector<cv::Point3f>& foot_point_robot,const Eigen::Vector3d& robot_pos,const Eigen::Quaterniond& robot_quat,std::vector<cv::Point3f>& foot_point_world);
public:
    FaceDetectThread(/* args */);
    ~FaceDetectThread();
    void run() override;
    int Init(nlohmann::json config);
    void Spin();
    int SetHostName(std::string host_name);
    std::string GetHostName();
    int FlipPrintFlag();
    int GetNameList(std::vector<std::string>& name_list);
};