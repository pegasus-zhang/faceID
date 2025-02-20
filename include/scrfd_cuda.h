#ifndef SCRFD_CUDA_HPP
#define SCRFD_CUDA_HPP

/*
  简单的yolo接口，容易集成但是高性能
*/

#include <vector>
#include <memory>
#include <string>
#include <future>
#include <opencv2/opencv.hpp>
#include <opencv2/cudacodec.hpp>
#include <opencv2/cudaimgproc.hpp> 
#include <opencv2/cudawarping.hpp>
#include <opencv2/core/opengl.hpp>
#ifdef ROS2_ENABLE
#include <rclcpp/rclcpp.hpp>
#include <sensor_msgs/msg/compressed_image.hpp>
#endif
#ifdef ROS_ENABLE
#include <ros/ros.h>
#include <sensor_msgs/CompressedImage.h>
#endif

namespace ScrfdGpu
{
    class IScrfd
    {
        public:
            enum class Mode : int {
                FP32,
                FP16,
                INT8
            };

            struct Box{
                float left, top, right, bottom, confidence;
                // int class_label;
                std::vector<cv::Point2f> keypoints;

                Box() = default;

                Box(float left, float top, float right, float bottom, float confidence, const std::vector<cv::Point2f>& keypoints = {})
                :left(left), top(top), right(right), bottom(bottom), confidence(confidence), keypoints(keypoints){}
            };

            typedef std::vector<Box> BoxArray;

        public:
            virtual ~IScrfd(){};
            virtual int Init(std::string model_name, bool build_engine, float confidence_threshold=0.4, float nms_threshold=0.4) = 0;
            virtual std::shared_future<BoxArray> Inference(cv::cuda::GpuMat input_image) = 0;
            virtual std::vector<std::shared_future<BoxArray>> Inference(std::vector<cv::cuda::GpuMat>& input_image) = 0;
            virtual int SetDeviceID(int id) = 0;
            virtual int SetBatchSize(int size) = 0;
            virtual int SetMaxWorkspace(size_t size) = 0;
            virtual int SetPrecision(Mode mode) = 0;
            virtual int SetCalibrationPath(std::string path) = 0;
            virtual int SetCalibrationCachePath(std::string path) = 0;            
    };

    class IScrfdManager
    {
        public:
           static std::shared_ptr<IScrfd> create(); 
    };

        // 定义一个抽象基类作为适配器接口  
    class RosAdapter {  
        public:  
            virtual ~RosAdapter() = default;  

            // 初始化  
            virtual void init(int argc, char** argv, const std::string& node_name) = 0;  

            // 订阅消息  
            virtual void subscribe(const std::string& topic_name, size_t queue_size) = 0;  

            // 开始运行  
            virtual void spin() = 0;  

            // 从队列中取出消息  
            virtual boost::shared_ptr<void> popMessage() = 0;  
    };  


     // 定义一个线程安全的FIFO队列
    template <typename T>  
    class FifoQueue {  
    public:  
        FifoQueue(size_t max_size) : max_size_(max_size) {}  

        // 向队列中添加元素  
        void push(const boost::shared_ptr<const T>& msg) {  
            std::unique_lock<std::mutex> lock(mutex_);
            if(queue_.size() == max_size_){
                queue_.pop_front(); // 移除队首元素
            }  
            // cond_.wait(lock, [this]() { return queue_.size() < max_size_; });  
            queue_.push_back(msg);  // 添加到队尾  
            cond_.notify_all();  
        }  

        // 从队列中取出队尾元素  
        boost::shared_ptr<const T> pop() {  
            std::unique_lock<std::mutex> lock(mutex_);  
            cond_.wait(lock, [this]() { return !queue_.empty(); });  
            auto msg = queue_.back();  // 获取队尾元素  
            queue_.pop_back();         // 移除队尾元素  
            // cond_.notify_all();  
            return msg;  
        }  

    private:  
        std::deque<boost::shared_ptr<const T>> queue_;  // 使用std::deque代替std::queue  
        size_t max_size_;  
        std::mutex mutex_;  
        std::condition_variable cond_;  
    };  

    // ROS1 的适配器实现  
    #ifdef ROS_ENABLE  
    class Ros1Adapter : public RosAdapter {  
    public:  
        using CompressedImage = sensor_msgs::CompressedImage;  

        Ros1Adapter() = default; 

        void init(int argc, char** argv, const std::string& node_name) override {  
            ros::init(argc, argv, node_name);  
            nh_ = std::make_shared<ros::NodeHandle>();  
        }  

        void subscribe(const std::string& topic_name, size_t queue_size) override {  
            sub_ = nh_->subscribe<CompressedImage>(  
                topic_name, queue_size,[this](const boost::shared_ptr<const CompressedImage>& msg) {  // 修正了 typename 和空格  
                    fifo_queue_.push(msg);  
                    ROS_INFO("Image received and pushed to queue.");  
                });  
        }  
        void spin() override {  
            ros::spin();  
        }  

        boost::shared_ptr<void> popMessage() override {  
            auto msg = fifo_queue_.pop();  
            // 先移除 const 限定符  
            auto non_const_msg = boost::const_pointer_cast<sensor_msgs::CompressedImage>(msg);  
            // 再转换为 void  
            return boost::reinterpret_pointer_cast<void>(non_const_msg); 
        }  

    private:  
        std::shared_ptr<ros::NodeHandle> nh_;  
        ros::Subscriber sub_;  
        FifoQueue<CompressedImage> fifo_queue_{5};  
    };  
    #endif  

    // ROS2 的适配器实现  
    #ifdef ROS2_ENABLE  
    class Ros2Adapter : public RosAdapter {  
    public:  
        using CompressedImage = sensor_msgs::msg::CompressedImage;  

        Ros1Adapter() = default; 

        void init(int argc, char** argv, const std::string& node_name) override {  
            rclcpp::init(argc, argv);  
            node_ = rclcpp::Node::make_shared(node_name);  
        }  

        void subscribe(const std::string& topic_name, size_t queue_size) override {  
            sub_ = node_->create_subscription<CompressedImage>(  
                topic_name, queue_size, [this](const boost::shared_ptr<const CompressedImage>& msg) {  
                    fifo_queue_.push(msg);  
                    RCLCPP_INFO(node_->get_logger(), "Image received and pushed to queue.");  
                });  
        }  

        void spin() override {  
            rclcpp::spin(node_);  
        }  

        std::shared_ptr<void> popMessage() override {  
            return fifo_queue_.pop();  
        }  

    private:  
        std::shared_ptr<rclcpp::Node> node_;  
        rclcpp::Subscription<CompressedImage>::SharedPtr sub_;  
        FifoQueue<CompressedImage> fifo_queue_{5};  
    };  
    #endif  


}; // namespace ScrfdGpu

#endif // SCRFD_CUDA_HPP