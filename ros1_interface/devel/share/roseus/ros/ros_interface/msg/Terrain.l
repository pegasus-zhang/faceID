;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Terrain)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Terrain (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::TERRAIN")
  (make-package "ROS_INTERFACE::TERRAIN"))

(in-package "ROS")
;;//! \htmlinclude Terrain.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Terrain
  :super ros::object
  :slots (_header _type _sub_type ))

(defmethod ros_interface::Terrain
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:type __type) 0)
    ((:sub_type __sub_type) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _type (round __type))
   (setq _sub_type (round __sub_type))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:sub_type
   (&optional __sub_type)
   (if __sub_type (setq _sub_type __sub_type)) _sub_type)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _type
    4
    ;; int32 _sub_type
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _sub_type
       (write-long _sub_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sub_type
     (setq _sub_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::Terrain :md5sum-) "97919d0c95de1d91d1adc1ba724ac117")
(setf (get ros_interface::Terrain :datatype-) "ros_interface/Terrain")
(setf (get ros_interface::Terrain :definition-)
      "Header   header     #  
int32   type     # #室内或者室外，TYPE=0//未知，TYPE=1//室内，TYPE=2//室外
int32   sub_type     # #地形类型，SUB_TYPE=0//未知地形，SUB_TYPE=1//水泥路面，SUB_TYPE=2//光滑路面，SUB_TYPE=3//沙地，UB_TYPE=4//碎石路面，SUB_TYPE=5//草地，SUB_TYPE=6//坑洼，SUB_TYPE=7//地毯，SUB_TYPE=8//斜坡，SUB_TYPE=9//阶梯，SUB_TYPE=10//木地板,SUB_TYPE=11//瓷砖

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :ros_interface/Terrain "97919d0c95de1d91d1adc1ba724ac117")


