;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Image)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Image (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::IMAGE")
  (make-package "ROS_INTERFACE::IMAGE"))

(in-package "ROS")
;;//! \htmlinclude Image.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::Image
  :super ros::object
  :slots (_header _height _width _encoding _is_bigendian _step _data ))

(defmethod ros_interface::Image
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:height __height) 0)
    ((:width __width) 0)
    ((:encoding __encoding) "")
    ((:is_bigendian __is_bigendian) nil)
    ((:step __step) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _height (round __height))
   (setq _width (round __width))
   (setq _encoding (string __encoding))
   (setq _is_bigendian __is_bigendian)
   (setq _step (round __step))
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:encoding
   (&optional __encoding)
   (if __encoding (setq _encoding __encoding)) _encoding)
  (:is_bigendian
   (&optional (__is_bigendian :null))
   (if (not (eq __is_bigendian :null)) (setq _is_bigendian __is_bigendian)) _is_bigendian)
  (:step
   (&optional __step)
   (if __step (setq _step __step)) _step)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _height
    4
    ;; uint32 _width
    4
    ;; string _encoding
    4 (length _encoding)
    ;; bool _is_bigendian
    1
    ;; uint32 _step
    4
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _height
       (write-long _height s)
     ;; uint32 _width
       (write-long _width s)
     ;; string _encoding
       (write-long (length _encoding) s) (princ _encoding s)
     ;; bool _is_bigendian
       (if _is_bigendian (write-byte -1 s) (write-byte 0 s))
     ;; uint32 _step
       (write-long _step s)
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _encoding
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _encoding (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _is_bigendian
     (setq _is_bigendian (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint32 _step
     (setq _step (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get ros_interface::Image :md5sum-) "6d3d4cbcbc4b9ead08e6527196ed4660")
(setf (get ros_interface::Image :datatype-) "ros_interface/Image")
(setf (get ros_interface::Image :definition-)
      "Header   header     #  
uint32   height     #  
uint32   width     #  
string   encoding     #  
bool   is_bigendian     # # Is this data bigendian?
uint32   step     # # Full row length in bytes
uint8[] data # # actual matrix data, size is (step * rows)

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

")



(provide :ros_interface/Image "6d3d4cbcbc4b9ead08e6527196ed4660")


