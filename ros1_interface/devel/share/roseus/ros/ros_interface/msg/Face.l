;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Face)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Face (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::FACE")
  (make-package "ROS_INTERFACE::FACE"))

(in-package "ROS")
;;//! \htmlinclude Face.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Face
  :super ros::object
  :slots (_header _id _name _emotion_type _type _confidence _face_box _body_box _center_point_abs _image ))

(defmethod ros_interface::Face
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:name __name) "")
    ((:emotion_type __emotion_type) 0)
    ((:type __type) 0)
    ((:confidence __confidence) 0.0)
    ((:face_box __face_box) (instance ros_interface::BBox2D :init))
    ((:body_box __body_box) (instance ros_interface::BBox2D :init))
    ((:center_point_abs __center_point_abs) (instance ros_interface::Point3D :init))
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _name (string __name))
   (setq _emotion_type (round __emotion_type))
   (setq _type (round __type))
   (setq _confidence (float __confidence))
   (setq _face_box __face_box)
   (setq _body_box __body_box)
   (setq _center_point_abs __center_point_abs)
   (setq _image __image)
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
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:emotion_type
   (&optional __emotion_type)
   (if __emotion_type (setq _emotion_type __emotion_type)) _emotion_type)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:face_box
   (&rest __face_box)
   (if (keywordp (car __face_box))
       (send* _face_box __face_box)
     (progn
       (if __face_box (setq _face_box (car __face_box)))
       _face_box)))
  (:body_box
   (&rest __body_box)
   (if (keywordp (car __body_box))
       (send* _body_box __body_box)
     (progn
       (if __body_box (setq _body_box (car __body_box)))
       _body_box)))
  (:center_point_abs
   (&rest __center_point_abs)
   (if (keywordp (car __center_point_abs))
       (send* _center_point_abs __center_point_abs)
     (progn
       (if __center_point_abs (setq _center_point_abs (car __center_point_abs)))
       _center_point_abs)))
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _id
    4
    ;; string _name
    4 (length _name)
    ;; int32 _emotion_type
    4
    ;; int32 _type
    4
    ;; float32 _confidence
    4
    ;; ros_interface/BBox2D _face_box
    (send _face_box :serialization-length)
    ;; ros_interface/BBox2D _body_box
    (send _body_box :serialization-length)
    ;; ros_interface/Point3D _center_point_abs
    (send _center_point_abs :serialization-length)
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _id
       (write-long _id s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _emotion_type
       (write-long _emotion_type s)
     ;; int32 _type
       (write-long _type s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_interface/BBox2D _face_box
       (send _face_box :serialize s)
     ;; ros_interface/BBox2D _body_box
       (send _body_box :serialize s)
     ;; ros_interface/Point3D _center_point_abs
       (send _center_point_abs :serialize s)
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _emotion_type
     (setq _emotion_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_interface/BBox2D _face_box
     (send _face_box :deserialize buf ptr-) (incf ptr- (send _face_box :serialization-length))
   ;; ros_interface/BBox2D _body_box
     (send _body_box :deserialize buf ptr-) (incf ptr- (send _body_box :serialization-length))
   ;; ros_interface/Point3D _center_point_abs
     (send _center_point_abs :deserialize buf ptr-) (incf ptr- (send _center_point_abs :serialization-length))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::Face :md5sum-) "0d64c2d16db71623f9aa8dc2f423d616")
(setf (get ros_interface::Face :datatype-) "ros_interface/Face")
(setf (get ros_interface::Face :definition-)
      "Header   header     #  
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



(provide :ros_interface/Face "0d64c2d16db71623f9aa8dc2f423d616")


