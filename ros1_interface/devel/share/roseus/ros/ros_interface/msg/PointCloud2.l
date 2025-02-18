;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::PointCloud2)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'PointCloud2 (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::POINTCLOUD2")
  (make-package "ROS_INTERFACE::POINTCLOUD2"))

(in-package "ROS")
;;//! \htmlinclude PointCloud2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::PointCloud2
  :super ros::object
  :slots (_header _height _width _fields _is_bigendian _point_step _row_step _data _is_dense ))

(defmethod ros_interface::PointCloud2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:height __height) 0)
    ((:width __width) 0)
    ((:fields __fields) ())
    ((:is_bigendian __is_bigendian) nil)
    ((:point_step __point_step) 0)
    ((:row_step __row_step) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    ((:is_dense __is_dense) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _height (round __height))
   (setq _width (round __width))
   (setq _fields __fields)
   (setq _is_bigendian __is_bigendian)
   (setq _point_step (round __point_step))
   (setq _row_step (round __row_step))
   (setq _data __data)
   (setq _is_dense __is_dense)
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
  (:fields
   (&rest __fields)
   (if (keywordp (car __fields))
       (send* _fields __fields)
     (progn
       (if __fields (setq _fields (car __fields)))
       _fields)))
  (:is_bigendian
   (&optional (__is_bigendian :null))
   (if (not (eq __is_bigendian :null)) (setq _is_bigendian __is_bigendian)) _is_bigendian)
  (:point_step
   (&optional __point_step)
   (if __point_step (setq _point_step __point_step)) _point_step)
  (:row_step
   (&optional __row_step)
   (if __row_step (setq _row_step __row_step)) _row_step)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:is_dense
   (&optional (__is_dense :null))
   (if (not (eq __is_dense :null)) (setq _is_dense __is_dense)) _is_dense)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _height
    4
    ;; uint32 _width
    4
    ;; ros_interface/PointField[] _fields
    (apply #'+ (send-all _fields :serialization-length)) 4
    ;; bool _is_bigendian
    1
    ;; uint32 _point_step
    4
    ;; uint32 _row_step
    4
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ;; bool _is_dense
    1
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
     ;; ros_interface/PointField[] _fields
     (write-long (length _fields) s)
     (dolist (elem _fields)
       (send elem :serialize s)
       )
     ;; bool _is_bigendian
       (if _is_bigendian (write-byte -1 s) (write-byte 0 s))
     ;; uint32 _point_step
       (write-long _point_step s)
     ;; uint32 _row_step
       (write-long _row_step s)
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;; bool _is_dense
       (if _is_dense (write-byte -1 s) (write-byte 0 s))
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
   ;; ros_interface/PointField[] _fields
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fields (let (r) (dotimes (i n) (push (instance ros_interface::PointField :init) r)) r))
     (dolist (elem- _fields)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _is_bigendian
     (setq _is_bigendian (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint32 _point_step
     (setq _point_step (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _row_step
     (setq _row_step (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;; bool _is_dense
     (setq _is_dense (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ros_interface::PointCloud2 :md5sum-) "4df5a2696573347510f7b13515574cfc")
(setf (get ros_interface::PointCloud2 :datatype-) "ros_interface/PointCloud2")
(setf (get ros_interface::PointCloud2 :definition-)
      "Header   header     #  
uint32   height     #  
uint32   width     #  
PointField[] fields # # Describes the channels and their layout in the binary data blob.
bool   is_bigendian     # # Is this data bigendian?
uint32   point_step     # # Length of a point in bytes
uint32   row_step     # # Length of a row in bytes
uint8[] data # # Actual point data, size is (row_step*height)
bool   is_dense     # # True if there are no invalid points

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
MSG: ros_interface/PointField
string   name     # # Name of field
uint32   offset     # # Offset from start of point struct
uint8   datatype     # # Datatype enumeration, see above
uint32   count     # # How many elements in the field

")



(provide :ros_interface/PointCloud2 "4df5a2696573347510f7b13515574cfc")


