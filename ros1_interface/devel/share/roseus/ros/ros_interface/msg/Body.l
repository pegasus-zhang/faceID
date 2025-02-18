;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Body)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Body (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::BODY")
  (make-package "ROS_INTERFACE::BODY"))

(in-package "ROS")
;;//! \htmlinclude Body.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Body
  :super ros::object
  :slots (_header _id _type _sub_type _confidence _posture_type _center_point_abs _theta _length _width _height _polygon_point_abs _velocity ))

(defmethod ros_interface::Body
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:type __type) 0)
    ((:sub_type __sub_type) 0)
    ((:confidence __confidence) 0.0)
    ((:posture_type __posture_type) 0)
    ((:center_point_abs __center_point_abs) (instance ros_interface::Point3D :init))
    ((:theta __theta) 0.0)
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:polygon_point_abs __polygon_point_abs) ())
    ((:velocity __velocity) (instance ros_interface::Point3D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _type (round __type))
   (setq _sub_type (round __sub_type))
   (setq _confidence (float __confidence))
   (setq _posture_type (round __posture_type))
   (setq _center_point_abs __center_point_abs)
   (setq _theta (float __theta))
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _polygon_point_abs __polygon_point_abs)
   (setq _velocity __velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:sub_type
   (&optional __sub_type)
   (if __sub_type (setq _sub_type __sub_type)) _sub_type)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:posture_type
   (&optional __posture_type)
   (if __posture_type (setq _posture_type __posture_type)) _posture_type)
  (:center_point_abs
   (&rest __center_point_abs)
   (if (keywordp (car __center_point_abs))
       (send* _center_point_abs __center_point_abs)
     (progn
       (if __center_point_abs (setq _center_point_abs (car __center_point_abs)))
       _center_point_abs)))
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:polygon_point_abs
   (&rest __polygon_point_abs)
   (if (keywordp (car __polygon_point_abs))
       (send* _polygon_point_abs __polygon_point_abs)
     (progn
       (if __polygon_point_abs (setq _polygon_point_abs (car __polygon_point_abs)))
       _polygon_point_abs)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _id
    4
    ;; int32 _type
    4
    ;; int32 _sub_type
    4
    ;; float32 _confidence
    4
    ;; int32 _posture_type
    4
    ;; ros_interface/Point3D _center_point_abs
    (send _center_point_abs :serialization-length)
    ;; float32 _theta
    4
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; ros_interface/Point3D[] _polygon_point_abs
    (apply #'+ (send-all _polygon_point_abs :serialization-length)) 4
    ;; ros_interface/Point3D _velocity
    (send _velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _id
       (write-long _id s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _sub_type
       (write-long _sub_type s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _posture_type
       (write-long _posture_type s)
     ;; ros_interface/Point3D _center_point_abs
       (send _center_point_abs :serialize s)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/Point3D[] _polygon_point_abs
     (write-long (length _polygon_point_abs) s)
     (dolist (elem _polygon_point_abs)
       (send elem :serialize s)
       )
     ;; ros_interface/Point3D _velocity
       (send _velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sub_type
     (setq _sub_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _posture_type
     (setq _posture_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; ros_interface/Point3D _center_point_abs
     (send _center_point_abs :deserialize buf ptr-) (incf ptr- (send _center_point_abs :serialization-length))
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/Point3D[] _polygon_point_abs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _polygon_point_abs (let (r) (dotimes (i n) (push (instance ros_interface::Point3D :init) r)) r))
     (dolist (elem- _polygon_point_abs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; ros_interface/Point3D _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::Body :md5sum-) "b3816a053eac0ba3ff3d35c3b3a7032d")
(setf (get ros_interface::Body :datatype-) "ros_interface/Body")
(setf (get ros_interface::Body :definition-)
      "Header   header     #  
uint32   id     # #人体ID
int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定用户，TYPE=3//其他用户 
int32   sub_type     # #人物子类别，SUB_TYPE=0//未识别，SUB_TYPE=1//成年人，SUB_TYPE=2//儿童，SUB_TYPE=3//老人
float32   confidence     # #置信度
int32   posture_type     # #人体姿态类型，POSTURE_TYPE=0//未知姿态，POSTURE_TYPE=1//站，POSTURE_TYPE=2//坐，POSTURE_TYPE=3//躺
Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
float32   theta     # #在世界坐标系下人体的朝向
float32   length     # #人体长度
float32   width     # #人体宽度
float32   height     # #人体高度
Point3D[] polygon_point_abs # # 世界坐标系下人体3D框点坐标
Point3D   velocity     # #在世界坐标系下的人体速度

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



(provide :ros_interface/Body "b3816a053eac0ba3ff3d35c3b3a7032d")


