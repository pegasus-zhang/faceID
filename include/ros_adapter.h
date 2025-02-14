#pragma once
#ifdef ROS2_ENABLE
#include <rclcpp/rclcpp.hpp>
#include <sensor_msgs/msg/compressed_image.hpp>
#endif
#ifdef ROS_ENABLE
#include <ros/ros.h>
#include <sensor_msgs/CompressedImage.h>
#endif
#include <string>
#include <iostream>
#include <memory>
#include <deque>
#include <condition_variable>
#include <opencv2/opencv.hpp>
class RosAdapter {
public:
    // 定义一个虚析构函数，用于确保派生类的析构函数被正确调用
    // 使用=default关键字表示该析构函数由编译器自动生成
    virtual ~RosAdapter() = default;
    virtual int Init(std::string node_name,std::string topic_name,int queue_size) = 0;
    virtual int GetImage(cv::cuda::GpuMat& image)=0;
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
    void subscribe(const std::string& topic_name, size_t queue_size);
    void spin() override;
    boost::shared_ptr<void> popMessage();
    int Init(std::string node_name, std::string topic_name,int queue_size) override;
    int GetImage(cv::cuda::GpuMat& image) override;

private:
    boost::shared_ptr<ros::NodeHandle> nh_;
    ros::Subscriber sub_;
    FifoQueue<CompressedImage> fifo_queue_{5};
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
    int GetImage(cv::cuda::GpuMat& image) override;

private:
    std::shared_ptr<rclcpp::Node> node_;
    rclcpp::Subscription<CompressedImage>::SharedPtr sub_;
    FifoQueue<CompressedImage> fifo_queue_{5};
};
#endif
