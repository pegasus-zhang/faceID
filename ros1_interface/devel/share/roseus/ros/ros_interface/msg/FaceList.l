;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::FaceList)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'FaceList (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::FACELIST")
  (make-package "ROS_INTERFACE::FACELIST"))

(in-package "ROS")
;;//! \htmlinclude FaceList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::FaceList
  :super ros::object
  :slots (_header _face ))

(defmethod ros_interface::FaceList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:face __face) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _face __face)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:face
   (&rest __face)
   (if (keywordp (car __face))
       (send* _face __face)
     (progn
       (if __face (setq _face (car __face)))
       _face)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ros_interface/Face[] _face
    (apply #'+ (send-all _face :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ros_interface/Face[] _face
     (write-long (length _face) s)
     (dolist (elem _face)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ros_interface/Face[] _face
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _face (let (r) (dotimes (i n) (push (instance ros_interface::Face :init) r)) r))
     (dolist (elem- _face)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ros_interface::FaceList :md5sum-) "95adfebc50f00fb22ca152865b53b267")
(setf (get ros_interface::FaceList :datatype-) "ros_interface/FaceList")
(setf (get ros_interface::FaceList :definition-)
      "Header   header     #  
Face[]  face   #感知的所有人体信息

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
MSG: ros_interface/Face
Header   header     #  
uint32   id     # #面容ID
string   name     # #面容名称
int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤
int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户
float32   confidence     # #人脸检测置信度
BBox2D   face_box     # # 人脸图像框
BBox2D   body_box     # # 人体图像框
Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
sensor_msgs/Image image

================================================================================
MSG: ros_interface/BBox2D
int16   xmin     # # 图像框左上角的x坐标
int16   ymin     # # 图像框左上角的y坐标
int16   xmax     # # 图像框右下角的x坐标
int16   ymax     # # 图像框右下角的y坐标

================================================================================
MSG: ros_interface/Point3D
float32   x     #  
float32   y     #  
float32   z     #  

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

")



(provide :ros_interface/FaceList "95adfebc50f00fb22ca152865b53b267")


