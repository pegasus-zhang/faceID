; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Header.msg.html

(cl:defclass <Header> (roslisp-msg-protocol:ros-message)
  ((seq
    :reader seq
    :initarg :seq
    :type cl:integer
    :initform 0)
   (stamp
    :reader stamp
    :initarg :stamp
    :type ros_interface-msg:Time
    :initform (cl:make-instance 'ros_interface-msg:Time))
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:string
    :initform ""))
)

(cl:defclass Header (<Header>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Header>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Header)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Header> is deprecated: use ros_interface-msg:Header instead.")))

(cl:ensure-generic-function 'seq-val :lambda-list '(m))
(cl:defmethod seq-val ((m <Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:seq-val is deprecated.  Use ros_interface-msg:seq instead.")
  (seq m))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:stamp-val is deprecated.  Use ros_interface-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:frame_id-val is deprecated.  Use ros_interface-msg:frame_id instead.")
  (frame_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Header>) ostream)
  "Serializes a message object of type '<Header>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seq)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'stamp) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Header>) istream)
  "Deserializes a message object of type '<Header>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seq)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'stamp) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Header>)))
  "Returns string type for a message object of type '<Header>"
  "ros_interface/Header")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Header)))
  "Returns string type for a message object of type 'Header"
  "ros_interface/Header")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Header>)))
  "Returns md5sum for a message object of type '<Header>"
  "0c5bf43024b68e0783400bcaa26f13ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Header)))
  "Returns md5sum for a message object of type 'Header"
  "0c5bf43024b68e0783400bcaa26f13ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Header>)))
  "Returns full string definition for message of type '<Header>"
  (cl:format cl:nil "uint32   seq     # std_msgs.Sequence number for each message. Each module maintains its own counter for sequence_num, always starting from 1 on boot.~%Time   stamp     # 时间戳~%string   frame_id     # 帧id~%~%================================================================================~%MSG: ros_interface/Time~%uint32   sec     # builtin_interfaces.秒~%uint32   nanosec     # 纳秒~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Header)))
  "Returns full string definition for message of type 'Header"
  (cl:format cl:nil "uint32   seq     # std_msgs.Sequence number for each message. Each module maintains its own counter for sequence_num, always starting from 1 on boot.~%Time   stamp     # 时间戳~%string   frame_id     # 帧id~%~%================================================================================~%MSG: ros_interface/Time~%uint32   sec     # builtin_interfaces.秒~%uint32   nanosec     # 纳秒~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Header>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'stamp))
     4 (cl:length (cl:slot-value msg 'frame_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Header>))
  "Converts a ROS message object to a list"
  (cl:list 'Header
    (cl:cons ':seq (seq msg))
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':frame_id (frame_id msg))
))
