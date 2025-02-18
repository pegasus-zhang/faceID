;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Imu)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Imu (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::IMU")
  (make-package "ROS_INTERFACE::IMU"))

(in-package "ROS")
;;//! \htmlinclude Imu.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Imu
  :super ros::object
  :slots (_header _is_valid _orientation _orientation_covariance _angular_velocity _angular_velocity_covariance _linear_acceleration _linear_acceleration_covariance ))

(defmethod ros_interface::Imu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:is_valid __is_valid) nil)
    ((:orientation __orientation) (instance ros_interface::Quaternion :init))
    ((:orientation_covariance __orientation_covariance) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:angular_velocity __angular_velocity) (instance ros_interface::Point3D :init))
    ((:angular_velocity_covariance __angular_velocity_covariance) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:linear_acceleration __linear_acceleration) (instance ros_interface::Point3D :init))
    ((:linear_acceleration_covariance __linear_acceleration_covariance) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _is_valid __is_valid)
   (setq _orientation __orientation)
   (setq _orientation_covariance __orientation_covariance)
   (setq _angular_velocity __angular_velocity)
   (setq _angular_velocity_covariance __angular_velocity_covariance)
   (setq _linear_acceleration __linear_acceleration)
   (setq _linear_acceleration_covariance __linear_acceleration_covariance)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:is_valid
   (&optional (__is_valid :null))
   (if (not (eq __is_valid :null)) (setq _is_valid __is_valid)) _is_valid)
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:orientation_covariance
   (&optional __orientation_covariance)
   (if __orientation_covariance (setq _orientation_covariance __orientation_covariance)) _orientation_covariance)
  (:angular_velocity
   (&rest __angular_velocity)
   (if (keywordp (car __angular_velocity))
       (send* _angular_velocity __angular_velocity)
     (progn
       (if __angular_velocity (setq _angular_velocity (car __angular_velocity)))
       _angular_velocity)))
  (:angular_velocity_covariance
   (&optional __angular_velocity_covariance)
   (if __angular_velocity_covariance (setq _angular_velocity_covariance __angular_velocity_covariance)) _angular_velocity_covariance)
  (:linear_acceleration
   (&rest __linear_acceleration)
   (if (keywordp (car __linear_acceleration))
       (send* _linear_acceleration __linear_acceleration)
     (progn
       (if __linear_acceleration (setq _linear_acceleration (car __linear_acceleration)))
       _linear_acceleration)))
  (:linear_acceleration_covariance
   (&optional __linear_acceleration_covariance)
   (if __linear_acceleration_covariance (setq _linear_acceleration_covariance __linear_acceleration_covariance)) _linear_acceleration_covariance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _is_valid
    1
    ;; ros_interface/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; float32[] _orientation_covariance
    (* 4    (length _orientation_covariance)) 4
    ;; ros_interface/Point3D _angular_velocity
    (send _angular_velocity :serialization-length)
    ;; float32[] _angular_velocity_covariance
    (* 4    (length _angular_velocity_covariance)) 4
    ;; ros_interface/Point3D _linear_acceleration
    (send _linear_acceleration :serialization-length)
    ;; float32[] _linear_acceleration_covariance
    (* 4    (length _linear_acceleration_covariance)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _is_valid
       (if _is_valid (write-byte -1 s) (write-byte 0 s))
     ;; ros_interface/Quaternion _orientation
       (send _orientation :serialize s)
     ;; float32[] _orientation_covariance
     (write-long (length _orientation_covariance) s)
     (dotimes (i (length _orientation_covariance))
       (sys::poke (elt _orientation_covariance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; ros_interface/Point3D _angular_velocity
       (send _angular_velocity :serialize s)
     ;; float32[] _angular_velocity_covariance
     (write-long (length _angular_velocity_covariance) s)
     (dotimes (i (length _angular_velocity_covariance))
       (sys::poke (elt _angular_velocity_covariance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; ros_interface/Point3D _linear_acceleration
       (send _linear_acceleration :serialize s)
     ;; float32[] _linear_acceleration_covariance
     (write-long (length _linear_acceleration_covariance) s)
     (dotimes (i (length _linear_acceleration_covariance))
       (sys::poke (elt _linear_acceleration_covariance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _is_valid
     (setq _is_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; ros_interface/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; float32[] _orientation_covariance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _orientation_covariance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _orientation_covariance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; ros_interface/Point3D _angular_velocity
     (send _angular_velocity :deserialize buf ptr-) (incf ptr- (send _angular_velocity :serialization-length))
   ;; float32[] _angular_velocity_covariance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angular_velocity_covariance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angular_velocity_covariance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; ros_interface/Point3D _linear_acceleration
     (send _linear_acceleration :deserialize buf ptr-) (incf ptr- (send _linear_acceleration :serialization-length))
   ;; float32[] _linear_acceleration_covariance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _linear_acceleration_covariance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _linear_acceleration_covariance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get ros_interface::Imu :md5sum-) "aba9f7059a9aa4e1b1e5cb227fa1f0a1")
(setf (get ros_interface::Imu :datatype-) "ros_interface/Imu")
(setf (get ros_interface::Imu :definition-)
      "Header   header     #  
bool   is_valid     # # 数据有效性标志位
Quaternion   orientation     # # 角度（四元素）
float32[] orientation_covariance # # 角度方差
Point3D   angular_velocity     # # 角速度信息
float32[] angular_velocity_covariance # # 角速度方差
Point3D   linear_acceleration     # # 线加速度信息
float32[] linear_acceleration_covariance # # 线性加速度方差

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



(provide :ros_interface/Imu "aba9f7059a9aa4e1b1e5cb227fa1f0a1")


