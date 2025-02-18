;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::VIOOdom)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'VIOOdom (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::VIOODOM")
  (make-package "ROS_INTERFACE::VIOODOM"))

(in-package "ROS")
;;//! \htmlinclude VIOOdom.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::VIOOdom
  :super ros::object
  :slots (_header _position _orientation _pitch _roll _heading _position_std_dev _orientation_std_dev ))

(defmethod ros_interface::VIOOdom
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (instance ros_interface::PointENU :init))
    ((:orientation __orientation) (instance ros_interface::Quaternion :init))
    ((:pitch __pitch) 0.0)
    ((:roll __roll) 0.0)
    ((:heading __heading) 0.0)
    ((:position_std_dev __position_std_dev) (instance ros_interface::Point3D :init))
    ((:orientation_std_dev __orientation_std_dev) (instance ros_interface::Point3D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _orientation __orientation)
   (setq _pitch (float __pitch))
   (setq _roll (float __roll))
   (setq _heading (float __heading))
   (setq _position_std_dev __position_std_dev)
   (setq _orientation_std_dev __orientation_std_dev)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:position_std_dev
   (&rest __position_std_dev)
   (if (keywordp (car __position_std_dev))
       (send* _position_std_dev __position_std_dev)
     (progn
       (if __position_std_dev (setq _position_std_dev (car __position_std_dev)))
       _position_std_dev)))
  (:orientation_std_dev
   (&rest __orientation_std_dev)
   (if (keywordp (car __orientation_std_dev))
       (send* _orientation_std_dev __orientation_std_dev)
     (progn
       (if __orientation_std_dev (setq _orientation_std_dev (car __orientation_std_dev)))
       _orientation_std_dev)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ros_interface/PointENU _position
    (send _position :serialization-length)
    ;; ros_interface/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; float32 _pitch
    4
    ;; float32 _roll
    4
    ;; float32 _heading
    4
    ;; ros_interface/Point3D _position_std_dev
    (send _position_std_dev :serialization-length)
    ;; ros_interface/Point3D _orientation_std_dev
    (send _orientation_std_dev :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ros_interface/PointENU _position
       (send _position :serialize s)
     ;; ros_interface/Quaternion _orientation
       (send _orientation :serialize s)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/Point3D _position_std_dev
       (send _position_std_dev :serialize s)
     ;; ros_interface/Point3D _orientation_std_dev
       (send _orientation_std_dev :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ros_interface/PointENU _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; ros_interface/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/Point3D _position_std_dev
     (send _position_std_dev :deserialize buf ptr-) (incf ptr- (send _position_std_dev :serialization-length))
   ;; ros_interface/Point3D _orientation_std_dev
     (send _orientation_std_dev :deserialize buf ptr-) (incf ptr- (send _orientation_std_dev :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::VIOOdom :md5sum-) "26bbbc0f0fc437f554ced320e72f76c4")
(setf (get ros_interface::VIOOdom :datatype-) "ros_interface/VIOOdom")
(setf (get ros_interface::VIOOdom :definition-)
      "Header   header     #  
PointENU   position     # # xxx坐标系下相对于原点的xyz
Quaternion   orientation     # # 姿态四元数
float32   pitch     # # 姿态角(单位弧度，满足右手定则)
float32   roll     #  
float32   heading     #  
Point3D   position_std_dev     # # 位置标准差
Point3D   orientation_std_dev     # # 姿态标准差

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

================================================================================
MSG: ros_interface/PointENU
float32   x     #  
float32   y     #  
float32   z     #  

================================================================================
MSG: ros_interface/Quaternion
float32   qx     #  
float32   qy     #  
float32   qz     #  
float32   qw     #  

================================================================================
MSG: ros_interface/Point3D
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/VIOOdom "26bbbc0f0fc437f554ced320e72f76c4")


