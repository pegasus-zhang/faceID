; Auto-generated. Do not edit!


(cl:in-package perception_msgs-msg)


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
   (on_off
    :reader on_off
    :initarg :on_off
    :type cl:integer
    :initform 0)
   (follow_name
    :reader follow_name
    :initarg :follow_name
    :type cl:string
    :initform "")
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
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass PercCmd (<PercCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PercCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PercCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_msgs-msg:<PercCmd> is deprecated: use perception_msgs-msg:PercCmd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:header-val is deprecated.  Use perception_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action_id-val :lambda-list '(m))
(cl:defmethod action_id-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:action_id-val is deprecated.  Use perception_msgs-msg:action_id instead.")
  (action_id m))

(cl:ensure-generic-function 'perc_kind-val :lambda-list '(m))
(cl:defmethod perc_kind-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:perc_kind-val is deprecated.  Use perception_msgs-msg:perc_kind instead.")
  (perc_kind m))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:req_id-val is deprecated.  Use perception_msgs-msg:req_id instead.")
  (req_id m))

(cl:ensure-generic-function 'on_off-val :lambda-list '(m))
(cl:defmethod on_off-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:on_off-val is deprecated.  Use perception_msgs-msg:on_off instead.")
  (on_off m))

(cl:ensure-generic-function 'follow_name-val :lambda-list '(m))
(cl:defmethod follow_name-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:follow_name-val is deprecated.  Use perception_msgs-msg:follow_name instead.")
  (follow_name m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:angle-val is deprecated.  Use perception_msgs-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'point_name-val :lambda-list '(m))
(cl:defmethod point_name-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:point_name-val is deprecated.  Use perception_msgs-msg:point_name instead.")
  (point_name m))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <PercCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:point-val is deprecated.  Use perception_msgs-msg:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PercCmd>)))
    "Constants for message type '<PercCmd>"
  '((:PERC_DEST . 1)
    (:PERC_ABS . 2)
    (:PERC_REL . 3)
    (:PERC_AUTO_CHARGING . 20)
    (:PERC_CHECK_ENV . 21)
    (:PERC_AUTO_MAPPING . 22)
    (:PERC_FOLLOW . 30)
    (:PERC_STRANGER_WELCOME . 31)
    (:PERC_OWNER_WELCOME . 32)
    (:PERC_BEHAVIOR_INTERACTION . 33)
    (:PERC_HANDSHAKE . 34)
    (:PERC_STANDBY_ACCOMPANY . 35)
    (:PERC_HAPPY_ACCOMPANY . 36)
    (:PERC_WORK_ACCOMPANY . 37)
    (:PERC_POSITIVE_ACCOMPANY . 38)
    (:PERC_NEGATIVE_ACCOMPANY . 39)
    (:PERC_CHILD_WATCH . 40)
    (:PERC_OLDER_WATCH . 41)
    (:PERC_DANGER_REMINDER . 42)
    (:PERC_EVENT_REMINDER . 43)
    (:PERC_CATWALK_START . 44)
    (:PERC_CATWALK_ACT . 45)
    (:PERC_CATWALK_SHOW . 46)
    (:PERC_CATWALK_BACK . 47)
    (:PERC_FREE_TIME . 50)
    (:PERC_SOCIALIZE . 51)
    (:PERC_SPECT_PERFORM . 55)
    (:PERC_FACE_DETCTION . 56)
    (:PERC_DANGER_INFO . 60)
    (:PERC_WELCOME_DEMO . 61)
    (:PERC_LOBBY_DEMO . 62)
    (:PERC_CANCEL . 100)
    (:PERC_NODE_CLOSE . 200)
    (:PERC_NODE_START . 201)
    (:PERC_NODE_RESET . 202)
    (:FOLLOW_ON . 1)
    (:FOLLOW_OFF . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PercCmd)))
    "Constants for message type 'PercCmd"
  '((:PERC_DEST . 1)
    (:PERC_ABS . 2)
    (:PERC_REL . 3)
    (:PERC_AUTO_CHARGING . 20)
    (:PERC_CHECK_ENV . 21)
    (:PERC_AUTO_MAPPING . 22)
    (:PERC_FOLLOW . 30)
    (:PERC_STRANGER_WELCOME . 31)
    (:PERC_OWNER_WELCOME . 32)
    (:PERC_BEHAVIOR_INTERACTION . 33)
    (:PERC_HANDSHAKE . 34)
    (:PERC_STANDBY_ACCOMPANY . 35)
    (:PERC_HAPPY_ACCOMPANY . 36)
    (:PERC_WORK_ACCOMPANY . 37)
    (:PERC_POSITIVE_ACCOMPANY . 38)
    (:PERC_NEGATIVE_ACCOMPANY . 39)
    (:PERC_CHILD_WATCH . 40)
    (:PERC_OLDER_WATCH . 41)
    (:PERC_DANGER_REMINDER . 42)
    (:PERC_EVENT_REMINDER . 43)
    (:PERC_CATWALK_START . 44)
    (:PERC_CATWALK_ACT . 45)
    (:PERC_CATWALK_SHOW . 46)
    (:PERC_CATWALK_BACK . 47)
    (:PERC_FREE_TIME . 50)
    (:PERC_SOCIALIZE . 51)
    (:PERC_SPECT_PERFORM . 55)
    (:PERC_FACE_DETCTION . 56)
    (:PERC_DANGER_INFO . 60)
    (:PERC_WELCOME_DEMO . 61)
    (:PERC_LOBBY_DEMO . 62)
    (:PERC_CANCEL . 100)
    (:PERC_NODE_CLOSE . 200)
    (:PERC_NODE_START . 201)
    (:PERC_NODE_RESET . 202)
    (:FOLLOW_ON . 1)
    (:FOLLOW_OFF . 2))
)
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'on_off)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'on_off)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'on_off)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'on_off)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'follow_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'follow_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'on_off)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'on_off)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'on_off)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'on_off)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'follow_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'follow_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
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
  "perception_msgs/PercCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PercCmd)))
  "Returns string type for a message object of type 'PercCmd"
  "perception_msgs/PercCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PercCmd>)))
  "Returns md5sum for a message object of type '<PercCmd>"
  "08540cb1d7896a929933b0fa32473d34")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PercCmd)))
  "Returns md5sum for a message object of type 'PercCmd"
  "08540cb1d7896a929933b0fa32473d34")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PercCmd>)))
  "Returns full string definition for message of type '<PercCmd>"
  (cl:format cl:nil "std_msgs/Header header~%~%#动作执行id,增加含义：时间+序号~%uint64 action_id~%~%# Perceive Kind~%uint32 PERC_DEST                 = 1~%uint32 PERC_ABS                  = 2~%uint32 PERC_REL                  = 3~%~%# 自动充电~%uint32 PERC_AUTO_CHARGING        = 20~%# 环境查看~%uint32 PERC_CHECK_ENV            = 21~%# 自动建图~%uint32 PERC_AUTO_MAPPING         = 22~%~%# 跟随模式~%uint32 PERC_FOLLOW               = 30~%# 陌生人迎接~%uint32 PERC_STRANGER_WELCOME     = 31~%# 主人迎接~%uint32 PERC_OWNER_WELCOME        = 32~%# 行为互动~%uint32 PERC_BEHAVIOR_INTERACTION = 33~%# 握手动作~%uint32 PERC_HANDSHAKE            = 34~%~%# 待机陪伴~%uint32 PERC_STANDBY_ACCOMPANY    = 35~%# 娱乐陪伴~%uint32 PERC_HAPPY_ACCOMPANY      = 36~%# 工作陪伴~%uint32 PERC_WORK_ACCOMPANY       = 37~%# 积极陪伴~%uint32 PERC_POSITIVE_ACCOMPANY   = 38~%# 消极陪伴~%uint32 PERC_NEGATIVE_ACCOMPANY   = 39~%~%# 小孩看护~%uint32 PERC_CHILD_WATCH          = 40~%# 老人看护~%uint32 PERC_OLDER_WATCH          = 41~%# 危险提醒~%uint32 PERC_DANGER_REMINDER      = 42~%# 事件提醒~%uint32 PERC_EVENT_REMINDER       = 43~%# 开始走秀（语言下方，不需要感知）~%uint32 PERC_CATWALK_START        = 44~%# 走秀互动~%uint32 PERC_CATWALK_ACT          = 45~%# 走秀展示~%uint32 PERC_CATWALK_SHOW         = 46~%# 走秀返回~%uint32 PERC_CATWALK_BACK         = 47~%~%# 自由活动~%uint32 PERC_FREE_TIME            = 50~%# 社交模式~%uint32 PERC_SOCIALIZE            = 51~%# 围观场景~%uint32 PERC_SPECT_PERFORM        = 55~%# 表情分析~%uint32 PERC_FACE_DETCTION        = 56~%~%~%# 上报危险信息（不需要请求）~%uint32 PERC_DANGER_INFO          = 60~%# 欢迎模式~%uint32 PERC_WELCOME_DEMO         = 61~%# 回大厅找人~%uint32 PERC_LOBBY_DEMO           = 62~%~%# 任务取消（不需要请求）~%uint32 PERC_CANCEL               = 100~%~%uint32 PERC_NODE_CLOSE           = 200~%uint32 PERC_NODE_START           = 201~%uint32 PERC_NODE_RESET           = 202~%~%# 感知命令类型~%uint32 perc_kind~%uint64 req_id~%~%# 跟随开关~%uint32 FOLLOW_ON  = 1~%uint32 FOLLOW_OFF = 2~%uint32 on_off~%string follow_name~%~%# 目标角度~%float64 angle~%~%# 字符串表示某个位置~%string point_name~%~%# Point表示某个位置~%geometry_msgs/Point point~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PercCmd)))
  "Returns full string definition for message of type 'PercCmd"
  (cl:format cl:nil "std_msgs/Header header~%~%#动作执行id,增加含义：时间+序号~%uint64 action_id~%~%# Perceive Kind~%uint32 PERC_DEST                 = 1~%uint32 PERC_ABS                  = 2~%uint32 PERC_REL                  = 3~%~%# 自动充电~%uint32 PERC_AUTO_CHARGING        = 20~%# 环境查看~%uint32 PERC_CHECK_ENV            = 21~%# 自动建图~%uint32 PERC_AUTO_MAPPING         = 22~%~%# 跟随模式~%uint32 PERC_FOLLOW               = 30~%# 陌生人迎接~%uint32 PERC_STRANGER_WELCOME     = 31~%# 主人迎接~%uint32 PERC_OWNER_WELCOME        = 32~%# 行为互动~%uint32 PERC_BEHAVIOR_INTERACTION = 33~%# 握手动作~%uint32 PERC_HANDSHAKE            = 34~%~%# 待机陪伴~%uint32 PERC_STANDBY_ACCOMPANY    = 35~%# 娱乐陪伴~%uint32 PERC_HAPPY_ACCOMPANY      = 36~%# 工作陪伴~%uint32 PERC_WORK_ACCOMPANY       = 37~%# 积极陪伴~%uint32 PERC_POSITIVE_ACCOMPANY   = 38~%# 消极陪伴~%uint32 PERC_NEGATIVE_ACCOMPANY   = 39~%~%# 小孩看护~%uint32 PERC_CHILD_WATCH          = 40~%# 老人看护~%uint32 PERC_OLDER_WATCH          = 41~%# 危险提醒~%uint32 PERC_DANGER_REMINDER      = 42~%# 事件提醒~%uint32 PERC_EVENT_REMINDER       = 43~%# 开始走秀（语言下方，不需要感知）~%uint32 PERC_CATWALK_START        = 44~%# 走秀互动~%uint32 PERC_CATWALK_ACT          = 45~%# 走秀展示~%uint32 PERC_CATWALK_SHOW         = 46~%# 走秀返回~%uint32 PERC_CATWALK_BACK         = 47~%~%# 自由活动~%uint32 PERC_FREE_TIME            = 50~%# 社交模式~%uint32 PERC_SOCIALIZE            = 51~%# 围观场景~%uint32 PERC_SPECT_PERFORM        = 55~%# 表情分析~%uint32 PERC_FACE_DETCTION        = 56~%~%~%# 上报危险信息（不需要请求）~%uint32 PERC_DANGER_INFO          = 60~%# 欢迎模式~%uint32 PERC_WELCOME_DEMO         = 61~%# 回大厅找人~%uint32 PERC_LOBBY_DEMO           = 62~%~%# 任务取消（不需要请求）~%uint32 PERC_CANCEL               = 100~%~%uint32 PERC_NODE_CLOSE           = 200~%uint32 PERC_NODE_START           = 201~%uint32 PERC_NODE_RESET           = 202~%~%# 感知命令类型~%uint32 perc_kind~%uint64 req_id~%~%# 跟随开关~%uint32 FOLLOW_ON  = 1~%uint32 FOLLOW_OFF = 2~%uint32 on_off~%string follow_name~%~%# 目标角度~%float64 angle~%~%# 字符串表示某个位置~%string point_name~%~%# Point表示某个位置~%geometry_msgs/Point point~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PercCmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     8
     4
     4 (cl:length (cl:slot-value msg 'follow_name))
     8
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
    (cl:cons ':on_off (on_off msg))
    (cl:cons ':follow_name (follow_name msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':point_name (point_name msg))
    (cl:cons ':point (point msg))
))
