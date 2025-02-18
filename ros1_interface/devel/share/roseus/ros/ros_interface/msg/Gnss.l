;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Gnss)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Gnss (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::GNSS")
  (make-package "ROS_INTERFACE::GNSS"))

(in-package "ROS")
;;//! \htmlinclude Gnss.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Gnss
  :super ros::object
  :slots (_header _is_valid _latitude _longitude _elevation _utm_position _attitude _sd_position _sd_velocity _sd_attitude _second _sat_use_num _sat_in_view_num _solution_status _position_type _linear_velocity ))

(defmethod ros_interface::Gnss
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:is_valid __is_valid) nil)
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:elevation __elevation) 0.0)
    ((:utm_position __utm_position) (instance ros_interface::Point3D :init))
    ((:attitude __attitude) (instance ros_interface::Point3D :init))
    ((:sd_position __sd_position) (instance ros_interface::Point3D :init))
    ((:sd_velocity __sd_velocity) (instance ros_interface::Point3D :init))
    ((:sd_attitude __sd_attitude) (instance ros_interface::Point3D :init))
    ((:second __second) 0.0)
    ((:sat_use_num __sat_use_num) 0)
    ((:sat_in_view_num __sat_in_view_num) 0)
    ((:solution_status __solution_status) 0)
    ((:position_type __position_type) 0)
    ((:linear_velocity __linear_velocity) (instance ros_interface::Point3D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _is_valid __is_valid)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _elevation (float __elevation))
   (setq _utm_position __utm_position)
   (setq _attitude __attitude)
   (setq _sd_position __sd_position)
   (setq _sd_velocity __sd_velocity)
   (setq _sd_attitude __sd_attitude)
   (setq _second (float __second))
   (setq _sat_use_num (round __sat_use_num))
   (setq _sat_in_view_num (round __sat_in_view_num))
   (setq _solution_status (round __solution_status))
   (setq _position_type (round __position_type))
   (setq _linear_velocity __linear_velocity)
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
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:elevation
   (&optional __elevation)
   (if __elevation (setq _elevation __elevation)) _elevation)
  (:utm_position
   (&rest __utm_position)
   (if (keywordp (car __utm_position))
       (send* _utm_position __utm_position)
     (progn
       (if __utm_position (setq _utm_position (car __utm_position)))
       _utm_position)))
  (:attitude
   (&rest __attitude)
   (if (keywordp (car __attitude))
       (send* _attitude __attitude)
     (progn
       (if __attitude (setq _attitude (car __attitude)))
       _attitude)))
  (:sd_position
   (&rest __sd_position)
   (if (keywordp (car __sd_position))
       (send* _sd_position __sd_position)
     (progn
       (if __sd_position (setq _sd_position (car __sd_position)))
       _sd_position)))
  (:sd_velocity
   (&rest __sd_velocity)
   (if (keywordp (car __sd_velocity))
       (send* _sd_velocity __sd_velocity)
     (progn
       (if __sd_velocity (setq _sd_velocity (car __sd_velocity)))
       _sd_velocity)))
  (:sd_attitude
   (&rest __sd_attitude)
   (if (keywordp (car __sd_attitude))
       (send* _sd_attitude __sd_attitude)
     (progn
       (if __sd_attitude (setq _sd_attitude (car __sd_attitude)))
       _sd_attitude)))
  (:second
   (&optional __second)
   (if __second (setq _second __second)) _second)
  (:sat_use_num
   (&optional __sat_use_num)
   (if __sat_use_num (setq _sat_use_num __sat_use_num)) _sat_use_num)
  (:sat_in_view_num
   (&optional __sat_in_view_num)
   (if __sat_in_view_num (setq _sat_in_view_num __sat_in_view_num)) _sat_in_view_num)
  (:solution_status
   (&optional __solution_status)
   (if __solution_status (setq _solution_status __solution_status)) _solution_status)
  (:position_type
   (&optional __position_type)
   (if __position_type (setq _position_type __position_type)) _position_type)
  (:linear_velocity
   (&rest __linear_velocity)
   (if (keywordp (car __linear_velocity))
       (send* _linear_velocity __linear_velocity)
     (progn
       (if __linear_velocity (setq _linear_velocity (car __linear_velocity)))
       _linear_velocity)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _is_valid
    1
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ;; float32 _elevation
    4
    ;; ros_interface/Point3D _utm_position
    (send _utm_position :serialization-length)
    ;; ros_interface/Point3D _attitude
    (send _attitude :serialization-length)
    ;; ros_interface/Point3D _sd_position
    (send _sd_position :serialization-length)
    ;; ros_interface/Point3D _sd_velocity
    (send _sd_velocity :serialization-length)
    ;; ros_interface/Point3D _sd_attitude
    (send _sd_attitude :serialization-length)
    ;; float32 _second
    4
    ;; int32 _sat_use_num
    4
    ;; int32 _sat_in_view_num
    4
    ;; uint16 _solution_status
    2
    ;; uint16 _position_type
    2
    ;; ros_interface/Point3D _linear_velocity
    (send _linear_velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _is_valid
       (if _is_valid (write-byte -1 s) (write-byte 0 s))
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _elevation
       (sys::poke _elevation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/Point3D _utm_position
       (send _utm_position :serialize s)
     ;; ros_interface/Point3D _attitude
       (send _attitude :serialize s)
     ;; ros_interface/Point3D _sd_position
       (send _sd_position :serialize s)
     ;; ros_interface/Point3D _sd_velocity
       (send _sd_velocity :serialize s)
     ;; ros_interface/Point3D _sd_attitude
       (send _sd_attitude :serialize s)
     ;; float32 _second
       (sys::poke _second (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _sat_use_num
       (write-long _sat_use_num s)
     ;; int32 _sat_in_view_num
       (write-long _sat_in_view_num s)
     ;; uint16 _solution_status
       (write-word _solution_status s)
     ;; uint16 _position_type
       (write-word _position_type s)
     ;; ros_interface/Point3D _linear_velocity
       (send _linear_velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _is_valid
     (setq _is_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _elevation
     (setq _elevation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/Point3D _utm_position
     (send _utm_position :deserialize buf ptr-) (incf ptr- (send _utm_position :serialization-length))
   ;; ros_interface/Point3D _attitude
     (send _attitude :deserialize buf ptr-) (incf ptr- (send _attitude :serialization-length))
   ;; ros_interface/Point3D _sd_position
     (send _sd_position :deserialize buf ptr-) (incf ptr- (send _sd_position :serialization-length))
   ;; ros_interface/Point3D _sd_velocity
     (send _sd_velocity :deserialize buf ptr-) (incf ptr- (send _sd_velocity :serialization-length))
   ;; ros_interface/Point3D _sd_attitude
     (send _sd_attitude :deserialize buf ptr-) (incf ptr- (send _sd_attitude :serialization-length))
   ;; float32 _second
     (setq _second (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _sat_use_num
     (setq _sat_use_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sat_in_view_num
     (setq _sat_in_view_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _solution_status
     (setq _solution_status (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _position_type
     (setq _position_type (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; ros_interface/Point3D _linear_velocity
     (send _linear_velocity :deserialize buf ptr-) (incf ptr- (send _linear_velocity :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::Gnss :md5sum-) "24b33ab56e90d13bfcf615123e61b968")
(setf (get ros_interface::Gnss :datatype-) "ros_interface/Gnss")
(setf (get ros_interface::Gnss :definition-)
      "Header   header     #  
bool   is_valid     # # 数据有效性标志位
float32   latitude     # # 纬度信息
float32   longitude     # # 经度信息
float32   elevation     # # 海拔信息
Point3D   utm_position     # # UTM坐标位置
Point3D   attitude     # # 三轴姿态
Point3D   sd_position     # # 位置标准差
Point3D   sd_velocity     # # 速度标准差
Point3D   sd_attitude     # # 姿态标准差
float32   second     # # 时间
int32   sat_use_num     # # 使用卫星数
int32   sat_in_view_num     # # 可见卫星数
uint16   solution_status     # # 求解状态
uint16   position_type     # # 定位状态
Point3D   linear_velocity     # # 线速度信息

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
MSG: ros_interface/Point3D
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/Gnss "24b33ab56e90d13bfcf615123e61b968")


