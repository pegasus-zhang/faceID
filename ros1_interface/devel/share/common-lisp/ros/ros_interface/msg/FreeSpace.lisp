; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude FreeSpace.msg.html

(cl:defclass <FreeSpace> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (freegrids
    :reader freegrids
    :initarg :freegrids
    :type (cl:vector ros_interface-msg:OccGrid)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:OccGrid :initial-element (cl:make-instance 'ros_interface-msg:OccGrid)))
   (freespace_region
    :reader freespace_region
    :initarg :freespace_region
    :type (cl:vector ros_interface-msg:Point3D)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:Point3D :initial-element (cl:make-instance 'ros_interface-msg:Point3D))))
)

(cl:defclass FreeSpace (<FreeSpace>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FreeSpace>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FreeSpace)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<FreeSpace> is deprecated: use ros_interface-msg:FreeSpace instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FreeSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'freegrids-val :lambda-list '(m))
(cl:defmethod freegrids-val ((m <FreeSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:freegrids-val is deprecated.  Use ros_interface-msg:freegrids instead.")
  (freegrids m))

(cl:ensure-generic-function 'freespace_region-val :lambda-list '(m))
(cl:defmethod freespace_region-val ((m <FreeSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:freespace_region-val is deprecated.  Use ros_interface-msg:freespace_region instead.")
  (freespace_region m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FreeSpace>) ostream)
  "Serializes a message object of type '<FreeSpace>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'freegrids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'freegrids))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'freespace_region))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'freespace_region))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FreeSpace>) istream)
  "Deserializes a message object of type '<FreeSpace>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'freegrids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'freegrids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:OccGrid))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'freespace_region) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'freespace_region)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:Point3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FreeSpace>)))
  "Returns string type for a message object of type '<FreeSpace>"
  "ros_interface/FreeSpace")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FreeSpace)))
  "Returns string type for a message object of type 'FreeSpace"
  "ros_interface/FreeSpace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FreeSpace>)))
  "Returns md5sum for a message object of type '<FreeSpace>"
  "15506d871fb0214f52a0519b30282177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FreeSpace)))
  "Returns md5sum for a message object of type 'FreeSpace"
  "15506d871fb0214f52a0519b30282177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FreeSpace>)))
  "Returns full string definition for message of type '<FreeSpace>"
  (cl:format cl:nil "Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%OccGrid[] freegrids # //网格横向编号~%#Polygon3D[] freegrids~%Point3D[] freespace_region # //网格大小，单位：米~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/OccGrid~%int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%int32   index_x     # //网格横向编号~%int32   index_y     # //网格纵向编号~%int32   index_z     # //网格垂直方向编号~%float32   grid_size_x     # //网格横向大小，单位：米~%float32   grid_size_y     # //网格纵向大小，单位：米~%float32   grid_size_z     # //网格垂直方向大小，单位：米~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FreeSpace)))
  "Returns full string definition for message of type 'FreeSpace"
  (cl:format cl:nil "Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%OccGrid[] freegrids # //网格横向编号~%#Polygon3D[] freegrids~%Point3D[] freespace_region # //网格大小，单位：米~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/OccGrid~%int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%int32   index_x     # //网格横向编号~%int32   index_y     # //网格纵向编号~%int32   index_z     # //网格垂直方向编号~%float32   grid_size_x     # //网格横向大小，单位：米~%float32   grid_size_y     # //网格纵向大小，单位：米~%float32   grid_size_z     # //网格垂直方向大小，单位：米~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FreeSpace>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'freegrids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'freespace_region) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FreeSpace>))
  "Converts a ROS message object to a list"
  (cl:list 'FreeSpace
    (cl:cons ':header (header msg))
    (cl:cons ':freegrids (freegrids msg))
    (cl:cons ':freespace_region (freespace_region msg))
))
