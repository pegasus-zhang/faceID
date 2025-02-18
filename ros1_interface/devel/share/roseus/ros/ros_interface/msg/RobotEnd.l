;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::RobotEnd)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'RobotEnd (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::ROBOTEND")
  (make-package "ROS_INTERFACE::ROBOTEND"))

(in-package "ROS")
;;//! \htmlinclude RobotEnd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::RobotEnd
  :super ros::object
  :slots (_header _is_heading _endpoint _angle ))

(defmethod ros_interface::RobotEnd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:is_heading __is_heading) nil)
    ((:endpoint __endpoint) (instance ros_interface::Vector3 :init))
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _is_heading __is_heading)
   (setq _endpoint __endpoint)
   (setq _angle (float __angle))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:is_heading
   (&optional (__is_heading :null))
   (if (not (eq __is_heading :null)) (setq _is_heading __is_heading)) _is_heading)
  (:endpoint
   (&rest __endpoint)
   (if (keywordp (car __endpoint))
       (send* _endpoint __endpoint)
     (progn
       (if __endpoint (setq _endpoint (car __endpoint)))
       _endpoint)))
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _is_heading
    1
    ;; ros_interface/Vector3 _endpoint
    (send _endpoint :serialization-length)
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _is_heading
       (if _is_heading (write-byte -1 s) (write-byte 0 s))
     ;; ros_interface/Vector3 _endpoint
       (send _endpoint :serialize s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _is_heading
     (setq _is_heading (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; ros_interface/Vector3 _endpoint
     (send _endpoint :deserialize buf ptr-) (incf ptr- (send _endpoint :serialization-length))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::RobotEnd :md5sum-) "79738a95184440d887069e7ba5c4e9d6")
(setf (get ros_interface::RobotEnd :datatype-) "ros_interface/RobotEnd")
(setf (get ros_interface::RobotEnd :definition-)
      "Header   header     #  
bool   is_heading     # 是否是寻声导航
Vector3   endpoint     # 导航终点
float32   angle     # 寻声导航角度

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
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/RobotEnd "79738a95184440d887069e7ba5c4e9d6")


