; Auto-generated. Do not edit!


(cl:in-package perception_msgs-msg)


;//! \htmlinclude PercReq.msg.html

(cl:defclass <PercReq> (roslisp-msg-protocol:ros-message)
  ((req_id
    :reader req_id
    :initarg :req_id
    :type cl:integer
    :initform 0)
   (perc_kind
    :reader perc_kind
    :initarg :perc_kind
    :type cl:integer
    :initform 0)
   (danger_info
    :reader danger_info
    :initarg :danger_info
    :type cl:string
    :initform ""))
)

(cl:defclass PercReq (<PercReq>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PercReq>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PercReq)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_msgs-msg:<PercReq> is deprecated: use perception_msgs-msg:PercReq instead.")))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <PercReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:req_id-val is deprecated.  Use perception_msgs-msg:req_id instead.")
  (req_id m))

(cl:ensure-generic-function 'perc_kind-val :lambda-list '(m))
(cl:defmethod perc_kind-val ((m <PercReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:perc_kind-val is deprecated.  Use perception_msgs-msg:perc_kind instead.")
  (perc_kind m))

(cl:ensure-generic-function 'danger_info-val :lambda-list '(m))
(cl:defmethod danger_info-val ((m <PercReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_msgs-msg:danger_info-val is deprecated.  Use perception_msgs-msg:danger_info instead.")
  (danger_info m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PercReq>)))
    "Constants for message type '<PercReq>"
  '((:PERC_AUTO_CHARGING . 20)
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
    (:PERC_DANGER_INFO . 60)
    (:PERC_HAND_OK . 70)
    (:PERC_HAND_V . 71)
    (:PERC_HAND_SHAKE . 72)
    (:PERC_HAND_COME . 73)
    (:PERC_HAND_WAVE . 74)
    (:PERC_CANCEL . 100))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PercReq)))
    "Constants for message type 'PercReq"
  '((:PERC_AUTO_CHARGING . 20)
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
    (:PERC_DANGER_INFO . 60)
    (:PERC_HAND_OK . 70)
    (:PERC_HAND_V . 71)
    (:PERC_HAND_SHAKE . 72)
    (:PERC_HAND_COME . 73)
    (:PERC_HAND_WAVE . 74)
    (:PERC_CANCEL . 100))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PercReq>) ostream)
  "Serializes a message object of type '<PercReq>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'req_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'perc_kind)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'danger_info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'danger_info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PercReq>) istream)
  "Deserializes a message object of type '<PercReq>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'req_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'perc_kind)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'danger_info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'danger_info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PercReq>)))
  "Returns string type for a message object of type '<PercReq>"
  "perception_msgs/PercReq")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PercReq)))
  "Returns string type for a message object of type 'PercReq"
  "perception_msgs/PercReq")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PercReq>)))
  "Returns md5sum for a message object of type '<PercReq>"
  "2b66ac864838d8385327b5e39c1efa29")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PercReq)))
  "Returns md5sum for a message object of type 'PercReq"
  "2b66ac864838d8385327b5e39c1efa29")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PercReq>)))
  "Returns full string definition for message of type '<PercReq>"
  (cl:format cl:nil "~%# 动作执行id,增加含义：时间+序号 ~%uint64 req_id~%~%# Perceive Kind~%~%# 自动充电~%uint32 PERC_AUTO_CHARGING        = 20~%# 环境查看~%uint32 PERC_CHECK_ENV            = 21~%# 自动建图~%uint32 PERC_AUTO_MAPPING         = 22~%~%# 跟随模式~%uint32 PERC_FOLLOW               = 30~%# 陌生人迎接~%uint32 PERC_STRANGER_WELCOME     = 31~%# 主人迎接~%uint32 PERC_OWNER_WELCOME        = 32~%# 行为互动~%uint32 PERC_BEHAVIOR_INTERACTION = 33~%# 握手动作~%uint32 PERC_HANDSHAKE            = 34~%~%# 待机陪伴~%uint32 PERC_STANDBY_ACCOMPANY    = 35~%# 娱乐陪伴~%uint32 PERC_HAPPY_ACCOMPANY      = 36~%# 工作陪伴~%uint32 PERC_WORK_ACCOMPANY       = 37~%# 积极陪伴~%uint32 PERC_POSITIVE_ACCOMPANY   = 38~%# 消极陪伴~%uint32 PERC_NEGATIVE_ACCOMPANY   = 39~%~%# 小孩看护~%uint32 PERC_CHILD_WATCH          = 40~%# 老人看护~%uint32 PERC_OLDER_WATCH          = 41~%# 危险提醒~%uint32 PERC_DANGER_REMINDER      = 42~%# 事件提醒~%uint32 PERC_EVENT_REMINDER       = 43~%# 开始走秀（语言下方，不需要感知）~%uint32 PERC_CATWALK_START        = 44~%# 走秀互动~%uint32 PERC_CATWALK_ACT          = 45~%# 走秀展示~%uint32 PERC_CATWALK_SHOW         = 46~%# 走秀返回~%uint32 PERC_CATWALK_BACK         = 47~%~%# 自由活动~%uint32 PERC_FREE_TIME            = 50~%# 社交模式~%uint32 PERC_SOCIALIZE            = 51~%~%# 上报危险信息（不需要请求）~%uint32 PERC_DANGER_INFO          = 60~%~%uint32 PERC_HAND_OK              = 70~%uint32 PERC_HAND_V               = 71~%uint32 PERC_HAND_SHAKE           = 72~%uint32 PERC_HAND_COME            = 73~%uint32 PERC_HAND_WAVE            = 74~%~%# 任务取消（不需要请求）~%uint32 PERC_CANCEL               = 100~%~%# 感知类型~%uint32 perc_kind~%~%# 危险信息~%string danger_info~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PercReq)))
  "Returns full string definition for message of type 'PercReq"
  (cl:format cl:nil "~%# 动作执行id,增加含义：时间+序号 ~%uint64 req_id~%~%# Perceive Kind~%~%# 自动充电~%uint32 PERC_AUTO_CHARGING        = 20~%# 环境查看~%uint32 PERC_CHECK_ENV            = 21~%# 自动建图~%uint32 PERC_AUTO_MAPPING         = 22~%~%# 跟随模式~%uint32 PERC_FOLLOW               = 30~%# 陌生人迎接~%uint32 PERC_STRANGER_WELCOME     = 31~%# 主人迎接~%uint32 PERC_OWNER_WELCOME        = 32~%# 行为互动~%uint32 PERC_BEHAVIOR_INTERACTION = 33~%# 握手动作~%uint32 PERC_HANDSHAKE            = 34~%~%# 待机陪伴~%uint32 PERC_STANDBY_ACCOMPANY    = 35~%# 娱乐陪伴~%uint32 PERC_HAPPY_ACCOMPANY      = 36~%# 工作陪伴~%uint32 PERC_WORK_ACCOMPANY       = 37~%# 积极陪伴~%uint32 PERC_POSITIVE_ACCOMPANY   = 38~%# 消极陪伴~%uint32 PERC_NEGATIVE_ACCOMPANY   = 39~%~%# 小孩看护~%uint32 PERC_CHILD_WATCH          = 40~%# 老人看护~%uint32 PERC_OLDER_WATCH          = 41~%# 危险提醒~%uint32 PERC_DANGER_REMINDER      = 42~%# 事件提醒~%uint32 PERC_EVENT_REMINDER       = 43~%# 开始走秀（语言下方，不需要感知）~%uint32 PERC_CATWALK_START        = 44~%# 走秀互动~%uint32 PERC_CATWALK_ACT          = 45~%# 走秀展示~%uint32 PERC_CATWALK_SHOW         = 46~%# 走秀返回~%uint32 PERC_CATWALK_BACK         = 47~%~%# 自由活动~%uint32 PERC_FREE_TIME            = 50~%# 社交模式~%uint32 PERC_SOCIALIZE            = 51~%~%# 上报危险信息（不需要请求）~%uint32 PERC_DANGER_INFO          = 60~%~%uint32 PERC_HAND_OK              = 70~%uint32 PERC_HAND_V               = 71~%uint32 PERC_HAND_SHAKE           = 72~%uint32 PERC_HAND_COME            = 73~%uint32 PERC_HAND_WAVE            = 74~%~%# 任务取消（不需要请求）~%uint32 PERC_CANCEL               = 100~%~%# 感知类型~%uint32 perc_kind~%~%# 危险信息~%string danger_info~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PercReq>))
  (cl:+ 0
     8
     4
     4 (cl:length (cl:slot-value msg 'danger_info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PercReq>))
  "Converts a ROS message object to a list"
  (cl:list 'PercReq
    (cl:cons ':req_id (req_id msg))
    (cl:cons ':perc_kind (perc_kind msg))
    (cl:cons ':danger_info (danger_info msg))
))
