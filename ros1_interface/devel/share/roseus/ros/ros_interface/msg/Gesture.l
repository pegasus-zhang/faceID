;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Gesture)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Gesture (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::GESTURE")
  (make-package "ROS_INTERFACE::GESTURE"))

(in-package "ROS")
;;//! \htmlinclude Gesture.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Gesture
  :super ros::object
  :slots (_header _id _confidence _gesture_type _gesture_box ))

(defmethod ros_interface::Gesture
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:confidence __confidence) 0.0)
    ((:gesture_type __gesture_type) 0)
    ((:gesture_box __gesture_box) (instance ros_interface::BBox2D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _confidence (float __confidence))
   (setq _gesture_type (round __gesture_type))
   (setq _gesture_box __gesture_box)
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
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:gesture_type
   (&optional __gesture_type)
   (if __gesture_type (setq _gesture_type __gesture_type)) _gesture_type)
  (:gesture_box
   (&rest __gesture_box)
   (if (keywordp (car __gesture_box))
       (send* _gesture_box __gesture_box)
     (progn
       (if __gesture_box (setq _gesture_box (car __gesture_box)))
       _gesture_box)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _id
    1
    ;; float32 _confidence
    4
    ;; int32 _gesture_type
    4
    ;; ros_interface/BBox2D _gesture_box
    (send _gesture_box :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _gesture_type
       (write-long _gesture_type s)
     ;; ros_interface/BBox2D _gesture_box
       (send _gesture_box :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _gesture_type
     (setq _gesture_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; ros_interface/BBox2D _gesture_box
     (send _gesture_box :deserialize buf ptr-) (incf ptr- (send _gesture_box :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::Gesture :md5sum-) "0281d8a12e33d2fbe20a398379db4076")
(setf (get ros_interface::Gesture :datatype-) "ros_interface/Gesture")
(setf (get ros_interface::Gesture :definition-)
      "Header   header     #  
uint8   id     # #手势ID
float32   confidence     # #置信度
int32   gesture_type     # #手势类型，GESTURE_TYPE=0//未知模式，GESTURE_TYPE=1//来，手指指向下方，GESTURE_TYPE=2//握手，GESTURE_TYPE=3//招手，打招呼
BBox2D   gesture_box     # # 手势图像框

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

")



(provide :ros_interface/Gesture "0281d8a12e33d2fbe20a398379db4076")


