; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude PointCloud2.msg.html

(cl:defclass <PointCloud2> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (fields
    :reader fields
    :initarg :fields
    :type (cl:vector ros_interface-msg:PointField)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:PointField :initial-element (cl:make-instance 'ros_interface-msg:PointField)))
   (is_bigendian
    :reader is_bigendian
    :initarg :is_bigendian
    :type cl:boolean
    :initform cl:nil)
   (point_step
    :reader point_step
    :initarg :point_step
    :type cl:integer
    :initform 0)
   (row_step
    :reader row_step
    :initarg :row_step
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (is_dense
    :reader is_dense
    :initarg :is_dense
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PointCloud2 (<PointCloud2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCloud2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCloud2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<PointCloud2> is deprecated: use ros_interface-msg:PointCloud2 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:height-val is deprecated.  Use ros_interface-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:width-val is deprecated.  Use ros_interface-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'fields-val :lambda-list '(m))
(cl:defmethod fields-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:fields-val is deprecated.  Use ros_interface-msg:fields instead.")
  (fields m))

(cl:ensure-generic-function 'is_bigendian-val :lambda-list '(m))
(cl:defmethod is_bigendian-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:is_bigendian-val is deprecated.  Use ros_interface-msg:is_bigendian instead.")
  (is_bigendian m))

(cl:ensure-generic-function 'point_step-val :lambda-list '(m))
(cl:defmethod point_step-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:point_step-val is deprecated.  Use ros_interface-msg:point_step instead.")
  (point_step m))

(cl:ensure-generic-function 'row_step-val :lambda-list '(m))
(cl:defmethod row_step-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:row_step-val is deprecated.  Use ros_interface-msg:row_step instead.")
  (row_step m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:data-val is deprecated.  Use ros_interface-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'is_dense-val :lambda-list '(m))
(cl:defmethod is_dense-val ((m <PointCloud2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:is_dense-val is deprecated.  Use ros_interface-msg:is_dense instead.")
  (is_dense m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCloud2>) ostream)
  "Serializes a message object of type '<PointCloud2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fields))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'fields))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_bigendian) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'point_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'point_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'point_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'point_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'row_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'row_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'row_step)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'row_step)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_dense) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCloud2>) istream)
  "Deserializes a message object of type '<PointCloud2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fields) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fields)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:PointField))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'is_bigendian) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'point_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'point_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'point_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'point_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'row_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'row_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'row_step)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'row_step)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'is_dense) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCloud2>)))
  "Returns string type for a message object of type '<PointCloud2>"
  "ros_interface/PointCloud2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud2)))
  "Returns string type for a message object of type 'PointCloud2"
  "ros_interface/PointCloud2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCloud2>)))
  "Returns md5sum for a message object of type '<PointCloud2>"
  "4df5a2696573347510f7b13515574cfc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCloud2)))
  "Returns md5sum for a message object of type 'PointCloud2"
  "4df5a2696573347510f7b13515574cfc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCloud2>)))
  "Returns full string definition for message of type '<PointCloud2>"
  (cl:format cl:nil "Header   header     #  ~%uint32   height     #  ~%uint32   width     #  ~%PointField[] fields # # Describes the channels and their layout in the binary data blob.~%bool   is_bigendian     # # Is this data bigendian?~%uint32   point_step     # # Length of a point in bytes~%uint32   row_step     # # Length of a row in bytes~%uint8[] data # # Actual point data, size is (row_step*height)~%bool   is_dense     # # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PointField~%string   name     # # Name of field~%uint32   offset     # # Offset from start of point struct~%uint8   datatype     # # Datatype enumeration, see above~%uint32   count     # # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCloud2)))
  "Returns full string definition for message of type 'PointCloud2"
  (cl:format cl:nil "Header   header     #  ~%uint32   height     #  ~%uint32   width     #  ~%PointField[] fields # # Describes the channels and their layout in the binary data blob.~%bool   is_bigendian     # # Is this data bigendian?~%uint32   point_step     # # Length of a point in bytes~%uint32   row_step     # # Length of a row in bytes~%uint8[] data # # Actual point data, size is (row_step*height)~%bool   is_dense     # # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PointField~%string   name     # # Name of field~%uint32   offset     # # Offset from start of point struct~%uint8   datatype     # # Datatype enumeration, see above~%uint32   count     # # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCloud2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fields) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCloud2>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCloud2
    (cl:cons ':header (header msg))
    (cl:cons ':height (height msg))
    (cl:cons ':width (width msg))
    (cl:cons ':fields (fields msg))
    (cl:cons ':is_bigendian (is_bigendian msg))
    (cl:cons ':point_step (point_step msg))
    (cl:cons ':row_step (row_step msg))
    (cl:cons ':data (data msg))
    (cl:cons ':is_dense (is_dense msg))
))
