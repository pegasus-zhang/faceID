;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::PercCmd)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'PercCmd (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::PERCCMD")
  (make-package "ROS_INTERFACE::PERCCMD"))

(in-package "ROS")
;;//! \htmlinclude PercCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::PercCmd
  :super ros::object
  :slots (_header _action_id _perc_kind _req_id _angle _point_name _point ))

(defmethod ros_interface::PercCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:perc_kind __perc_kind) 0)
    ((:req_id __req_id) 0)
    ((:angle __angle) 0.0)
    ((:point_name __point_name) "")
    ((:point __point) (instance ros_interface::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _perc_kind (round __perc_kind))
   (setq _req_id (round __req_id))
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
    ;; int32 _perc_kind
    4
    ;; uint64 _req_id
    8
    ;; float32 _angle
    4
    ;; string _point_name
    4 (length _point_name)
    ;; ros_interface/Point _point
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
     ;; int32 _perc_kind
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
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _point_name
       (write-long (length _point_name) s) (princ _point_name s)
     ;; ros_interface/Point _point
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
   ;; int32 _perc_kind
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
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _point_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _point_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; ros_interface/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::PercCmd :md5sum-) "2ee16e7d49b47f91bbd34c18cdee9485")
(setf (get ros_interface::PercCmd :datatype-) "ros_interface/PercCmd")
(setf (get ros_interface::PercCmd :definition-)
      "Header   header     #  
uint64   action_id     # #动作执行id
int32   perc_kind     # # Perception Kind 枚举类型 uint32 PERC_DEST   = 1   #点到点 uint32 PERC_ABS    = 2   #绝对位置 uint32 PERC_REL    = 3    #相对位置 uint32 PERC_AUTO_CHARGING   = 20  # 自动充电 uint32 PERC_CHECK_ENV       = 21  # 环境查看 uint32 PERC_AUTO_MAPPING    = 22  # 自动建图 uint32 PERC_FOLLOW               = 30  # 跟随模式 uint32 PERC_STRANGER_WELCOME     = 31  # 陌生人迎接 uint32 PERC_OWNER_WELCOME        = 32  # 主人迎接 uint32 PERC_BEHAVIOR_INTERACTION = 33  # 行为互动 uint32 PERC_HANDSHAKE            = 34   # 握手动作 uint32 PERC_STANDBY_ACCOMPANY    = 35  # 待机陪伴 uint32 PERC_HAPPY_ACCOMPANY      = 36  # 娱乐陪伴 uint32 PERC_WORK_ACCOMPANY       = 37  # 工作陪伴 uint32 PERC_POSITIVE_ACCOMPANY   = 38  # 积极陪伴 uint32 PERC_NEGATIVE_ACCOMPANY   = 39  # 消极陪伴 uint32 PERC_CHILD_WATCH          = 40  # 小孩看护 uint32 PERC_OLDER_WATCH          = 41  # 老人看护 uint32 PERC_DANGER_REMINDER      = 42   # 危险提醒 uint32 PERC_EVENT_REMINDER       = 43  # 事件提醒 uint32 PERC_CATWALK_START        = 44  # 开始走秀 uint32 PERC_CATWALK_ACT          = 45  # 走秀互动 uint32 PERC_CATWALK_SHOW         = 46  # 走秀展示 uint32 PERC_CATWALK_BACK         = 47  # 走秀返回 uint32 PERC_FREE_TIME   = 50  # 自由活动 uint32 PERC_SOCIALIZE   = 51  # 社交模式 uint32 PERC_DANGER_INFO = 60  # 上报危险信息（不需要请求） uint32 PERC_CANCEL      = 100  # 任务取消（不需要请求） uint32 PERC_NODE_CLOSE = 200  #关闭指令 uint32 PERC_NODE_START = 201  #启动指令 uint32 PERC_NODE_RESET = 202  #重启指令
uint64   req_id     # #发送请求的id，可以先不用管，调试使用
float32   angle     # # 语音的角度
string   point_name     # # 字符串表示某个位置（语义位置）
Point   point     # geometry_msgs/Point point  # Point表示某个位置

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
MSG: ros_interface/Point
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/PercCmd "2ee16e7d49b47f91bbd34c18cdee9485")


