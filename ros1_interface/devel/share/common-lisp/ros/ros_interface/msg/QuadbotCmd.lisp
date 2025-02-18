; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude QuadbotCmd.msg.html

(cl:defclass <QuadbotCmd> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (action_id
    :reader action_id
    :initarg :action_id
    :type cl:integer
    :initform 0)
   (quadbot_kind
    :reader quadbot_kind
    :initarg :quadbot_kind
    :type cl:integer
    :initform 0)
   (action_name
    :reader action_name
    :initarg :action_name
    :type cl:string
    :initform "")
   (twist
    :reader twist
    :initarg :twist
    :type ros_interface-msg:Twist
    :initform (cl:make-instance 'ros_interface-msg:Twist))
   (complex_cmd
    :reader complex_cmd
    :initarg :complex_cmd
    :type ros_interface-msg:ComplexCommand
    :initform (cl:make-instance 'ros_interface-msg:ComplexCommand)))
)

(cl:defclass QuadbotCmd (<QuadbotCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QuadbotCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QuadbotCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<QuadbotCmd> is deprecated: use ros_interface-msg:QuadbotCmd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <QuadbotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action_id-val :lambda-list '(m))
(cl:defmethod action_id-val ((m <QuadbotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:action_id-val is deprecated.  Use ros_interface-msg:action_id instead.")
  (action_id m))

(cl:ensure-generic-function 'quadbot_kind-val :lambda-list '(m))
(cl:defmethod quadbot_kind-val ((m <QuadbotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:quadbot_kind-val is deprecated.  Use ros_interface-msg:quadbot_kind instead.")
  (quadbot_kind m))

(cl:ensure-generic-function 'action_name-val :lambda-list '(m))
(cl:defmethod action_name-val ((m <QuadbotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:action_name-val is deprecated.  Use ros_interface-msg:action_name instead.")
  (action_name m))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <QuadbotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:twist-val is deprecated.  Use ros_interface-msg:twist instead.")
  (twist m))

(cl:ensure-generic-function 'complex_cmd-val :lambda-list '(m))
(cl:defmethod complex_cmd-val ((m <QuadbotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:complex_cmd-val is deprecated.  Use ros_interface-msg:complex_cmd instead.")
  (complex_cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QuadbotCmd>) ostream)
  "Serializes a message object of type '<QuadbotCmd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'action_id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'quadbot_kind)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'complex_cmd) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QuadbotCmd>) istream)
  "Deserializes a message object of type '<QuadbotCmd>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'quadbot_kind) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'complex_cmd) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QuadbotCmd>)))
  "Returns string type for a message object of type '<QuadbotCmd>"
  "ros_interface/QuadbotCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QuadbotCmd)))
  "Returns string type for a message object of type 'QuadbotCmd"
  "ros_interface/QuadbotCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QuadbotCmd>)))
  "Returns md5sum for a message object of type '<QuadbotCmd>"
  "b913b00e78766226918c3d24c7939f9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QuadbotCmd)))
  "Returns md5sum for a message object of type 'QuadbotCmd"
  "b913b00e78766226918c3d24c7939f9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QuadbotCmd>)))
  "Returns full string definition for message of type '<QuadbotCmd>"
  (cl:format cl:nil "Header   header     #  ~%uint64   action_id     # #动作执行id~%int32   quadbot_kind     # #简单指令（坐下...）；复杂指令（走直线/走圆弧）~%string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了~%Twist   twist     #  ~%ComplexCommand   complex_cmd     # #规划端不使用这个指令~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Twist~%Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/ComplexCommand~%uint8   type_id     #  ~%uint8   unit_id     #  ~%float32   data_a     #  ~%float32   data_b     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QuadbotCmd)))
  "Returns full string definition for message of type 'QuadbotCmd"
  (cl:format cl:nil "Header   header     #  ~%uint64   action_id     # #动作执行id~%int32   quadbot_kind     # #简单指令（坐下...）；复杂指令（走直线/走圆弧）~%string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了~%Twist   twist     #  ~%ComplexCommand   complex_cmd     # #规划端不使用这个指令~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Twist~%Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/ComplexCommand~%uint8   type_id     #  ~%uint8   unit_id     #  ~%float32   data_a     #  ~%float32   data_b     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QuadbotCmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     4 (cl:length (cl:slot-value msg 'action_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'complex_cmd))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QuadbotCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'QuadbotCmd
    (cl:cons ':header (header msg))
    (cl:cons ':action_id (action_id msg))
    (cl:cons ':quadbot_kind (quadbot_kind msg))
    (cl:cons ':action_name (action_name msg))
    (cl:cons ':twist (twist msg))
    (cl:cons ':complex_cmd (complex_cmd msg))
))
