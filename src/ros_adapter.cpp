#include "ros_adapter.h"

template <typename T>
FifoQueue<T>::FifoQueue(size_t max_size) : max_size_(max_size) {}

template <typename T>
void FifoQueue<T>::push(const boost::shared_ptr<const T>& msg) {
    std::unique_lock<std::mutex> lock(mutex_);
    if(queue_.size() == max_size_){
        queue_.pop_front();
    }
    queue_.push_back(msg);
    cond_.notify_all();
}

template <typename T>
boost::shared_ptr<const T> FifoQueue<T>::pop() {
    std::unique_lock<std::mutex> lock(mutex_);
    cond_.wait(lock, [this]() { return !queue_.empty(); });
    auto msg = queue_.back();
    queue_.pop_back();
    return msg;
}

#ifdef ROS_ENABLE
Ros1Adapter::Ros1Adapter()
{
}

void Ros1Adapter::subscribe(const std::string& topic_name, size_t queue_size) {
    sub_ = nh_->subscribe<CompressedImage>(
        topic_name, queue_size, [this](const boost::shared_ptr<const CompressedImage>& msg) {
            fifo_queue_.push(msg);
            // ROS_INFO("Image received and pushed to queue.");
        });
}

void Ros1Adapter::spin() {
    ros::spin();
}

boost::shared_ptr<void> Ros1Adapter::popMessage() {
    auto msg = fifo_queue_.pop();
    auto non_const_msg = boost::const_pointer_cast<sensor_msgs::CompressedImage>(msg);
    return boost::reinterpret_pointer_cast<void>(non_const_msg);
}
int Ros1Adapter::Init(std::string node_name, std::string topic_name,int queue_size)
{
    nh_ = boost::make_shared<ros::NodeHandle>();
    subscribe(topic_name,queue_size);
    return 0;
}
int Ros1Adapter::GetImage(cv::cuda::GpuMat& img,ros::Time& timestamp)
{
    auto msg = popMessage(); // pop the message from the queue
    auto image_msg = boost::static_pointer_cast<Ros1Adapter::CompressedImage>(msg);  
    // ROS_INFO("Processing image from queue...");  
    // std::cout << "Image size: " << image_msg->data.size() << " bytes" << std::endl;  
    cv::Mat image = cv::imdecode(cv::Mat(image_msg->data), cv::IMREAD_COLOR); // 解码为 BGR 图像 
    timestamp = image_msg->header.stamp;
    img.upload(image);
    return 0;
}

#endif

#ifdef ROS2_ENABLE
Ros2Adapter::Ros2Adapter()
{

}

void Ros2Adapter::subscribe(const std::string& topic_name, size_t queue_size) {
    sub_ = node_->create_subscription<CompressedImage>(
        topic_name, queue_size, [this](const std::shared_ptr<const CompressedImage>& msg) {
            fifo_queue_.push(msg);
            RCLCPP_INFO(node_->get_logger(), "Image received and pushed to queue.");
        });
}

void Ros2Adapter::spin() {
    rclcpp::spin(node_);
}

boost::shared_ptr<void> Ros2Adapter::popMessage() {
    return fifo_queue_.pop();
}
int Ros2Adapter::Init(std::string node_name, std::string topic_name,int queue_size)
{
    node_ = rclcpp::Node::make_shared(node_name);
    subscribe(topic_name,queue_size);
    return 0;
}
int Ros2Adapter::GetImage(cv::cuda::GpuMat& img,ros::Time& timestamp)
{
    auto msg = popMessage(); // pop the message from the queue
    auto image_msg = boost::static_pointer_cast<Ros2Adapter::CompressedImage>(msg);  
    // RCLCPP_INFO(rclcpp::get_logger("fifo_queue_example"), "Processing image from queue...");  
    // std::cout << "Image size: " << image_msg->data.size() << " bytes" << std::endl; 
    cv::Mat image = cv::imdecode(cv::Mat(image_msg->data), cv::IMREAD_COLOR); // 解码为 BGR 图像 
    timestamp = image_msg->header.stamp;
    img.upload(image); 
    return 0;
}

#endif
