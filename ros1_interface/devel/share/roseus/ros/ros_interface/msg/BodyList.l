;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::BodyList)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'BodyList (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::BODYLIST")
  (make-package "ROS_INTERFACE::BODYLIST"))

(in-package "ROS")
;;//! \htmlinclude BodyList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::BodyList
  :super ros::object
  :slots (_header _body ))

(defmethod ros_interface::BodyList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:body __body) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _body __body)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:body
   (&rest __body)
   (if (keywordp (car __body))
       (send* _body __body)
     (progn
       (if __body (setq _body (car __body)))
       _body)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ros_interface/Body[] _body
    (apply #'+ (send-all _body :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ros_interface/Body[] _body
     (write-long (length _body) s)
     (dolist (elem _body)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ros_interface/Body[] _body
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _body (let (r) (dotimes (i n) (push (instance ros_interface::Body :init) r)) r))
     (dolist (elem- _body)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ros_interface::BodyList :md5sum-) "22fef3e180a31acf726a36da08fe1ec9")
(setf (get ros_interface::BodyList :datatype-) "ros_interface/BodyList")
(setf (get ros_interface::BodyList :definition-)
      "Header   header     #  
Body[]  body   #感知的所有人体信息
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
MSG: ros_interface/Body
Header   header     #  
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
MSG: ros_interface/Point3D
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/BodyList "22fef3e180a31acf726a36da08fe1ec9")


