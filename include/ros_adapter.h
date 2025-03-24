#pragma once
#ifdef ROS2_ENABLE
#include <rclcpp/rclcpp.hpp>
#include <sensor_msgs/msg/compressed_image.hpp>
#endif
#ifdef ROS_ENABLE
#include <ros/ros.h>
#include <sensor_msgs/CompressedImage.h>
#include <nav_msgs/Odometry.h>
#include <message_filters/subscriber.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/synchronizer.h>
#endif
#include <string>
#include <iostream>
#include <memory>
#include <deque>
#include <condition_variable>
#include <opencv2/opencv.hpp>
#include <eigen3/Eigen/Dense>


class RosAdapter {
public:
    // 定义一个虚析构函数，用于确保派生类的析构函数被正确调用
    // 使用=default关键字表示该析构函数由编译器自动生成
    virtual ~RosAdapter() = default;
    virtual int Init(std::string node_name,std::string topic_name,int queue_size) = 0;
    virtual int GetImage(cv::cuda::GpuMat& image,ros::Time& timestamp)=0;
    virtual int GetOdom(Eigen::Vector3d& odom_pos, Eigen::Quaterniond& odom_quat,ros::Time& timestamp)=0;
    virtual void spin() = 0;
};

template <typename T>
class FifoQueue {
public:
    FifoQueue(size_t max_size);
    void push(const boost::shared_ptr<const T>& msg);
    boost::shared_ptr<const T> pop();

private:
    std::deque<boost::shared_ptr<const T>> queue_;
    size_t max_size_;
    std::mutex mutex_;
    std::condition_variable cond_;
};

#ifdef ROS_ENABLE
class Ros1Adapter : public RosAdapter {
public:
    using CompressedImage = sensor_msgs::CompressedImage;
    Ros1Adapter();
    // void subscribe(const std::string& topic_name, size_t queue_size);
    void spin() override;
    boost::shared_ptr<void> popMessage();
    int Init(std::string node_name, std::string topic_name,int queue_size) override;
    int GetImage(cv::cuda::GpuMat& image,ros::Time& timestamp) override;
    int GetOdom(Eigen::Vector3d& odom_pos, Eigen::Quaterniond& odom_quat,ros::Time& timestamp) override;

private:
    boost::shared_ptr<ros::NodeHandle> nh_;
    std::mutex msg_mutex_;
    sensor_msgs::CompressedImageConstPtr image_msg_ = nullptr;
    nav_msgs::OdometryConstPtr odom_msg_ = nullptr;
    message_filters::Subscriber<nav_msgs::Odometry> odom_sub_;
    message_filters::Subscriber<sensor_msgs::CompressedImage> image_sub_;
    typedef message_filters::sync_policies::ApproximateTime<nav_msgs::Odometry, sensor_msgs::CompressedImage> MySyncPolicy;
    std::shared_ptr<message_filters::Synchronizer<MySyncPolicy>> sync_;
    FifoQueue<CompressedImage> fifo_queue_{5};
    void SensorSyncCallback(const nav_msgs::OdometryConstPtr& odom, const sensor_msgs::CompressedImageConstPtr& image); 

};
#endif

#ifdef ROS2_ENABLE
class Ros2Adapter : public RosAdapter {
public:
    using CompressedImage = sensor_msgs::msg::CompressedImage;
    Ros2Adapter();
    void subscribe(const std::string& topic_name, size_t queue_size);
    void spin() override;
    std::shared_ptr<void> popMessage();
    int Init(std::string node_name,std::string topic_name,int queue_size) override;
    int GetImage(cv::cuda::GpuMat& image,ros::Time& timestamp) override;

private:
    std::shared_ptr<rclcpp::Node> node_;
    rclcpp::Subscription<CompressedImage>::SharedPtr sub_;
    FifoQueue<CompressedImage> fifo_queue_{5};
};
#endif
