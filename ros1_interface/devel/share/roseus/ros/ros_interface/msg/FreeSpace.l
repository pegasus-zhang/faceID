;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::FreeSpace)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'FreeSpace (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::FREESPACE")
  (make-package "ROS_INTERFACE::FREESPACE"))

(in-package "ROS")
;;//! \htmlinclude FreeSpace.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::FreeSpace
  :super ros::object
  :slots (_header _freegrids _freespace_region ))

(defmethod ros_interface::FreeSpace
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:freegrids __freegrids) ())
    ((:freespace_region __freespace_region) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _freegrids __freegrids)
   (setq _freespace_region __freespace_region)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:freegrids
   (&rest __freegrids)
   (if (keywordp (car __freegrids))
       (send* _freegrids __freegrids)
     (progn
       (if __freegrids (setq _freegrids (car __freegrids)))
       _freegrids)))
  (:freespace_region
   (&rest __freespace_region)
   (if (keywordp (car __freespace_region))
       (send* _freespace_region __freespace_region)
     (progn
       (if __freespace_region (setq _freespace_region (car __freespace_region)))
       _freespace_region)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ros_interface/OccGrid[] _freegrids
    (apply #'+ (send-all _freegrids :serialization-length)) 4
    ;; ros_interface/Point3D[] _freespace_region
    (apply #'+ (send-all _freespace_region :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ros_interface/OccGrid[] _freegrids
     (write-long (length _freegrids) s)
     (dolist (elem _freegrids)
       (send elem :serialize s)
       )
     ;; ros_interface/Point3D[] _freespace_region
     (write-long (length _freespace_region) s)
     (dolist (elem _freespace_region)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ros_interface/OccGrid[] _freegrids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _freegrids (let (r) (dotimes (i n) (push (instance ros_interface::OccGrid :init) r)) r))
     (dolist (elem- _freegrids)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; ros_interface/Point3D[] _freespace_region
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _freespace_region (let (r) (dotimes (i n) (push (instance ros_interface::Point3D :init) r)) r))
     (dolist (elem- _freespace_region)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ros_interface::FreeSpace :md5sum-) "15506d871fb0214f52a0519b30282177")
(setf (get ros_interface::FreeSpace :datatype-) "ros_interface/FreeSpace")
(setf (get ros_interface::FreeSpace :definition-)
      "Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
OccGrid[] freegrids # //网格横向编号
#Polygon3D[] freegrids
Point3D[] freespace_region # //网格大小，单位：米

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
MSG: ros_interface/OccGrid
int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
int32   index_x     # //网格横向编号
int32   index_y     # //网格纵向编号
int32   index_z     # //网格垂直方向编号
float32   grid_size_x     # //网格横向大小，单位：米
float32   grid_size_y     # //网格纵向大小，单位：米
float32   grid_size_z     # //网格垂直方向大小，单位：米

================================================================================
MSG: ros_interface/Point3D
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/FreeSpace "15506d871fb0214f52a0519b30282177")


