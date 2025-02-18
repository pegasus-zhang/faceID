;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::RobotPlan)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'RobotPlan (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::ROBOTPLAN")
  (make-package "ROS_INTERFACE::ROBOTPLAN"))

(in-package "ROS")
;;//! \htmlinclude RobotPlan.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::RobotPlan
  :super ros::object
  :slots (_header _twists ))

(defmethod ros_interface::RobotPlan
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:twists __twists) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _twists __twists)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:twists
   (&rest __twists)
   (if (keywordp (car __twists))
       (send* _twists __twists)
     (progn
       (if __twists (setq _twists (car __twists)))
       _twists)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ros_interface/RobotTwist[] _twists
    (apply #'+ (send-all _twists :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ros_interface/RobotTwist[] _twists
     (write-long (length _twists) s)
     (dolist (elem _twists)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ros_interface/RobotTwist[] _twists
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _twists (let (r) (dotimes (i n) (push (instance ros_interface::RobotTwist :init) r)) r))
     (dolist (elem- _twists)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ros_interface::RobotPlan :md5sum-) "8b76360f7adf2338a7c5b793baf2bfa4")
(setf (get ros_interface::RobotPlan :datatype-) "ros_interface/RobotPlan")
(setf (get ros_interface::RobotPlan :definition-)
      "Header   header     #  
RobotTwist[] twists #  

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
MSG: ros_interface/RobotTwist
Vector3   linear     # 线速度（x方向 y方向 z方向）
Vector3   angular     # 角速度（x方向 y方向 z方向）
string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了

================================================================================
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/RobotPlan "8b76360f7adf2338a7c5b793baf2bfa4")


