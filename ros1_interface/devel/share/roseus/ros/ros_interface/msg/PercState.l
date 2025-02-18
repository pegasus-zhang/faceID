;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::PercState)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'PercState (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::PERCSTATE")
  (make-package "ROS_INTERFACE::PERCSTATE"))

(in-package "ROS")
;;//! \htmlinclude PercState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::PercState
  :super ros::object
  :slots (_header _action_id _perc_kind _exe_state _exe_result _err_code _err_info _wait_for_millisec ))

(defmethod ros_interface::PercState
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
    ;; int32 _perc_kind
    4
    ;; int32 _exe_state
    4
    ;; int32 _exe_result
    4
    ;; int32 _err_code
    4
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
     ;; int32 _perc_kind
       (write-long _perc_kind s)
     ;; int32 _exe_state
       (write-long _exe_state s)
     ;; int32 _exe_result
       (write-long _exe_result s)
     ;; int32 _err_code
       (write-long _err_code s)
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
   ;; int32 _perc_kind
     (setq _perc_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _exe_state
     (setq _exe_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _exe_result
     (setq _exe_result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _err_code
     (setq _err_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get ros_interface::PercState :md5sum-) "765a04de9c3e032f8c6862b330bcbf80")
(setf (get ros_interface::PercState :datatype-) "ros_interface/PercState")
(setf (get ros_interface::PercState :definition-)
      "Header   header     #  
uint64   action_id     # # 当前执行的id
int32   perc_kind     # # Perception Kind 枚举类型 uint32 PERC_DEST   = 1   #点到点 uint32 PERC_ABS    = 2   #绝对位置 uint32 PERC_REL    = 3    #相对位置 uint32 PERC_AUTO_CHARGING   = 20  # 自动充电 uint32 PERC_CHECK_ENV       = 21  # 环境查看 uint32 PERC_AUTO_MAPPING    = 22  # 自动建图 uint32 PERC_FOLLOW               = 30  # 跟随模式 uint32 PERC_STRANGER_WELCOME     = 31  # 陌生人迎接 uint32 PERC_OWNER_WELCOME        = 32  # 主人迎接 uint32 PERC_BEHAVIOR_INTERACTION = 33  # 行为互动 uint32 PERC_HANDSHAKE            = 34   # 握手动作 uint32 PERC_STANDBY_ACCOMPANY    = 35  # 待机陪伴 uint32 PERC_HAPPY_ACCOMPANY      = 36  # 娱乐陪伴 uint32 PERC_WORK_ACCOMPANY       = 37  # 工作陪伴 uint32 PERC_POSITIVE_ACCOMPANY   = 38  # 积极陪伴 uint32 PERC_NEGATIVE_ACCOMPANY   = 39  # 消极陪伴 uint32 PERC_CHILD_WATCH          = 40  # 小孩看护 uint32 PERC_OLDER_WATCH          = 41  # 老人看护 uint32 PERC_DANGER_REMINDER      = 42   # 危险提醒 uint32 PERC_EVENT_REMINDER       = 43  # 事件提醒 uint32 PERC_CATWALK_START        = 44  # 开始走秀 uint32 PERC_CATWALK_ACT          = 45  # 走秀互动 uint32 PERC_CATWALK_SHOW         = 46  # 走秀展示 uint32 PERC_CATWALK_BACK         = 47  # 走秀返回 uint32 PERC_FREE_TIME   = 50  # 自由活动 uint32 PERC_SOCIALIZE   = 51  # 社交模式 uint32 PERC_DANGER_INFO = 60  # 上报危险信息（不需要请求） uint32 PERC_CANCEL      = 100  # 任务取消（不需要请求） uint32 PERC_NODE_CLOSE = 200  #关闭指令 uint32 PERC_NODE_START = 201  #启动指令 uint32 PERC_NODE_RESET = 202  #重启指令
int32   exe_state     # # 执行状态：空闲/正在执行/执行完成
int32   exe_result     # # 执行结果：无效/成功/失败
int32   err_code     # # 错误码
string   err_info     # # 错误消息
uint64   wait_for_millisec     # # 剩余执行时间

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



(provide :ros_interface/PercState "765a04de9c3e032f8c6862b330bcbf80")


