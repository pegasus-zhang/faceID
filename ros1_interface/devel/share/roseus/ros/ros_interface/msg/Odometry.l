;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Odometry)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Odometry (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::ODOMETRY")
  (make-package "ROS_INTERFACE::ODOMETRY"))

(in-package "ROS")
;;//! \htmlinclude Odometry.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Odometry
  :super ros::object
  :slots (_header _child_frame_id _pose _twist ))

(defmethod ros_interface::Odometry
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:child_frame_id __child_frame_id) "")
    ((:pose __pose) (instance ros_interface::PoseWithCovariance :init))
    ((:twist __twist) (instance ros_interface::TwistWithCovariance :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _child_frame_id (string __child_frame_id))
   (setq _pose __pose)
   (setq _twist __twist)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:child_frame_id
   (&optional __child_frame_id)
   (if __child_frame_id (setq _child_frame_id __child_frame_id)) _child_frame_id)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _child_frame_id
    4 (length _child_frame_id)
    ;; ros_interface/PoseWithCovariance _pose
    (send _pose :serialization-length)
    ;; ros_interface/TwistWithCovariance _twist
    (send _twist :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _child_frame_id
       (write-long (length _child_frame_id) s) (princ _child_frame_id s)
     ;; ros_interface/PoseWithCovariance _pose
       (send _pose :serialize s)
     ;; ros_interface/TwistWithCovariance _twist
       (send _twist :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _child_frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _child_frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; ros_interface/PoseWithCovariance _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; ros_interface/TwistWithCovariance _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::Odometry :md5sum-) "22d96cb55252fc83b8a389e3f3a97fc7")
(setf (get ros_interface::Odometry :datatype-) "ros_interface/Odometry")
(setf (get ros_interface::Odometry :definition-)
      "Header   header     #  
string   child_frame_id     #  
PoseWithCovariance   pose     #  
TwistWithCovariance   twist     #  

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
MSG: ros_interface/PoseWithCovariance
float32[] covariance #  

================================================================================
MSG: ros_interface/TwistWithCovariance
float32[] covariance #  

")



(provide :ros_interface/Odometry "22d96cb55252fc83b8a389e3f3a97fc7")


