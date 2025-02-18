;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::PercReq)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'PercReq (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::PERCREQ")
  (make-package "ROS_INTERFACE::PERCREQ"))

(in-package "ROS")
;;//! \htmlinclude PercReq.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::PercReq
  :super ros::object
  :slots (_header _req_id _perc_kind _danger_info ))

(defmethod ros_interface::PercReq
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:req_id __req_id) 0)
    ((:perc_kind __perc_kind) 0)
    ((:danger_info __danger_info) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _req_id (round __req_id))
   (setq _perc_kind (round __perc_kind))
   (setq _danger_info (string __danger_info))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
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
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _req_id
    8
    ;; int32 _perc_kind
    4
    ;; string _danger_info
    4 (length _danger_info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
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
     ;; int32 _perc_kind
       (write-long _perc_kind s)
     ;; string _danger_info
       (write-long (length _danger_info) s) (princ _danger_info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
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
   ;; int32 _perc_kind
     (setq _perc_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _danger_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _danger_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ros_interface::PercReq :md5sum-) "f83aae89ae6ebffd7f2e482e5efdb166")
(setf (get ros_interface::PercReq :datatype-) "ros_interface/PercReq")
(setf (get ros_interface::PercReq :definition-)
      "Header   header     #  
uint64   req_id     # #动作执行id,增加含义：时间+序号，2024101620 0001
int32   perc_kind     # # Perception Kind 枚举类型 uint32 PERC_AUTO_CHARGING   = 20  # 自动充电 uint32 PERC_CHECK_ENV       = 21  # 环境查看 uint32 PERC_AUTO_MAPPING    = 22  # 自动建图 uint32 PERC_FOLLOW               = 30  # 跟随模式 uint32 PERC_STRANGER_WELCOME     = 31  # 陌生人迎接 uint32 PERC_OWNER_WELCOME        = 32  # 主人迎接 uint32 PERC_BEHAVIOR_INTERACTION = 33  # 行为互动 uint32 PERC_HANDSHAKE            = 34   # 握手动作 uint32 PERC_STANDBY_ACCOMPANY    = 35  # 待机陪伴 uint32 PERC_HAPPY_ACCOMPANY      = 36  # 娱乐陪伴 uint32 PERC_WORK_ACCOMPANY       = 37  # 工作陪伴 uint32 PERC_POSITIVE_ACCOMPANY   = 38  # 积极陪伴 uint32 PERC_NEGATIVE_ACCOMPANY   = 39  # 消极陪伴 uint32 PERC_CHILD_WATCH          = 40  # 小孩看护 uint32 PERC_OLDER_WATCH          = 41  # 老人看护 uint32 PERC_DANGER_REMINDER      = 42   # 危险提醒 uint32 PERC_EVENT_REMINDER       = 43  # 事件提醒 uint32 PERC_CATWALK_START        = 44  # 开始走秀 uint32 PERC_CATWALK_ACT          = 45  # 走秀互动 uint32 PERC_CATWALK_SHOW         = 46  # 走秀展示 uint32 PERC_CATWALK_BACK         = 47  # 走秀返回 uint32 PERC_FREE_TIME   = 50  # 自由活动 uint32 PERC_SOCIALIZE   = 51  # 社交模式 uint32 PERC_DANGER_INFO = 60  # 上报危险信息（不需要请求） uint32 PERC_CANCEL      = 100  # 任务取消（不需要请求） uint32 PERC_NODE_CLOSE = 200  #关闭指令 uint32 PERC_NODE_START = 201  #启动指令 uint32 PERC_NODE_RESET = 202  #重启指令
string   danger_info     # # 危险信息

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



(provide :ros_interface/PercReq "f83aae89ae6ebffd7f2e482e5efdb166")


