; Auto-generated. Do not edit!


(cl:in-package eye_msgs-msg)


;//! \htmlinclude EyeCmd.msg.html

(cl:defclass <EyeCmd> (roslisp-msg-protocol:ros-message)
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
   (eye_kind
    :reader eye_kind
    :initarg :eye_kind
    :type cl:integer
    :initform 0)
   (human_name
    :reader human_name
    :initarg :human_name
    :type cl:string
    :initform ""))
)

(cl:defclass EyeCmd (<EyeCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EyeCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EyeCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name eye_msgs-msg:<EyeCmd> is deprecated: use eye_msgs-msg:EyeCmd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EyeCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:header-val is deprecated.  Use eye_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action_id-val :lambda-list '(m))
(cl:defmethod action_id-val ((m <EyeCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:action_id-val is deprecated.  Use eye_msgs-msg:action_id instead.")
  (action_id m))

(cl:ensure-generic-function 'eye_kind-val :lambda-list '(m))
(cl:defmethod eye_kind-val ((m <EyeCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:eye_kind-val is deprecated.  Use eye_msgs-msg:eye_kind instead.")
  (eye_kind m))

(cl:ensure-generic-function 'human_name-val :lambda-list '(m))
(cl:defmethod human_name-val ((m <EyeCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:human_name-val is deprecated.  Use eye_msgs-msg:human_name instead.")
  (human_name m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<EyeCmd>)))
    "Constants for message type '<EyeCmd>"
  '((:EYE_FACE_RECORD . 5)
    (:EYE_BODY_RECORD . 6)
    (:EYE_WELCOME_DEMO . 61)
    (:EYE_LOBBY_DEMO . 62)
    (:EYE_CANCEL . 100))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'EyeCmd)))
    "Constants for message type 'EyeCmd"
  '((:EYE_FACE_RECORD . 5)
    (:EYE_BODY_RECORD . 6)
    (:EYE_WELCOME_DEMO . 61)
    (:EYE_LOBBY_DEMO . 62)
    (:EYE_CANCEL . 100))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EyeCmd>) ostream)
  "Serializes a message object of type '<EyeCmd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'eye_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'eye_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'eye_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'eye_kind)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'human_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'human_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EyeCmd>) istream)
  "Deserializes a message object of type '<EyeCmd>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'action_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'eye_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'eye_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'eye_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'eye_kind)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'human_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'human_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EyeCmd>)))
  "Returns string type for a message object of type '<EyeCmd>"
  "eye_msgs/EyeCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EyeCmd)))
  "Returns string type for a message object of type 'EyeCmd"
  "eye_msgs/EyeCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EyeCmd>)))
  "Returns md5sum for a message object of type '<EyeCmd>"
  "b7afd2407918ee30626ee4948899aad8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EyeCmd)))
  "Returns md5sum for a message object of type 'EyeCmd"
  "b7afd2407918ee30626ee4948899aad8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EyeCmd>)))
  "Returns full string definition for message of type '<EyeCmd>"
  (cl:format cl:nil "std_msgs/Header header~%~%#动作执行id,增加含义：时间+序号~%uint64 action_id~%~%# 人脸录入~%uint32 EYE_FACE_RECORD          = 5~%uint32 EYE_BODY_RECORD          = 6        ~%~%# 欢迎模式~%uint32 EYE_WELCOME_DEMO         = 61~%# 回大厅找人~%uint32 EYE_LOBBY_DEMO           = 62~%~%# 任务取消~%uint32 EYE_CANCEL               = 100~%~%# 类型~%uint32 eye_kind~%~%# 人的名字~%string human_name~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EyeCmd)))
  "Returns full string definition for message of type 'EyeCmd"
  (cl:format cl:nil "std_msgs/Header header~%~%#动作执行id,增加含义：时间+序号~%uint64 action_id~%~%# 人脸录入~%uint32 EYE_FACE_RECORD          = 5~%uint32 EYE_BODY_RECORD          = 6        ~%~%# 欢迎模式~%uint32 EYE_WELCOME_DEMO         = 61~%# 回大厅找人~%uint32 EYE_LOBBY_DEMO           = 62~%~%# 任务取消~%uint32 EYE_CANCEL               = 100~%~%# 类型~%uint32 eye_kind~%~%# 人的名字~%string human_name~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EyeCmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     4 (cl:length (cl:slot-value msg 'human_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EyeCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'EyeCmd
    (cl:cons ':header (header msg))
    (cl:cons ':action_id (action_id msg))
    (cl:cons ':eye_kind (eye_kind msg))
    (cl:cons ':human_name (human_name msg))
))
