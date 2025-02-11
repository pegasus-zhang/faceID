;; Auto-generated. Do not edit!


(when (boundp 'perception_msgs::PercState)
  (if (not (find-package "PERCEPTION_MSGS"))
    (make-package "PERCEPTION_MSGS"))
  (shadow 'PercState (find-package "PERCEPTION_MSGS")))
(unless (find-package "PERCEPTION_MSGS::PERCSTATE")
  (make-package "PERCEPTION_MSGS::PERCSTATE"))

(in-package "ROS")
;;//! \htmlinclude PercState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ACTION_IDLE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_IDLE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_IDLE* 0)
(intern "*ACTION_RUNNING*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_RUNNING* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_RUNNING* 1)
(intern "*ACTION_DONE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_DONE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_DONE* 2)
(intern "*ACTION_NONE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_NONE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_NONE* 0)
(intern "*ACTION_SUCCESS*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_SUCCESS* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_SUCCESS* 1)
(intern "*ACTION_FAIL*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_FAIL* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_FAIL* 2)
(intern "*ACTION_ERR_NONE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_ERR_NONE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_ERR_NONE* 0)
(intern "*ACTION_ERR_NOWORK*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*ACTION_ERR_NOWORK* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*ACTION_ERR_NOWORK* 1)
(intern "*PERC_DEST*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_DEST* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_DEST* 1)
(intern "*PERC_ABS*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_ABS* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_ABS* 2)
(intern "*PERC_REL*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_REL* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_REL* 3)
(intern "*PERC_AUTO_CHARGING*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_AUTO_CHARGING* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_AUTO_CHARGING* 20)
(intern "*PERC_CHECK_ENV*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CHECK_ENV* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CHECK_ENV* 21)
(intern "*PERC_AUTO_MAPPING*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_AUTO_MAPPING* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_AUTO_MAPPING* 22)
(intern "*PERC_FOLLOW*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_FOLLOW* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_FOLLOW* 30)
(intern "*PERC_STRANGER_WELCOME*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_STRANGER_WELCOME* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_STRANGER_WELCOME* 31)
(intern "*PERC_OWNER_WELCOME*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_OWNER_WELCOME* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_OWNER_WELCOME* 32)
(intern "*PERC_BEHAVIOR_INTERACTION*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_BEHAVIOR_INTERACTION* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_BEHAVIOR_INTERACTION* 33)
(intern "*PERC_HANDSHAKE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_HANDSHAKE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_HANDSHAKE* 34)
(intern "*PERC_STANDBY_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_STANDBY_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_STANDBY_ACCOMPANY* 35)
(intern "*PERC_HAPPY_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_HAPPY_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_HAPPY_ACCOMPANY* 36)
(intern "*PERC_WORK_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_WORK_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_WORK_ACCOMPANY* 37)
(intern "*PERC_POSITIVE_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_POSITIVE_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_POSITIVE_ACCOMPANY* 38)
(intern "*PERC_NEGATIVE_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_NEGATIVE_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_NEGATIVE_ACCOMPANY* 39)
(intern "*PERC_CHILD_WATCH*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CHILD_WATCH* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CHILD_WATCH* 40)
(intern "*PERC_OLDER_WATCH*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_OLDER_WATCH* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_OLDER_WATCH* 41)
(intern "*PERC_DANGER_REMINDER*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_DANGER_REMINDER* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_DANGER_REMINDER* 42)
(intern "*PERC_EVENT_REMINDER*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_EVENT_REMINDER* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_EVENT_REMINDER* 43)
(intern "*PERC_CATWALK_START*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CATWALK_START* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CATWALK_START* 44)
(intern "*PERC_CATWALK_ACT*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CATWALK_ACT* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CATWALK_ACT* 45)
(intern "*PERC_CATWALK_SHOW*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CATWALK_SHOW* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CATWALK_SHOW* 46)
(intern "*PERC_CATWALK_BACK*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CATWALK_BACK* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CATWALK_BACK* 47)
(intern "*PERC_FREE_TIME*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_FREE_TIME* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_FREE_TIME* 50)
(intern "*PERC_SOCIALIZE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_SOCIALIZE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_SOCIALIZE* 51)
(intern "*PERC_DANGER_INFO*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_DANGER_INFO* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_DANGER_INFO* 60)
(intern "*PERC_WELCOME_DEMO*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_WELCOME_DEMO* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_WELCOME_DEMO* 70)
(intern "*PERC_CANCEL*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_CANCEL* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_CANCEL* 100)
(intern "*PERC_NODE_CLOSE*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_NODE_CLOSE* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_NODE_CLOSE* 200)
(intern "*PERC_NODE_START*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_NODE_START* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_NODE_START* 201)
(intern "*PERC_NODE_RESET*" (find-package "PERCEPTION_MSGS::PERCSTATE"))
(shadow '*PERC_NODE_RESET* (find-package "PERCEPTION_MSGS::PERCSTATE"))
(defconstant perception_msgs::PercState::*PERC_NODE_RESET* 202)

(defun perception_msgs::PercState-to-symbol (const)
  (cond
        ((= const 0) 'perception_msgs::PercState::*ACTION_IDLE*)
        ((= const 1) 'perception_msgs::PercState::*ACTION_RUNNING*)
        ((= const 2) 'perception_msgs::PercState::*ACTION_DONE*)
        ((= const 0) 'perception_msgs::PercState::*ACTION_NONE*)
        ((= const 1) 'perception_msgs::PercState::*ACTION_SUCCESS*)
        ((= const 2) 'perception_msgs::PercState::*ACTION_FAIL*)
        ((= const 0) 'perception_msgs::PercState::*ACTION_ERR_NONE*)
        ((= const 1) 'perception_msgs::PercState::*ACTION_ERR_NOWORK*)
        ((= const 1) 'perception_msgs::PercState::*PERC_DEST*)
        ((= const 2) 'perception_msgs::PercState::*PERC_ABS*)
        ((= const 3) 'perception_msgs::PercState::*PERC_REL*)
        ((= const 20) 'perception_msgs::PercState::*PERC_AUTO_CHARGING*)
        ((= const 21) 'perception_msgs::PercState::*PERC_CHECK_ENV*)
        ((= const 22) 'perception_msgs::PercState::*PERC_AUTO_MAPPING*)
        ((= const 30) 'perception_msgs::PercState::*PERC_FOLLOW*)
        ((= const 31) 'perception_msgs::PercState::*PERC_STRANGER_WELCOME*)
        ((= const 32) 'perception_msgs::PercState::*PERC_OWNER_WELCOME*)
        ((= const 33) 'perception_msgs::PercState::*PERC_BEHAVIOR_INTERACTION*)
        ((= const 34) 'perception_msgs::PercState::*PERC_HANDSHAKE*)
        ((= const 35) 'perception_msgs::PercState::*PERC_STANDBY_ACCOMPANY*)
        ((= const 36) 'perception_msgs::PercState::*PERC_HAPPY_ACCOMPANY*)
        ((= const 37) 'perception_msgs::PercState::*PERC_WORK_ACCOMPANY*)
        ((= const 38) 'perception_msgs::PercState::*PERC_POSITIVE_ACCOMPANY*)
        ((= const 39) 'perception_msgs::PercState::*PERC_NEGATIVE_ACCOMPANY*)
        ((= const 40) 'perception_msgs::PercState::*PERC_CHILD_WATCH*)
        ((= const 41) 'perception_msgs::PercState::*PERC_OLDER_WATCH*)
        ((= const 42) 'perception_msgs::PercState::*PERC_DANGER_REMINDER*)
        ((= const 43) 'perception_msgs::PercState::*PERC_EVENT_REMINDER*)
        ((= const 44) 'perception_msgs::PercState::*PERC_CATWALK_START*)
        ((= const 45) 'perception_msgs::PercState::*PERC_CATWALK_ACT*)
        ((= const 46) 'perception_msgs::PercState::*PERC_CATWALK_SHOW*)
        ((= const 47) 'perception_msgs::PercState::*PERC_CATWALK_BACK*)
        ((= const 50) 'perception_msgs::PercState::*PERC_FREE_TIME*)
        ((= const 51) 'perception_msgs::PercState::*PERC_SOCIALIZE*)
        ((= const 60) 'perception_msgs::PercState::*PERC_DANGER_INFO*)
        ((= const 70) 'perception_msgs::PercState::*PERC_WELCOME_DEMO*)
        ((= const 100) 'perception_msgs::PercState::*PERC_CANCEL*)
        ((= const 200) 'perception_msgs::PercState::*PERC_NODE_CLOSE*)
        ((= const 201) 'perception_msgs::PercState::*PERC_NODE_START*)
        ((= const 202) 'perception_msgs::PercState::*PERC_NODE_RESET*)
        (t nil)))

(defclass perception_msgs::PercState
  :super ros::object
  :slots (_header _action_id _perc_kind _exe_state _exe_result _err_code _err_info _wait_for_millisec ))

(defmethod perception_msgs::PercState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:perc_kind __perc_kind) 0)
    ((:exe_state __exe_state) 0)
    ((:exe_result __exe_result) 0)
    ((:err_code __err_code) 0)
    ((:err_info __err_info) "")
    ((:wait_for_millisec __wait_for_millisec) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _perc_kind (round __perc_kind))
   (setq _exe_state (round __exe_state))
   (setq _exe_result (round __exe_result))
   (setq _err_code (round __err_code))
   (setq _err_info (string __err_info))
   (setq _wait_for_millisec (round __wait_for_millisec))
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
  (:exe_state
   (&optional __exe_state)
   (if __exe_state (setq _exe_state __exe_state)) _exe_state)
  (:exe_result
   (&optional __exe_result)
   (if __exe_result (setq _exe_result __exe_result)) _exe_result)
  (:err_code
   (&optional __err_code)
   (if __err_code (setq _err_code __err_code)) _err_code)
  (:err_info
   (&optional __err_info)
   (if __err_info (setq _err_info __err_info)) _err_info)
  (:wait_for_millisec
   (&optional __wait_for_millisec)
   (if __wait_for_millisec (setq _wait_for_millisec __wait_for_millisec)) _wait_for_millisec)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _action_id
    8
    ;; uint32 _perc_kind
    4
    ;; uint8 _exe_state
    1
    ;; uint8 _exe_result
    1
    ;; uint16 _err_code
    2
    ;; string _err_info
    4 (length _err_info)
    ;; uint64 _wait_for_millisec
    8
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
     ;; uint8 _exe_state
       (write-byte _exe_state s)
     ;; uint8 _exe_result
       (write-byte _exe_result s)
     ;; uint16 _err_code
       (write-word _err_code s)
     ;; string _err_info
       (write-long (length _err_info) s) (princ _err_info s)
     ;; uint64 _wait_for_millisec
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _wait_for_millisec (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _wait_for_millisec) (= (length (_wait_for_millisec . bv)) 2)) ;; bignum
              (write-long (ash (elt (_wait_for_millisec . bv) 0) 0) s)
              (write-long (ash (elt (_wait_for_millisec . bv) 1) -1) s))
             ((and (class _wait_for_millisec) (= (length (_wait_for_millisec . bv)) 1)) ;; big1
              (write-long (elt (_wait_for_millisec . bv) 0) s)
              (write-long (if (>= _wait_for_millisec 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _wait_for_millisec s)(write-long (if (>= _wait_for_millisec 0) 0 #xffffffff) s)))
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
   ;; uint8 _exe_state
     (setq _exe_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _exe_result
     (setq _exe_result (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _err_code
     (setq _err_code (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _err_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _err_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint64 _wait_for_millisec
     
#+(or :alpha :irix6 :x86_64)
      (setf _wait_for_millisec (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _wait_for_millisec (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get perception_msgs::PercState :md5sum-) "54333f0d38bd18fb2d888adabbf15a33")
(setf (get perception_msgs::PercState :datatype-) "perception_msgs/PercState")
(setf (get perception_msgs::PercState :definition-)
      "std_msgs/Header header

# ActionState
uint8 ACTION_IDLE = 0
uint8 ACTION_RUNNING = 1
uint8 ACTION_DONE = 2

# ActionResult
uint8 ACTION_NONE = 0
uint8 ACTION_SUCCESS = 1
uint8 ACTION_FAIL = 2

# ErrCode
uint16 ACTION_ERR_NONE = 0
uint16 ACTION_ERR_NOWORK = 1

# 当前执行的id
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

# 感知类型
uint32 perc_kind
# 执行状态：空闲/正在执行/执行完成
uint8 exe_state
# 执行结果：无效/成功/失败
uint8 exe_result

# 错误码
uint16 err_code
# 错误消息
string err_info
# 剩余执行时间
uint64 wait_for_millisec

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

")



(provide :perception_msgs/PercState "54333f0d38bd18fb2d888adabbf15a33")


