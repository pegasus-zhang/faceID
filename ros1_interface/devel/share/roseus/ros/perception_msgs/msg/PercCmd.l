;; Auto-generated. Do not edit!


(when (boundp 'perception_msgs::PercCmd)
  (if (not (find-package "PERCEPTION_MSGS"))
    (make-package "PERCEPTION_MSGS"))
  (shadow 'PercCmd (find-package "PERCEPTION_MSGS")))
(unless (find-package "PERCEPTION_MSGS::PERCCMD")
  (make-package "PERCEPTION_MSGS::PERCCMD"))

(in-package "ROS")
;;//! \htmlinclude PercCmd.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*PERC_DEST*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_DEST* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_DEST* 1)
(intern "*PERC_ABS*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_ABS* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_ABS* 2)
(intern "*PERC_REL*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_REL* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_REL* 3)
(intern "*PERC_AUTO_CHARGING*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_AUTO_CHARGING* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_AUTO_CHARGING* 20)
(intern "*PERC_CHECK_ENV*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CHECK_ENV* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CHECK_ENV* 21)
(intern "*PERC_AUTO_MAPPING*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_AUTO_MAPPING* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_AUTO_MAPPING* 22)
(intern "*PERC_FOLLOW*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_FOLLOW* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_FOLLOW* 30)
(intern "*PERC_STRANGER_WELCOME*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_STRANGER_WELCOME* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_STRANGER_WELCOME* 31)
(intern "*PERC_OWNER_WELCOME*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_OWNER_WELCOME* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_OWNER_WELCOME* 32)
(intern "*PERC_BEHAVIOR_INTERACTION*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_BEHAVIOR_INTERACTION* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_BEHAVIOR_INTERACTION* 33)
(intern "*PERC_HANDSHAKE*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_HANDSHAKE* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_HANDSHAKE* 34)
(intern "*PERC_STANDBY_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_STANDBY_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_STANDBY_ACCOMPANY* 35)
(intern "*PERC_HAPPY_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_HAPPY_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_HAPPY_ACCOMPANY* 36)
(intern "*PERC_WORK_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_WORK_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_WORK_ACCOMPANY* 37)
(intern "*PERC_POSITIVE_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_POSITIVE_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_POSITIVE_ACCOMPANY* 38)
(intern "*PERC_NEGATIVE_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_NEGATIVE_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_NEGATIVE_ACCOMPANY* 39)
(intern "*PERC_CHILD_WATCH*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CHILD_WATCH* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CHILD_WATCH* 40)
(intern "*PERC_OLDER_WATCH*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_OLDER_WATCH* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_OLDER_WATCH* 41)
(intern "*PERC_DANGER_REMINDER*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_DANGER_REMINDER* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_DANGER_REMINDER* 42)
(intern "*PERC_EVENT_REMINDER*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_EVENT_REMINDER* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_EVENT_REMINDER* 43)
(intern "*PERC_CATWALK_START*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CATWALK_START* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CATWALK_START* 44)
(intern "*PERC_CATWALK_ACT*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CATWALK_ACT* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CATWALK_ACT* 45)
(intern "*PERC_CATWALK_SHOW*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CATWALK_SHOW* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CATWALK_SHOW* 46)
(intern "*PERC_CATWALK_BACK*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CATWALK_BACK* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CATWALK_BACK* 47)
(intern "*PERC_FREE_TIME*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_FREE_TIME* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_FREE_TIME* 50)
(intern "*PERC_SOCIALIZE*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_SOCIALIZE* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_SOCIALIZE* 51)
(intern "*PERC_DANGER_INFO*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_DANGER_INFO* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_DANGER_INFO* 60)
(intern "*PERC_WELCOME_DEMO*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_WELCOME_DEMO* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_WELCOME_DEMO* 70)
(intern "*PERC_CANCEL*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_CANCEL* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_CANCEL* 100)
(intern "*PERC_NODE_CLOSE*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_NODE_CLOSE* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_NODE_CLOSE* 200)
(intern "*PERC_NODE_START*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_NODE_START* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_NODE_START* 201)
(intern "*PERC_NODE_RESET*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*PERC_NODE_RESET* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*PERC_NODE_RESET* 202)
(intern "*FOLLOW_ON*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*FOLLOW_ON* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*FOLLOW_ON* 1)
(intern "*FOLLOW_OFF*" (find-package "PERCEPTION_MSGS::PERCCMD"))
(shadow '*FOLLOW_OFF* (find-package "PERCEPTION_MSGS::PERCCMD"))
(defconstant perception_msgs::PercCmd::*FOLLOW_OFF* 2)

(defun perception_msgs::PercCmd-to-symbol (const)
  (cond
        ((= const 1) 'perception_msgs::PercCmd::*PERC_DEST*)
        ((= const 2) 'perception_msgs::PercCmd::*PERC_ABS*)
        ((= const 3) 'perception_msgs::PercCmd::*PERC_REL*)
        ((= const 20) 'perception_msgs::PercCmd::*PERC_AUTO_CHARGING*)
        ((= const 21) 'perception_msgs::PercCmd::*PERC_CHECK_ENV*)
        ((= const 22) 'perception_msgs::PercCmd::*PERC_AUTO_MAPPING*)
        ((= const 30) 'perception_msgs::PercCmd::*PERC_FOLLOW*)
        ((= const 31) 'perception_msgs::PercCmd::*PERC_STRANGER_WELCOME*)
        ((= const 32) 'perception_msgs::PercCmd::*PERC_OWNER_WELCOME*)
        ((= const 33) 'perception_msgs::PercCmd::*PERC_BEHAVIOR_INTERACTION*)
        ((= const 34) 'perception_msgs::PercCmd::*PERC_HANDSHAKE*)
        ((= const 35) 'perception_msgs::PercCmd::*PERC_STANDBY_ACCOMPANY*)
        ((= const 36) 'perception_msgs::PercCmd::*PERC_HAPPY_ACCOMPANY*)
        ((= const 37) 'perception_msgs::PercCmd::*PERC_WORK_ACCOMPANY*)
        ((= const 38) 'perception_msgs::PercCmd::*PERC_POSITIVE_ACCOMPANY*)
        ((= const 39) 'perception_msgs::PercCmd::*PERC_NEGATIVE_ACCOMPANY*)
        ((= const 40) 'perception_msgs::PercCmd::*PERC_CHILD_WATCH*)
        ((= const 41) 'perception_msgs::PercCmd::*PERC_OLDER_WATCH*)
        ((= const 42) 'perception_msgs::PercCmd::*PERC_DANGER_REMINDER*)
        ((= const 43) 'perception_msgs::PercCmd::*PERC_EVENT_REMINDER*)
        ((= const 44) 'perception_msgs::PercCmd::*PERC_CATWALK_START*)
        ((= const 45) 'perception_msgs::PercCmd::*PERC_CATWALK_ACT*)
        ((= const 46) 'perception_msgs::PercCmd::*PERC_CATWALK_SHOW*)
        ((= const 47) 'perception_msgs::PercCmd::*PERC_CATWALK_BACK*)
        ((= const 50) 'perception_msgs::PercCmd::*PERC_FREE_TIME*)
        ((= const 51) 'perception_msgs::PercCmd::*PERC_SOCIALIZE*)
        ((= const 60) 'perception_msgs::PercCmd::*PERC_DANGER_INFO*)
        ((= const 70) 'perception_msgs::PercCmd::*PERC_WELCOME_DEMO*)
        ((= const 100) 'perception_msgs::PercCmd::*PERC_CANCEL*)
        ((= const 200) 'perception_msgs::PercCmd::*PERC_NODE_CLOSE*)
        ((= const 201) 'perception_msgs::PercCmd::*PERC_NODE_START*)
        ((= const 202) 'perception_msgs::PercCmd::*PERC_NODE_RESET*)
        ((= const 1) 'perception_msgs::PercCmd::*FOLLOW_ON*)
        ((= const 2) 'perception_msgs::PercCmd::*FOLLOW_OFF*)
        (t nil)))

(defclass perception_msgs::PercCmd
  :super ros::object
  :slots (_header _action_id _perc_kind _req_id _on_off _follow_name _angle _point_name _point ))

(defmethod perception_msgs::PercCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:perc_kind __perc_kind) 0)
    ((:req_id __req_id) 0)
    ((:on_off __on_off) 0)
    ((:follow_name __follow_name) "")
    ((:angle __angle) 0.0)
    ((:point_name __point_name) "")
    ((:point __point) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _perc_kind (round __perc_kind))
   (setq _req_id (round __req_id))
   (setq _on_off (round __on_off))
   (setq _follow_name (string __follow_name))
   (setq _angle (float __angle))
   (setq _point_name (string __point_name))
   (setq _point __point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:action_id
   (&optional __action_id)
   (if __action_id (setq _action_id __action_id)) _action_id)
  (:perc_kind
   (&optional __perc_kind)
   (if __perc_kind (setq _perc_kind __perc_kind)) _perc_kind)
  (:req_id
   (&optional __req_id)
   (if __req_id (setq _req_id __req_id)) _req_id)
  (:on_off
   (&optional __on_off)
   (if __on_off (setq _on_off __on_off)) _on_off)
  (:follow_name
   (&optional __follow_name)
   (if __follow_name (setq _follow_name __follow_name)) _follow_name)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:point_name
   (&optional __point_name)
   (if __point_name (setq _point_name __point_name)) _point_name)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _action_id
    8
    ;; uint32 _perc_kind
    4
    ;; uint64 _req_id
    8
    ;; uint32 _on_off
    4
    ;; string _follow_name
    4 (length _follow_name)
    ;; float64 _angle
    8
    ;; string _point_name
    4 (length _point_name)
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint64 _action_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _action_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _action_id) (= (length (_action_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_action_id . bv) 0) 0) s)
              (write-long (ash (elt (_action_id . bv) 1) -1) s))
             ((and (class _action_id) (= (length (_action_id . bv)) 1)) ;; big1
              (write-long (elt (_action_id . bv) 0) s)
              (write-long (if (>= _action_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _action_id s)(write-long (if (>= _action_id 0) 0 #xffffffff) s)))
     ;; uint32 _perc_kind
       (write-long _perc_kind s)
     ;; uint64 _req_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _req_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _req_id) (= (length (_req_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_req_id . bv) 0) 0) s)
              (write-long (ash (elt (_req_id . bv) 1) -1) s))
             ((and (class _req_id) (= (length (_req_id . bv)) 1)) ;; big1
              (write-long (elt (_req_id . bv) 0) s)
              (write-long (if (>= _req_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _req_id s)(write-long (if (>= _req_id 0) 0 #xffffffff) s)))
     ;; uint32 _on_off
       (write-long _on_off s)
     ;; string _follow_name
       (write-long (length _follow_name) s) (princ _follow_name s)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _point_name
       (write-long (length _point_name) s) (princ _point_name s)
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint64 _action_id
     
#+(or :alpha :irix6 :x86_64)
      (setf _action_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _action_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint32 _perc_kind
     (setq _perc_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint64 _req_id
     
#+(or :alpha :irix6 :x86_64)
      (setf _req_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _req_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint32 _on_off
     (setq _on_off (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _follow_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _follow_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _point_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _point_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;;
   self)
  )

(setf (get perception_msgs::PercCmd :md5sum-) "c79aa339805326edb4a24a21654c5839")
(setf (get perception_msgs::PercCmd :datatype-) "perception_msgs/PercCmd")
(setf (get perception_msgs::PercCmd :definition-)
      "std_msgs/Header header

#动作执行id,增加含义：时间+序号
uint64 action_id

# Perceive Kind
uint32 PERC_DEST                 = 1
uint32 PERC_ABS                  = 2
uint32 PERC_REL                  = 3

# 自动充电
uint32 PERC_AUTO_CHARGING        = 20
# 环境查看
uint32 PERC_CHECK_ENV            = 21
# 自动建图
uint32 PERC_AUTO_MAPPING         = 22

# 跟随模式
uint32 PERC_FOLLOW               = 30
# 陌生人迎接
uint32 PERC_STRANGER_WELCOME     = 31
# 主人迎接
uint32 PERC_OWNER_WELCOME        = 32
# 行为互动
uint32 PERC_BEHAVIOR_INTERACTION = 33
# 握手动作
uint32 PERC_HANDSHAKE            = 34

# 待机陪伴
uint32 PERC_STANDBY_ACCOMPANY    = 35
# 娱乐陪伴
uint32 PERC_HAPPY_ACCOMPANY      = 36
# 工作陪伴
uint32 PERC_WORK_ACCOMPANY       = 37
# 积极陪伴
uint32 PERC_POSITIVE_ACCOMPANY   = 38
# 消极陪伴
uint32 PERC_NEGATIVE_ACCOMPANY   = 39

# 小孩看护
uint32 PERC_CHILD_WATCH          = 40
# 老人看护
uint32 PERC_OLDER_WATCH          = 41
# 危险提醒
uint32 PERC_DANGER_REMINDER      = 42
# 事件提醒
uint32 PERC_EVENT_REMINDER       = 43
# 开始走秀（语言下方，不需要感知）
uint32 PERC_CATWALK_START        = 44
# 走秀互动
uint32 PERC_CATWALK_ACT          = 45
# 走秀展示
uint32 PERC_CATWALK_SHOW         = 46
# 走秀返回
uint32 PERC_CATWALK_BACK         = 47

# 自由活动
uint32 PERC_FREE_TIME            = 50
# 社交模式
uint32 PERC_SOCIALIZE            = 51

# 上报危险信息（不需要请求）
uint32 PERC_DANGER_INFO          = 60
# 欢迎模式
uint32 PERC_WELCOME_DEMO         = 70

# 任务取消（不需要请求）
uint32 PERC_CANCEL               = 100

uint32 PERC_NODE_CLOSE           = 200
uint32 PERC_NODE_START           = 201
uint32 PERC_NODE_RESET           = 202

# 感知命令类型
uint32 perc_kind
uint64 req_id

# 跟随开关
uint32 FOLLOW_ON  = 1
uint32 FOLLOW_OFF = 2
uint32 on_off
string follow_name

# 目标角度
float64 angle

# 字符串表示某个位置
string point_name

# Point表示某个位置
geometry_msgs/Point point
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :perception_msgs/PercCmd "c79aa339805326edb4a24a21654c5839")


