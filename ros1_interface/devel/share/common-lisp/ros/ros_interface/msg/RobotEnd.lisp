; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude RobotEnd.msg.html

(cl:defclass <RobotEnd> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (is_heading
    :reader is_heading
    :initarg :is_heading
    :type cl:boolean
    :initform cl:nil)
   (endpoint
    :reader endpoint
    :initarg :endpoint
    :type ros_interface-msg:Vector3
    :initform (cl:make-instance 'ros_interface-msg:Vector3))
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotEnd (<RobotEnd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotEnd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotEnd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<RobotEnd> is deprecated: use ros_interface-msg:RobotEnd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RobotEnd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'is_heading-val :lambda-list '(m))
(cl:defmethod is_heading-val ((m <RobotEnd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:is_heading-val is deprecated.  Use ros_interface-msg:is_heading instead.")
  (is_heading m))

(cl:ensure-generic-function 'endpoint-val :lambda-list '(m))
(cl:defmethod endpoint-val ((m <RobotEnd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:endpoint-val is deprecated.  Use ros_interface-msg:endpoint instead.")
  (endpoint m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <RobotEnd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:angle-val is deprecated.  Use ros_interface-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotEnd>) ostream)
  "Serializes a message object of type '<RobotEnd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_heading) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'endpoint) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotEnd>) istream)
  "Deserializes a message object of type '<RobotEnd>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'is_heading) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'endpoint) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotEnd>)))
  "Returns string type for a message object of type '<RobotEnd>"
  "ros_interface/RobotEnd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotEnd)))
  "Returns string type for a message object of type 'RobotEnd"
  "ros_interface/RobotEnd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotEnd>)))
  "Returns md5sum for a message object of type '<RobotEnd>"
  "79738a95184440d887069e7ba5c4e9d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotEnd)))
  "Returns md5sum for a message object of type 'RobotEnd"
  "79738a95184440d887069e7ba5c4e9d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotEnd>)))
  "Returns full string definition for message of type '<RobotEnd>"
  (cl:format cl:nil "Header   header     #  ~%bool   is_heading     # 是否是寻声导航~%Vector3   endpoint     # 导航终点~%float32   angle     # 寻声导航角度~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotEnd)))
  "Returns full string definition for message of type 'RobotEnd"
  (cl:format cl:nil "Header   header     #  ~%bool   is_heading     # 是否是寻声导航~%Vector3   endpoint     # 导航终点~%float32   angle     # 寻声导航角度~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotEnd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'endpoint))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotEnd>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotEnd
    (cl:cons ':header (header msg))
    (cl:cons ':is_heading (is_heading msg))
    (cl:cons ':endpoint (endpoint msg))
    (cl:cons ':angle (angle msg))
))
