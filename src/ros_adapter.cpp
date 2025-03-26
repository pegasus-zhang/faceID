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

// void Ros1Adapter::subscribe(const std::string& topic_name, size_t queue_size) {
//     sub_ = nh_->subscribe<CompressedImage>(
//         topic_name, queue_size, [this](const boost::shared_ptr<const CompressedImage>& msg) {
//             ROS_INFO("Image received and pushed to queue.");
//             ROS_INFO("Received image message,time: %f",msg->header.stamp.toSec());
//         });
// }


void Ros1Adapter::SensorSyncCallback(const nav_msgs::OdometryConstPtr& odom, const sensor_msgs::CompressedImageConstPtr& image) 
{
    // ROS_INFO("Received odometry message,time: %f",odom->header.stamp.toSec());
    // ROS_INFO("Position: x: %f, y: %f, z: %f", odom->pose.pose.position.x, odom->pose.pose.position.y, odom->pose.pose.position.z);
    // ROS_INFO("Orientation: x: %f, y: %f, z: %f, w: %f", odom->pose.pose.orientation.x, odom->pose.pose.orientation.y, odom->pose.pose.orientation.z, odom->pose.pose.orientation.w);
    // ROS_INFO("Received image message,time: %f",image->header.stamp.toSec());
    msg_mutex_.lock();
    odom_msg_ = odom;
    image_msg_ = image;
    msg_mutex_.unlock();
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
    odom_sub_.subscribe(*nh_, "/map/global_odom", 10);
    image_sub_.subscribe(*nh_, topic_name, queue_size);
    sync_.reset(new message_filters::Synchronizer<MySyncPolicy>(MySyncPolicy(20), odom_sub_, image_sub_));
    sync_->setMaxIntervalDuration(ros::Duration(0.3));
    sync_->registerCallback(boost::bind(&Ros1Adapter::SensorSyncCallback, this, _1, _2));
    return 0;
}
int Ros1Adapter::GetImage(cv::cuda::GpuMat& img,ros::Time& timestamp)
{
    // auto msg = popMessage(); // pop the message from the queue
    // auto image_msg = boost::static_pointer_cast<Ros1Adapter::CompressedImage>(msg);
    msg_mutex_.lock();
    auto image_msg = image_msg_;
    msg_mutex_.unlock();
    if(image_msg == nullptr)
    {
        std::cout<<"image_msg is null"<<std::endl;
        return -1;
    }
    // ROS_INFO("Processing image from queue...");  
    // std::cout << "Image size: " << image_msg->data.size() << " bytes" << std::endl;  
    cv::Mat image = cv::imdecode(cv::Mat(image_msg->data), cv::IMREAD_COLOR); // 解码为 BGR 图像 
    timestamp = image_msg->header.stamp;
    img.upload(image);
    return 0;
}
int Ros1Adapter::GetOdom(Eigen::Vector3d& odom_pos, Eigen::Quaterniond& odom_quat,ros::Time& timestamp)
{
    msg_mutex_.lock();
    auto odom = odom_msg_;
    msg_mutex_.unlock();
    if(odom == nullptr)
    {
        return -1;
    }
    timestamp = odom->header.stamp;
    odom_pos = Eigen::Vector3d(odom->pose.pose.position.x, odom->pose.pose.position.y, odom->pose.pose.position.z);
    odom_quat = Eigen::Quaterniond(odom->pose.pose.orientation.w, odom->pose.pose.orientation.x, odom->pose.pose.orientation.y, odom->pose.pose.orientation.z);
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
