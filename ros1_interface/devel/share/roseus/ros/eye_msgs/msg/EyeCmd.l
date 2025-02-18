;; Auto-generated. Do not edit!


(when (boundp 'eye_msgs::EyeCmd)
  (if (not (find-package "EYE_MSGS"))
    (make-package "EYE_MSGS"))
  (shadow 'EyeCmd (find-package "EYE_MSGS")))
(unless (find-package "EYE_MSGS::EYECMD")
  (make-package "EYE_MSGS::EYECMD"))

(in-package "ROS")
;;//! \htmlinclude EyeCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*EYE_FACE_RECORD*" (find-package "EYE_MSGS::EYECMD"))
(shadow '*EYE_FACE_RECORD* (find-package "EYE_MSGS::EYECMD"))
(defconstant eye_msgs::EyeCmd::*EYE_FACE_RECORD* 5)
(intern "*EYE_BODY_RECORD*" (find-package "EYE_MSGS::EYECMD"))
(shadow '*EYE_BODY_RECORD* (find-package "EYE_MSGS::EYECMD"))
(defconstant eye_msgs::EyeCmd::*EYE_BODY_RECORD* 6)
(intern "*EYE_WELCOME_DEMO*" (find-package "EYE_MSGS::EYECMD"))
(shadow '*EYE_WELCOME_DEMO* (find-package "EYE_MSGS::EYECMD"))
(defconstant eye_msgs::EyeCmd::*EYE_WELCOME_DEMO* 61)
(intern "*EYE_LOBBY_DEMO*" (find-package "EYE_MSGS::EYECMD"))
(shadow '*EYE_LOBBY_DEMO* (find-package "EYE_MSGS::EYECMD"))
(defconstant eye_msgs::EyeCmd::*EYE_LOBBY_DEMO* 62)
(intern "*EYE_CANCEL*" (find-package "EYE_MSGS::EYECMD"))
(shadow '*EYE_CANCEL* (find-package "EYE_MSGS::EYECMD"))
(defconstant eye_msgs::EyeCmd::*EYE_CANCEL* 100)

(defun eye_msgs::EyeCmd-to-symbol (const)
  (cond
        ((= const 5) 'eye_msgs::EyeCmd::*EYE_FACE_RECORD*)
        ((= const 6) 'eye_msgs::EyeCmd::*EYE_BODY_RECORD*)
        ((= const 61) 'eye_msgs::EyeCmd::*EYE_WELCOME_DEMO*)
        ((= const 62) 'eye_msgs::EyeCmd::*EYE_LOBBY_DEMO*)
        ((= const 100) 'eye_msgs::EyeCmd::*EYE_CANCEL*)
        (t nil)))

(defclass eye_msgs::EyeCmd
  :super ros::object
  :slots (_header _action_id _eye_kind _human_name ))

(defmethod eye_msgs::EyeCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:eye_kind __eye_kind) 0)
    ((:human_name __human_name) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _eye_kind (round __eye_kind))
   (setq _human_name (string __human_name))
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
  (:eye_kind
   (&optional __eye_kind)
   (if __eye_kind (setq _eye_kind __eye_kind)) _eye_kind)
  (:human_name
   (&optional __human_name)
   (if __human_name (setq _human_name __human_name)) _human_name)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _action_id
    8
    ;; uint32 _eye_kind
    4
    ;; string _human_name
    4 (length _human_name)
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
     ;; uint32 _eye_kind
       (write-long _eye_kind s)
     ;; string _human_name
       (write-long (length _human_name) s) (princ _human_name s)
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
   ;; uint32 _eye_kind
     (setq _eye_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _human_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _human_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get eye_msgs::EyeCmd :md5sum-) "b7afd2407918ee30626ee4948899aad8")
(setf (get eye_msgs::EyeCmd :datatype-) "eye_msgs/EyeCmd")
(setf (get eye_msgs::EyeCmd :definition-)
      "std_msgs/Header header

#动作执行id,增加含义：时间+序号
uint64 action_id

# 人脸录入
uint32 EYE_FACE_RECORD          = 5
uint32 EYE_BODY_RECORD          = 6        

# 欢迎模式
uint32 EYE_WELCOME_DEMO         = 61
# 回大厅找人
uint32 EYE_LOBBY_DEMO           = 62

# 任务取消
uint32 EYE_CANCEL               = 100

# 类型
uint32 eye_kind

# 人的名字
string human_name

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



(provide :eye_msgs/EyeCmd "b7afd2407918ee30626ee4948899aad8")


