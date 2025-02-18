;; Auto-generated. Do not edit!


(when (boundp 'perception_msgs::PercReq)
  (if (not (find-package "PERCEPTION_MSGS"))
    (make-package "PERCEPTION_MSGS"))
  (shadow 'PercReq (find-package "PERCEPTION_MSGS")))
(unless (find-package "PERCEPTION_MSGS::PERCREQ")
  (make-package "PERCEPTION_MSGS::PERCREQ"))

(in-package "ROS")
;;//! \htmlinclude PercReq.msg.html


(intern "*PERC_AUTO_CHARGING*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_AUTO_CHARGING* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_AUTO_CHARGING* 20)
(intern "*PERC_CHECK_ENV*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CHECK_ENV* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CHECK_ENV* 21)
(intern "*PERC_AUTO_MAPPING*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_AUTO_MAPPING* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_AUTO_MAPPING* 22)
(intern "*PERC_FOLLOW*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_FOLLOW* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_FOLLOW* 30)
(intern "*PERC_STRANGER_WELCOME*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_STRANGER_WELCOME* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_STRANGER_WELCOME* 31)
(intern "*PERC_OWNER_WELCOME*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_OWNER_WELCOME* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_OWNER_WELCOME* 32)
(intern "*PERC_BEHAVIOR_INTERACTION*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_BEHAVIOR_INTERACTION* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_BEHAVIOR_INTERACTION* 33)
(intern "*PERC_HANDSHAKE*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HANDSHAKE* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HANDSHAKE* 34)
(intern "*PERC_STANDBY_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_STANDBY_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_STANDBY_ACCOMPANY* 35)
(intern "*PERC_HAPPY_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HAPPY_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HAPPY_ACCOMPANY* 36)
(intern "*PERC_WORK_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_WORK_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_WORK_ACCOMPANY* 37)
(intern "*PERC_POSITIVE_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_POSITIVE_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_POSITIVE_ACCOMPANY* 38)
(intern "*PERC_NEGATIVE_ACCOMPANY*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_NEGATIVE_ACCOMPANY* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_NEGATIVE_ACCOMPANY* 39)
(intern "*PERC_CHILD_WATCH*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CHILD_WATCH* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CHILD_WATCH* 40)
(intern "*PERC_OLDER_WATCH*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_OLDER_WATCH* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_OLDER_WATCH* 41)
(intern "*PERC_DANGER_REMINDER*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_DANGER_REMINDER* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_DANGER_REMINDER* 42)
(intern "*PERC_EVENT_REMINDER*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_EVENT_REMINDER* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_EVENT_REMINDER* 43)
(intern "*PERC_CATWALK_START*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CATWALK_START* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CATWALK_START* 44)
(intern "*PERC_CATWALK_ACT*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CATWALK_ACT* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CATWALK_ACT* 45)
(intern "*PERC_CATWALK_SHOW*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CATWALK_SHOW* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CATWALK_SHOW* 46)
(intern "*PERC_CATWALK_BACK*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CATWALK_BACK* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CATWALK_BACK* 47)
(intern "*PERC_FREE_TIME*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_FREE_TIME* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_FREE_TIME* 50)
(intern "*PERC_SOCIALIZE*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_SOCIALIZE* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_SOCIALIZE* 51)
(intern "*PERC_SPECT_PERFORM*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_SPECT_PERFORM* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_SPECT_PERFORM* 55)
(intern "*PERC_FACE_DETCTION*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_FACE_DETCTION* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_FACE_DETCTION* 56)
(intern "*PERC_DANGER_INFO*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_DANGER_INFO* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_DANGER_INFO* 60)
(intern "*PERC_HAND_OK*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HAND_OK* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HAND_OK* 70)
(intern "*PERC_HAND_V*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HAND_V* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HAND_V* 71)
(intern "*PERC_HAND_SHAKE*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HAND_SHAKE* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HAND_SHAKE* 72)
(intern "*PERC_HAND_COME*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HAND_COME* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HAND_COME* 73)
(intern "*PERC_HAND_WAVE*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_HAND_WAVE* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_HAND_WAVE* 74)
(intern "*PERC_CAMERA_DEMO*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CAMERA_DEMO* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CAMERA_DEMO* 80)
(intern "*PERC_CANCEL*" (find-package "PERCEPTION_MSGS::PERCREQ"))
(shadow '*PERC_CANCEL* (find-package "PERCEPTION_MSGS::PERCREQ"))
(defconstant perception_msgs::PercReq::*PERC_CANCEL* 100)

(defun perception_msgs::PercReq-to-symbol (const)
  (cond
        ((= const 20) 'perception_msgs::PercReq::*PERC_AUTO_CHARGING*)
        ((= const 21) 'perception_msgs::PercReq::*PERC_CHECK_ENV*)
        ((= const 22) 'perception_msgs::PercReq::*PERC_AUTO_MAPPING*)
        ((= const 30) 'perception_msgs::PercReq::*PERC_FOLLOW*)
        ((= const 31) 'perception_msgs::PercReq::*PERC_STRANGER_WELCOME*)
        ((= const 32) 'perception_msgs::PercReq::*PERC_OWNER_WELCOME*)
        ((= const 33) 'perception_msgs::PercReq::*PERC_BEHAVIOR_INTERACTION*)
        ((= const 34) 'perception_msgs::PercReq::*PERC_HANDSHAKE*)
        ((= const 35) 'perception_msgs::PercReq::*PERC_STANDBY_ACCOMPANY*)
        ((= const 36) 'perception_msgs::PercReq::*PERC_HAPPY_ACCOMPANY*)
        ((= const 37) 'perception_msgs::PercReq::*PERC_WORK_ACCOMPANY*)
        ((= const 38) 'perception_msgs::PercReq::*PERC_POSITIVE_ACCOMPANY*)
        ((= const 39) 'perception_msgs::PercReq::*PERC_NEGATIVE_ACCOMPANY*)
        ((= const 40) 'perception_msgs::PercReq::*PERC_CHILD_WATCH*)
        ((= const 41) 'perception_msgs::PercReq::*PERC_OLDER_WATCH*)
        ((= const 42) 'perception_msgs::PercReq::*PERC_DANGER_REMINDER*)
        ((= const 43) 'perception_msgs::PercReq::*PERC_EVENT_REMINDER*)
        ((= const 44) 'perception_msgs::PercReq::*PERC_CATWALK_START*)
        ((= const 45) 'perception_msgs::PercReq::*PERC_CATWALK_ACT*)
        ((= const 46) 'perception_msgs::PercReq::*PERC_CATWALK_SHOW*)
        ((= const 47) 'perception_msgs::PercReq::*PERC_CATWALK_BACK*)
        ((= const 50) 'perception_msgs::PercReq::*PERC_FREE_TIME*)
        ((= const 51) 'perception_msgs::PercReq::*PERC_SOCIALIZE*)
        ((= const 55) 'perception_msgs::PercReq::*PERC_SPECT_PERFORM*)
        ((= const 56) 'perception_msgs::PercReq::*PERC_FACE_DETCTION*)
        ((= const 60) 'perception_msgs::PercReq::*PERC_DANGER_INFO*)
        ((= const 70) 'perception_msgs::PercReq::*PERC_HAND_OK*)
        ((= const 71) 'perception_msgs::PercReq::*PERC_HAND_V*)
        ((= const 72) 'perception_msgs::PercReq::*PERC_HAND_SHAKE*)
        ((= const 73) 'perception_msgs::PercReq::*PERC_HAND_COME*)
        ((= const 74) 'perception_msgs::PercReq::*PERC_HAND_WAVE*)
        ((= const 80) 'perception_msgs::PercReq::*PERC_CAMERA_DEMO*)
        ((= const 100) 'perception_msgs::PercReq::*PERC_CANCEL*)
        (t nil)))

(defclass perception_msgs::PercReq
  :super ros::object
  :slots (_req_id _perc_kind _danger_info ))

(defmethod perception_msgs::PercReq
  (:init
   (&key
    ((:req_id __req_id) 0)
    ((:perc_kind __perc_kind) 0)
    ((:danger_info __danger_info) "")
    )
   (send-super :init)
   (setq _req_id (round __req_id))
   (setq _perc_kind (round __perc_kind))
   (setq _danger_info (string __danger_info))
   self)
  (:req_id
   (&optional __req_id)
   (if __req_id (setq _req_id __req_id)) _req_id)
  (:perc_kind
   (&optional __perc_kind)
   (if __perc_kind (setq _perc_kind __perc_kind)) _perc_kind)
  (:danger_info
   (&optional __danger_info)
   (if __danger_info (setq _danger_info __danger_info)) _danger_info)
  (:serialization-length
   ()
   (+
    ;; uint64 _req_id
    8
    ;; uint32 _perc_kind
    4
    ;; string _danger_info
    4 (length _danger_info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;; uint32 _perc_kind
       (write-long _perc_kind s)
     ;; string _danger_info
       (write-long (length _danger_info) s) (princ _danger_info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;; uint32 _perc_kind
     (setq _perc_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _danger_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _danger_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get perception_msgs::PercReq :md5sum-) "492b0539a30d91f76050eff6a0b4c63a")
(setf (get perception_msgs::PercReq :datatype-) "perception_msgs/PercReq")
(setf (get perception_msgs::PercReq :definition-)
      "
# 动作执行id,增加含义：时间+序号 
uint64 req_id

# Perceive Kind

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
# 围观场景
uint32 PERC_SPECT_PERFORM        = 55
# 表情分析
uint32 PERC_FACE_DETCTION        = 56

# 上报危险信息（不需要请求）
uint32 PERC_DANGER_INFO          = 60

uint32 PERC_HAND_OK              = 70
uint32 PERC_HAND_V               = 71
uint32 PERC_HAND_SHAKE           = 72
uint32 PERC_HAND_COME            = 73
uint32 PERC_HAND_WAVE            = 74
uint32 PERC_CAMERA_DEMO          = 80

# 任务取消（不需要请求）
uint32 PERC_CANCEL               = 100

# 感知类型
uint32 perc_kind

# 危险信息
string danger_info
")



(provide :perception_msgs/PercReq "492b0539a30d91f76050eff6a0b4c63a")


