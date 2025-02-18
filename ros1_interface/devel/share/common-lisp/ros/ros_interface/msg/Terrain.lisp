; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Terrain.msg.html

(cl:defclass <Terrain> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (sub_type
    :reader sub_type
    :initarg :sub_type
    :type cl:integer
    :initform 0))
)

(cl:defclass Terrain (<Terrain>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Terrain>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Terrain)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Terrain> is deprecated: use ros_interface-msg:Terrain instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Terrain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Terrain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:type-val is deprecated.  Use ros_interface-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'sub_type-val :lambda-list '(m))
(cl:defmethod sub_type-val ((m <Terrain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:sub_type-val is deprecated.  Use ros_interface-msg:sub_type instead.")
  (sub_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Terrain>) ostream)
  "Serializes a message object of type '<Terrain>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sub_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Terrain>) istream)
  "Deserializes a message object of type '<Terrain>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sub_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Terrain>)))
  "Returns string type for a message object of type '<Terrain>"
  "ros_interface/Terrain")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Terrain)))
  "Returns string type for a message object of type 'Terrain"
  "ros_interface/Terrain")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Terrain>)))
  "Returns md5sum for a message object of type '<Terrain>"
  "97919d0c95de1d91d1adc1ba724ac117")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Terrain)))
  "Returns md5sum for a message object of type 'Terrain"
  "97919d0c95de1d91d1adc1ba724ac117")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Terrain>)))
  "Returns full string definition for message of type '<Terrain>"
  (cl:format cl:nil "Header   header     #  ~%int32   type     # #室内或者室外，TYPE=0//未知，TYPE=1//室内，TYPE=2//室外~%int32   sub_type     # #地形类型，SUB_TYPE=0//未知地形，SUB_TYPE=1//水泥路面，SUB_TYPE=2//光滑路面，SUB_TYPE=3//沙地，UB_TYPE=4//碎石路面，SUB_TYPE=5//草地，SUB_TYPE=6//坑洼，SUB_TYPE=7//地毯，SUB_TYPE=8//斜坡，SUB_TYPE=9//阶梯，SUB_TYPE=10//木地板,SUB_TYPE=11//瓷砖~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Terrain)))
  "Returns full string definition for message of type 'Terrain"
  (cl:format cl:nil "Header   header     #  ~%int32   type     # #室内或者室外，TYPE=0//未知，TYPE=1//室内，TYPE=2//室外~%int32   sub_type     # #地形类型，SUB_TYPE=0//未知地形，SUB_TYPE=1//水泥路面，SUB_TYPE=2//光滑路面，SUB_TYPE=3//沙地，UB_TYPE=4//碎石路面，SUB_TYPE=5//草地，SUB_TYPE=6//坑洼，SUB_TYPE=7//地毯，SUB_TYPE=8//斜坡，SUB_TYPE=9//阶梯，SUB_TYPE=10//木地板,SUB_TYPE=11//瓷砖~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Terrain>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Terrain>))
  "Converts a ROS message object to a list"
  (cl:list 'Terrain
    (cl:cons ':header (header msg))
    (cl:cons ':type (type msg))
    (cl:cons ':sub_type (sub_type msg))
))
