#!/usr/bin/env python
import rospy
from perception_msgs.msg import PercCmd,PercState
from std_msgs.msg import Header
from eye_msgs.msg import EyeCmd,EyeState

def print_help():
    print("Usage: python cmd_pub.py")
    print("Commands:")
    print("1: Start Face id thread")
    print("2: Stop Face id thread")
    print("3: Publish a EYE_FACE_RECORD message")
    print("4: Publish a EYE_CANCEL message")
    print("5: Set name")
    print("6: Flip print log")

def publish_message():
    rospy.init_node('cmd_publisher', anonymous=True)
    pub = rospy.Publisher("/planning/perc_cmd", PercCmd, queue_size=10)
    face_input_pub = rospy.Publisher("/planning/eye_cmd", EyeCmd, queue_size=10)
    name = "陈博"
    # Start listening to the keyboard
    while not rospy.is_shutdown():
        print_help()
        cmd = input("Enter a cmd: ")
        if cmd == '1':
            msg = PercCmd()
            msg.header = Header()
            msg.header.stamp = rospy.Time.now()
            msg.perc_kind = msg.PERC_FOLLOW  # Set to PERC_DEST
            msg.follow_name = name
            pub.publish(msg)
            rospy.loginfo("Published message: %s", msg)
        elif cmd == '2':
            msg = PercCmd()
            msg.header = Header()
            msg.header.stamp = rospy.Time.now()
            msg.perc_kind = msg.PERC_NODE_CLOSE  # Set to PERC_DEST
            pub.publish(msg)
            rospy.loginfo("Published message: %s", msg)
        elif cmd == '3':
            msg = EyeCmd()
            msg.header = Header()
            msg.header.stamp = rospy.Time.now()
            msg.eye_kind = msg.EYE_FACE_RECORD
            msg.human_name = name
            face_input_pub.publish(msg)
            rospy.loginfo("Published message: %s", msg)
        elif cmd == '4':
            msg = EyeCmd()
            msg.header = Header()
            msg.header.stamp = rospy.Time.now()
            msg.eye_kind = msg.EYE_CANCEL
            face_input_pub.publish(msg)
            rospy.loginfo("Published message: %s", msg)
        elif cmd == '5':
            name = input("Enter a name: ")
            print("name: ",name)
        elif cmd == '6':
            msg = PercCmd()
            msg.header = Header()
            msg.header.stamp = rospy.Time.now()
            msg.perc_kind = 1000
            pub.publish(msg)
            rospy.loginfo("Published message: %s", msg)            
        elif cmd == 'h':
            print_help()
        else:
            rospy.logerr("Invalid command")

if __name__ == '__main__':
    try:
        publish_message()
    except rospy.ROSInterruptException:
        pass