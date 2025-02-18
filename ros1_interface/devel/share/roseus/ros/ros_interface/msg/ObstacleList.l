;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::ObstacleList)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'ObstacleList (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::OBSTACLELIST")
  (make-package "ROS_INTERFACE::OBSTACLELIST"))

(in-package "ROS")
;;//! \htmlinclude ObstacleList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::ObstacleList
  :super ros::object
  :slots (_header _obstaclelist _free_space ))

(defmethod ros_interface::ObstacleList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:obstaclelist __obstaclelist) ())
    ((:free_space __free_space) (instance ros_interface::FreeSpace :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _obstaclelist __obstaclelist)
   (setq _free_space __free_space)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:obstaclelist
   (&rest __obstaclelist)
   (if (keywordp (car __obstaclelist))
       (send* _obstaclelist __obstaclelist)
     (progn
       (if __obstaclelist (setq _obstaclelist (car __obstaclelist)))
       _obstaclelist)))
  (:free_space
   (&rest __free_space)
   (if (keywordp (car __free_space))
       (send* _free_space __free_space)
     (progn
       (if __free_space (setq _free_space (car __free_space)))
       _free_space)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ros_interface/Obstacle[] _obstaclelist
    (apply #'+ (send-all _obstaclelist :serialization-length)) 4
    ;; ros_interface/FreeSpace _free_space
    (send _free_space :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ros_interface/Obstacle[] _obstaclelist
     (write-long (length _obstaclelist) s)
     (dolist (elem _obstaclelist)
       (send elem :serialize s)
       )
     ;; ros_interface/FreeSpace _free_space
       (send _free_space :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ros_interface/Obstacle[] _obstaclelist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstaclelist (let (r) (dotimes (i n) (push (instance ros_interface::Obstacle :init) r)) r))
     (dolist (elem- _obstaclelist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; ros_interface/FreeSpace _free_space
     (send _free_space :deserialize buf ptr-) (incf ptr- (send _free_space :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::ObstacleList :md5sum-) "05b2fafa6d44e7a83845863b5ebb615f")
(setf (get ros_interface::ObstacleList :datatype-) "ros_interface/ObstacleList")
(setf (get ros_interface::ObstacleList :definition-)
      "Header   header     #  
Obstacle[] obstaclelist # #感知识别出的所有物体信息
FreeSpace   free_space     # #可行使区域

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
MSG: ros_interface/Obstacle
Header   header     #  
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

================================================================================
MSG: ros_interface/FreeSpace
Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
OccGrid[] freegrids # //网格横向编号
#Polygon3D[] freegrids
Point3D[] freespace_region # //网格大小，单位：米

")



(provide :ros_interface/ObstacleList "05b2fafa6d44e7a83845863b5ebb615f")


