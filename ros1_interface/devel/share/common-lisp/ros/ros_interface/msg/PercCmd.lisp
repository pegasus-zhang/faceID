; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude PercCmd.msg.html

(cl:defclass <PercCmd> (roslisp-msg-protocol:ros-message)
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
   (perc_kind
    :reader perc_kind
    :initarg :perc_kind
    :type cl:integer
    :initform 0)
   (req_id
    :reader req_id
    :initarg :req_id
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (point_name
    :reader point_name
    :initarg :point_name
    :type cl:string
    :initform "")
   (point
    :reader point
    :initarg :point
    :type ros_interface-msg:Point
    :initform (cl:make-instance 'ros_interface-msg:Point)))
)

(cl:defclass PercCmd (<PercCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PercCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PercCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<PercCmd> is deprecated: use ros_interface-msg:PercCmd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action_id-val :lambda-list '(m))
(cl:defmethod action_id-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:action_id-val is deprecated.  Use ros_interface-msg:action_id instead.")
  (action_id m))

(cl:ensure-generic-function 'perc_kind-val :lambda-list '(m))
(cl:defmethod perc_kind-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:perc_kind-val is deprecated.  Use ros_interface-msg:perc_kind instead.")
  (perc_kind m))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:req_id-val is deprecated.  Use ros_interface-msg:req_id instead.")
  (req_id m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:angle-val is deprecated.  Use ros_interface-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'point_name-val :lambda-list '(m))
(cl:defmethod point_name-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:point_name-val is deprecated.  Use ros_interface-msg:point_name instead.")
  (point_name m))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:point-val is deprecated.  Use ros_interface-msg:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PercCmd>) ostream)
  "Serializes a message object of type '<PercCmd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'action_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'action_id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'perc_kind)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'req_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'point_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'point_name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PercCmd>) istream)
  "Deserializes a message object of type '<PercCmd>"
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
      (cl:setf (cl:slot-value msg 'perc_kind) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'point_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'point_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PercCmd>)))
  "Returns string type for a message object of type '<PercCmd>"
  "ros_interface/PercCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PercCmd)))
  "Returns string type for a message object of type 'PercCmd"
  "ros_interface/PercCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PercCmd>)))
  "Returns md5sum for a message object of type '<PercCmd>"
  "2ee16e7d49b47f91bbd34c18cdee9485")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PercCmd)))
  "Returns md5sum for a message object of type 'PercCmd"
  "2ee16e7d49b47f91bbd34c18cdee9485")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PercCmd>)))
  "Returns full string definition for message of type '<PercCmd>"
  (cl:format cl:nil "Header   header     #  ~%uint64   action_id     # #动作执行id~%int32   perc_kind     # # Perception Kind 枚举类型 uint32 PERC_DEST   = 1   #点到点 uint32 PERC_ABS    = 2   #绝对位置 uint32 PERC_REL    = 3    #相对位置 uint32 PERC_AUTO_CHARGING   = 20  # 自动充电 uint32 PERC_CHECK_ENV       = 21  # 环境查看 uint32 PERC_AUTO_MAPPING    = 22  # 自动建图 uint32 PERC_FOLLOW               = 30  # 跟随模式 uint32 PERC_STRANGER_WELCOME     = 31  # 陌生人迎接 uint32 PERC_OWNER_WELCOME        = 32  # 主人迎接 uint32 PERC_BEHAVIOR_INTERACTION = 33  # 行为互动 uint32 PERC_HANDSHAKE            = 34   # 握手动作 uint32 PERC_STANDBY_ACCOMPANY    = 35  # 待机陪伴 uint32 PERC_HAPPY_ACCOMPANY      = 36  # 娱乐陪伴 uint32 PERC_WORK_ACCOMPANY       = 37  # 工作陪伴 uint32 PERC_POSITIVE_ACCOMPANY   = 38  # 积极陪伴 uint32 PERC_NEGATIVE_ACCOMPANY   = 39  # 消极陪伴 uint32 PERC_CHILD_WATCH          = 40  # 小孩看护 uint32 PERC_OLDER_WATCH          = 41  # 老人看护 uint32 PERC_DANGER_REMINDER      = 42   # 危险提醒 uint32 PERC_EVENT_REMINDER       = 43  # 事件提醒 uint32 PERC_CATWALK_START        = 44  # 开始走秀 uint32 PERC_CATWALK_ACT          = 45  # 走秀互动 uint32 PERC_CATWALK_SHOW         = 46  # 走秀展示 uint32 PERC_CATWALK_BACK         = 47  # 走秀返回 uint32 PERC_FREE_TIME   = 50  # 自由活动 uint32 PERC_SOCIALIZE   = 51  # 社交模式 uint32 PERC_DANGER_INFO = 60  # 上报危险信息（不需要请求） uint32 PERC_CANCEL      = 100  # 任务取消（不需要请求） uint32 PERC_NODE_CLOSE = 200  #关闭指令 uint32 PERC_NODE_START = 201  #启动指令 uint32 PERC_NODE_RESET = 202  #重启指令~%uint64   req_id     # #发送请求的id，可以先不用管，调试使用~%float32   angle     # # 语音的角度~%string   point_name     # # 字符串表示某个位置（语义位置）~%Point   point     # geometry_msgs/Point point  # Point表示某个位置~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Point~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PercCmd)))
  "Returns full string definition for message of type 'PercCmd"
  (cl:format cl:nil "Header   header     #  ~%uint64   action_id     # #动作执行id~%int32   perc_kind     # # Perception Kind 枚举类型 uint32 PERC_DEST   = 1   #点到点 uint32 PERC_ABS    = 2   #绝对位置 uint32 PERC_REL    = 3    #相对位置 uint32 PERC_AUTO_CHARGING   = 20  # 自动充电 uint32 PERC_CHECK_ENV       = 21  # 环境查看 uint32 PERC_AUTO_MAPPING    = 22  # 自动建图 uint32 PERC_FOLLOW               = 30  # 跟随模式 uint32 PERC_STRANGER_WELCOME     = 31  # 陌生人迎接 uint32 PERC_OWNER_WELCOME        = 32  # 主人迎接 uint32 PERC_BEHAVIOR_INTERACTION = 33  # 行为互动 uint32 PERC_HANDSHAKE            = 34   # 握手动作 uint32 PERC_STANDBY_ACCOMPANY    = 35  # 待机陪伴 uint32 PERC_HAPPY_ACCOMPANY      = 36  # 娱乐陪伴 uint32 PERC_WORK_ACCOMPANY       = 37  # 工作陪伴 uint32 PERC_POSITIVE_ACCOMPANY   = 38  # 积极陪伴 uint32 PERC_NEGATIVE_ACCOMPANY   = 39  # 消极陪伴 uint32 PERC_CHILD_WATCH          = 40  # 小孩看护 uint32 PERC_OLDER_WATCH          = 41  # 老人看护 uint32 PERC_DANGER_REMINDER      = 42   # 危险提醒 uint32 PERC_EVENT_REMINDER       = 43  # 事件提醒 uint32 PERC_CATWALK_START        = 44  # 开始走秀 uint32 PERC_CATWALK_ACT          = 45  # 走秀互动 uint32 PERC_CATWALK_SHOW         = 46  # 走秀展示 uint32 PERC_CATWALK_BACK         = 47  # 走秀返回 uint32 PERC_FREE_TIME   = 50  # 自由活动 uint32 PERC_SOCIALIZE   = 51  # 社交模式 uint32 PERC_DANGER_INFO = 60  # 上报危险信息（不需要请求） uint32 PERC_CANCEL      = 100  # 任务取消（不需要请求） uint32 PERC_NODE_CLOSE = 200  #关闭指令 uint32 PERC_NODE_START = 201  #启动指令 uint32 PERC_NODE_RESET = 202  #重启指令~%uint64   req_id     # #发送请求的id，可以先不用管，调试使用~%float32   angle     # # 语音的角度~%string   point_name     # # 字符串表示某个位置（语义位置）~%Point   point     # geometry_msgs/Point point  # Point表示某个位置~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Point~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PercCmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     8
     4
     4 (cl:length (cl:slot-value msg 'point_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PercCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'PercCmd
    (cl:cons ':header (header msg))
    (cl:cons ':action_id (action_id msg))
    (cl:cons ':perc_kind (perc_kind msg))
    (cl:cons ':req_id (req_id msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':point_name (point_name msg))
    (cl:cons ':point (point msg))
))
