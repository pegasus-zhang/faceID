;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Obstacle)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Obstacle (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::OBSTACLE")
  (make-package "ROS_INTERFACE::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude Obstacle.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Obstacle
  :super ros::object
  :slots (_header _id _type _confidence _center_point_abs _theta _velocity _length _width _height _occupy_grid ))

(defmethod ros_interface::Obstacle
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:type __type) 0)
    ((:confidence __confidence) 0.0)
    ((:center_point_abs __center_point_abs) (instance ros_interface::Point3D :init))
    ((:theta __theta) 0.0)
    ((:velocity __velocity) (instance ros_interface::Point3D :init))
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:occupy_grid __occupy_grid) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _type (round __type))
   (setq _confidence (float __confidence))
   (setq _center_point_abs __center_point_abs)
   (setq _theta (float __theta))
   (setq _velocity __velocity)
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _occupy_grid __occupy_grid)
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
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
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
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:occupy_grid
   (&rest __occupy_grid)
   (if (keywordp (car __occupy_grid))
       (send* _occupy_grid __occupy_grid)
     (progn
       (if __occupy_grid (setq _occupy_grid (car __occupy_grid)))
       _occupy_grid)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _id
    1
    ;; int32 _type
    4
    ;; float32 _confidence
    4
    ;; ros_interface/Point3D _center_point_abs
    (send _center_point_abs :serialization-length)
    ;; float32 _theta
    4
    ;; ros_interface/Point3D _velocity
    (send _velocity :serialization-length)
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; ros_interface/OccGrid[] _occupy_grid
    (apply #'+ (send-all _occupy_grid :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _id
       (write-byte _id s)
     ;; int32 _type
       (write-long _type s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/Point3D _center_point_abs
       (send _center_point_abs :serialize s)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/Point3D _velocity
       (send _velocity :serialize s)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/OccGrid[] _occupy_grid
     (write-long (length _occupy_grid) s)
     (dolist (elem _occupy_grid)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/Point3D _center_point_abs
     (send _center_point_abs :deserialize buf ptr-) (incf ptr- (send _center_point_abs :serialization-length))
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/Point3D _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/OccGrid[] _occupy_grid
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _occupy_grid (let (r) (dotimes (i n) (push (instance ros_interface::OccGrid :init) r)) r))
     (dolist (elem- _occupy_grid)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ros_interface::Obstacle :md5sum-) "8cdacb9dc63898edc5f02d22321631b6")
(setf (get ros_interface::Obstacle :datatype-) "ros_interface/Obstacle")
(setf (get ros_interface::Obstacle :definition-)
      "Header   header     #  
uint8   id     # #物体ID
int32   type     # #物体类型，TYPE=0//未知物体，TYPE=1//门，TYPE=2//窗户，TYPE=3//冰箱，TYPE=4//电视，TYPE=5//风扇，TYPE=6//衣柜，TYPE=7//床，TYPE=8//沙发，TYPE=9//桌子，TYPE=10//椅子，TYPE=11//楼梯，TYPE=12//台阶，TYPE=13//斜坡，TYPE=14//坑洼，TYPE=15//人
float32   confidence     # #置信度
Point3D   center_point_abs     # #在世界坐标系下的物体中心位置
float32   theta     # #在世界坐标系下物体的朝向
Point3D   velocity     # #在世界坐标系下的物体的速度
float32   length     # #物体外接立体的长度
float32   width     # #物体外接立体的宽度
float32   height     # #物体外接立体的高度
OccGrid[] occupy_grid # # 世界坐标系下物体占据的网格

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

================================================================================
MSG: ros_interface/OccGrid
int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
int32   index_x     # //网格横向编号
int32   index_y     # //网格纵向编号
int32   index_z     # //网格垂直方向编号
float32   grid_size_x     # //网格横向大小，单位：米
float32   grid_size_y     # //网格纵向大小，单位：米
float32   grid_size_z     # //网格垂直方向大小，单位：米

")



(provide :ros_interface/Obstacle "8cdacb9dc63898edc5f02d22321631b6")


