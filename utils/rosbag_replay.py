import rospy
import rosbag
import argparse
from sensor_msgs.msg import CompressedImage, Image
from cv_bridge import CvBridge
from std_msgs.msg import Header
import time
def image_callback(msg, bridge, image_pub, topic_name,timestamp):
    """回调函数，处理压缩图像并将其转换为原始图像"""
    try:
        # 将压缩图像消息转换为 OpenCV 图像
        if topic_name == 'color':
            # 对于彩色图像，使用 BGR8 编码
            cv_image = bridge.compressed_imgmsg_to_cv2(msg, desired_encoding='bgr8')
            raw_image_msg = bridge.cv2_to_imgmsg(cv_image, encoding="bgr8")
        elif topic_name == 'depth':
            # 对于深度图像，使用 passthrough 编码（保持原始深度数据）
            cv_image = bridge.imgmsg_to_cv2(msg, desired_encoding='16UC1')
            raw_image_msg = bridge.cv2_to_imgmsg(cv_image, encoding="16UC1")
        
        # 设置消息头，包括时间戳
        raw_image_msg.header = Header()
        raw_image_msg.header.stamp = msg.header.stamp  # 保留原始的时间戳
        
        # 发布原始图像消息
        rospy.loginfo(f"Publishing {topic_name} image with timestamp {msg.header.stamp}")
        image_pub[topic_name].publish(raw_image_msg)
    except Exception as e:
        rospy.logerr(f"Error processing image from {topic_name}: {str(e)}")

def play_rosbag(bag_file, loop, bridge, image_pub):
    """回放 rosbag 并将压缩图像转换为原始图像，支持循环播放"""
    while not rospy.is_shutdown():
        try:
            with rosbag.Bag(bag_file, 'r') as bag:
                for topic, msg, t in bag.read_messages(topics=['/camera/color/image_raw/compressed', '/camera/depth/image_raw']):
                    if topic == '/camera/color/image_raw/compressed':
                        image_callback(msg, bridge, image_pub, 'color',t)
                    if topic == '/camera/depth/image_raw/' or topic == '/camera/depth/image_raw':
                        image_callback(msg, bridge, image_pub, 'depth',t)
                    if rospy.is_shutdown():
                        break
            
            if loop:
                rospy.loginfo("Looping the rosbag playback...")
            else:
                break  # 如果不循环播放，则结束循环
        except rospy.ROSInterruptException:
            break
        time.sleep(0.02)  # 等待 10 毫秒钟，然后重新开始回放

def main():
    # 初始化 ROS 节点
    rospy.init_node('image_sync_playback', anonymous=True)

    # 初始化 CvBridge
    bridge = CvBridge()

    # 创建发布器，用于发布原始图像
    image_pub = {
        'color': rospy.Publisher('/camera/color/image_raw', Image, queue_size=10),
        'depth': rospy.Publisher('/camera/depth/image_raw', Image, queue_size=10)
    }

    # 设置命令行参数解析器
    parser = argparse.ArgumentParser(description="Play a rosbag and convert compressed image to raw image.")
    parser.add_argument('bag_file', type=str, help="Path to the rosbag file")
    parser.add_argument('-l', '--loop', action='store_true', help="Loop the rosbag playback")
    args = parser.parse_args()

    # 获取 rosbag 文件路径
    bag_file = args.bag_file
    loop = args.loop  # 如果有 -l 选项，则循环播放

    # 启动 rosbag 回放
    rospy.loginfo(f"Starting rosbag playback from {bag_file}...")
    play_rosbag(bag_file, loop, bridge, image_pub)

    # 保持 ROS 节点运行
    rospy.spin()

if __name__ == "__main__":
    main()
