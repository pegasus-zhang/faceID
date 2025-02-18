; Auto-generated. Do not edit!


(cl:in-package eye_msgs-msg)


;//! \htmlinclude EyeState.msg.html

(cl:defclass <EyeState> (roslisp-msg-protocol:ros-message)
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
   (exe_state
    :reader exe_state
    :initarg :exe_state
    :type cl:fixnum
    :initform 0)
   (exe_result
    :reader exe_result
    :initarg :exe_result
    :type cl:fixnum
    :initform 0)
   (err_code
    :reader err_code
    :initarg :err_code
    :type cl:fixnum
    :initform 0)
   (err_info
    :reader err_info
    :initarg :err_info
    :type cl:string
    :initform "")
   (wait_for_millisec
    :reader wait_for_millisec
    :initarg :wait_for_millisec
    :type cl:integer
    :initform 0))
)

(cl:defclass EyeState (<EyeState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EyeState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EyeState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name eye_msgs-msg:<EyeState> is deprecated: use eye_msgs-msg:EyeState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:header-val is deprecated.  Use eye_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action_id-val :lambda-list '(m))
(cl:defmethod action_id-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:action_id-val is deprecated.  Use eye_msgs-msg:action_id instead.")
  (action_id m))

(cl:ensure-generic-function 'eye_kind-val :lambda-list '(m))
(cl:defmethod eye_kind-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:eye_kind-val is deprecated.  Use eye_msgs-msg:eye_kind instead.")
  (eye_kind m))

(cl:ensure-generic-function 'exe_state-val :lambda-list '(m))
(cl:defmethod exe_state-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:exe_state-val is deprecated.  Use eye_msgs-msg:exe_state instead.")
  (exe_state m))

(cl:ensure-generic-function 'exe_result-val :lambda-list '(m))
(cl:defmethod exe_result-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:exe_result-val is deprecated.  Use eye_msgs-msg:exe_result instead.")
  (exe_result m))

(cl:ensure-generic-function 'err_code-val :lambda-list '(m))
(cl:defmethod err_code-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:err_code-val is deprecated.  Use eye_msgs-msg:err_code instead.")
  (err_code m))

(cl:ensure-generic-function 'err_info-val :lambda-list '(m))
(cl:defmethod err_info-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:err_info-val is deprecated.  Use eye_msgs-msg:err_info instead.")
  (err_info m))

(cl:ensure-generic-function 'wait_for_millisec-val :lambda-list '(m))
(cl:defmethod wait_for_millisec-val ((m <EyeState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eye_msgs-msg:wait_for_millisec-val is deprecated.  Use eye_msgs-msg:wait_for_millisec instead.")
  (wait_for_millisec m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<EyeState>)))
    "Constants for message type '<EyeState>"
  '((:ACTION_IDLE . 0)
    (:ACTION_RUNNING . 1)
    (:ACTION_DONE . 2)
    (:ACTION_NONE . 0)
    (:ACTION_SUCCESS . 1)
    (:ACTION_FAIL . 2)
    (:ACTION_ERR_NONE . 0)
    (:ACTION_ERR_NOWORK . 1)
    (:EYE_FACE_RECORD . 5)
    (:EYE_BODY_RECORD . 6)
    (:EYE_WELCOME_DEMO . 61)
    (:EYE_LOBBY_DEMO . 62)
    (:EYE_CANCEL . 100))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'EyeState)))
    "Constants for message type 'EyeState"
  '((:ACTION_IDLE . 0)
    (:ACTION_RUNNING . 1)
    (:ACTION_DONE . 2)
    (:ACTION_NONE . 0)
    (:ACTION_SUCCESS . 1)
    (:ACTION_FAIL . 2)
    (:ACTION_ERR_NONE . 0)
    (:ACTION_ERR_NOWORK . 1)
    (:EYE_FACE_RECORD . 5)
    (:EYE_BODY_RECORD . 6)
    (:EYE_WELCOME_DEMO . 61)
    (:EYE_LOBBY_DEMO . 62)
    (:EYE_CANCEL . 100))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EyeState>) ostream)
  "Serializes a message object of type '<EyeState>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exe_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exe_result)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'err_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'err_code)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'err_info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'err_info))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'wait_for_millisec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'wait_for_millisec)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EyeState>) istream)
  "Deserializes a message object of type '<EyeState>"
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exe_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exe_result)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'err_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'err_code)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'err_info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'wait_for_millisec)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EyeState>)))
  "Returns string type for a message object of type '<EyeState>"
  "eye_msgs/EyeState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EyeState)))
  "Returns string type for a message object of type 'EyeState"
  "eye_msgs/EyeState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EyeState>)))
  "Returns md5sum for a message object of type '<EyeState>"
  "41f7fe8eaece5c7faa443d0f00d98c30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EyeState)))
  "Returns md5sum for a message object of type 'EyeState"
  "41f7fe8eaece5c7faa443d0f00d98c30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EyeState>)))
  "Returns full string definition for message of type '<EyeState>"
  (cl:format cl:nil "std_msgs/Header header~%~%# ActionState~%uint8 ACTION_IDLE = 0~%uint8 ACTION_RUNNING = 1~%uint8 ACTION_DONE = 2~%~%# ActionResult~%uint8 ACTION_NONE = 0~%uint8 ACTION_SUCCESS = 1~%uint8 ACTION_FAIL = 2~%~%# ErrCode~%uint16 ACTION_ERR_NONE = 0~%uint16 ACTION_ERR_NOWORK = 1~%~%# 当前执行的id~%uint64 action_id~%~%# 人脸录入~%uint32 EYE_FACE_RECORD          = 5~%uint32 EYE_BODY_RECORD          = 6 ~%# 欢迎模式~%uint32 EYE_WELCOME_DEMO         = 61~%# 回大厅找人~%uint32 EYE_LOBBY_DEMO           = 62~%~%# 任务取消（不需要请求）~%uint32 EYE_CANCEL               = 100~%~%# 类型~%uint32 eye_kind~%# 执行状态：空闲/正在执行/执行完成~%uint8 exe_state~%# 执行结果：无效/成功/失败~%uint8 exe_result~%~%# 错误码~%uint16 err_code~%# 错误消息~%string err_info~%# 剩余执行时间~%uint64 wait_for_millisec~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EyeState)))
  "Returns full string definition for message of type 'EyeState"
  (cl:format cl:nil "std_msgs/Header header~%~%# ActionState~%uint8 ACTION_IDLE = 0~%uint8 ACTION_RUNNING = 1~%uint8 ACTION_DONE = 2~%~%# ActionResult~%uint8 ACTION_NONE = 0~%uint8 ACTION_SUCCESS = 1~%uint8 ACTION_FAIL = 2~%~%# ErrCode~%uint16 ACTION_ERR_NONE = 0~%uint16 ACTION_ERR_NOWORK = 1~%~%# 当前执行的id~%uint64 action_id~%~%# 人脸录入~%uint32 EYE_FACE_RECORD          = 5~%uint32 EYE_BODY_RECORD          = 6 ~%# 欢迎模式~%uint32 EYE_WELCOME_DEMO         = 61~%# 回大厅找人~%uint32 EYE_LOBBY_DEMO           = 62~%~%# 任务取消（不需要请求）~%uint32 EYE_CANCEL               = 100~%~%# 类型~%uint32 eye_kind~%# 执行状态：空闲/正在执行/执行完成~%uint8 exe_state~%# 执行结果：无效/成功/失败~%uint8 exe_result~%~%# 错误码~%uint16 err_code~%# 错误消息~%string err_info~%# 剩余执行时间~%uint64 wait_for_millisec~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EyeState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     1
     1
     2
     4 (cl:length (cl:slot-value msg 'err_info))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EyeState>))
  "Converts a ROS message object to a list"
  (cl:list 'EyeState
    (cl:cons ':header (header msg))
    (cl:cons ':action_id (action_id msg))
    (cl:cons ':eye_kind (eye_kind msg))
    (cl:cons ':exe_state (exe_state msg))
    (cl:cons ':exe_result (exe_result msg))
    (cl:cons ':err_code (err_code msg))
    (cl:cons ':err_info (err_info msg))
    (cl:cons ':wait_for_millisec (wait_for_millisec msg))
))
