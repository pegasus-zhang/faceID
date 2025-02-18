;; Auto-generated. Do not edit!


(when (boundp 'eye_msgs::EyeState)
  (if (not (find-package "EYE_MSGS"))
    (make-package "EYE_MSGS"))
  (shadow 'EyeState (find-package "EYE_MSGS")))
(unless (find-package "EYE_MSGS::EYESTATE")
  (make-package "EYE_MSGS::EYESTATE"))

(in-package "ROS")
;;//! \htmlinclude EyeState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ACTION_IDLE*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_IDLE* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_IDLE* 0)
(intern "*ACTION_RUNNING*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_RUNNING* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_RUNNING* 1)
(intern "*ACTION_DONE*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_DONE* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_DONE* 2)
(intern "*ACTION_NONE*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_NONE* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_NONE* 0)
(intern "*ACTION_SUCCESS*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_SUCCESS* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_SUCCESS* 1)
(intern "*ACTION_FAIL*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_FAIL* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_FAIL* 2)
(intern "*ACTION_ERR_NONE*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_ERR_NONE* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_ERR_NONE* 0)
(intern "*ACTION_ERR_NOWORK*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*ACTION_ERR_NOWORK* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*ACTION_ERR_NOWORK* 1)
(intern "*EYE_FACE_RECORD*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*EYE_FACE_RECORD* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*EYE_FACE_RECORD* 5)
(intern "*EYE_BODY_RECORD*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*EYE_BODY_RECORD* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*EYE_BODY_RECORD* 6)
(intern "*EYE_WELCOME_DEMO*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*EYE_WELCOME_DEMO* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*EYE_WELCOME_DEMO* 61)
(intern "*EYE_LOBBY_DEMO*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*EYE_LOBBY_DEMO* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*EYE_LOBBY_DEMO* 62)
(intern "*EYE_CANCEL*" (find-package "EYE_MSGS::EYESTATE"))
(shadow '*EYE_CANCEL* (find-package "EYE_MSGS::EYESTATE"))
(defconstant eye_msgs::EyeState::*EYE_CANCEL* 100)

(defun eye_msgs::EyeState-to-symbol (const)
  (cond
        ((= const 0) 'eye_msgs::EyeState::*ACTION_IDLE*)
        ((= const 1) 'eye_msgs::EyeState::*ACTION_RUNNING*)
        ((= const 2) 'eye_msgs::EyeState::*ACTION_DONE*)
        ((= const 0) 'eye_msgs::EyeState::*ACTION_NONE*)
        ((= const 1) 'eye_msgs::EyeState::*ACTION_SUCCESS*)
        ((= const 2) 'eye_msgs::EyeState::*ACTION_FAIL*)
        ((= const 0) 'eye_msgs::EyeState::*ACTION_ERR_NONE*)
        ((= const 1) 'eye_msgs::EyeState::*ACTION_ERR_NOWORK*)
        ((= const 5) 'eye_msgs::EyeState::*EYE_FACE_RECORD*)
        ((= const 6) 'eye_msgs::EyeState::*EYE_BODY_RECORD*)
        ((= const 61) 'eye_msgs::EyeState::*EYE_WELCOME_DEMO*)
        ((= const 62) 'eye_msgs::EyeState::*EYE_LOBBY_DEMO*)
        ((= const 100) 'eye_msgs::EyeState::*EYE_CANCEL*)
        (t nil)))

(defclass eye_msgs::EyeState
  :super ros::object
  :slots (_header _action_id _eye_kind _exe_state _exe_result _err_code _err_info _wait_for_millisec ))

(defmethod eye_msgs::EyeState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:eye_kind __eye_kind) 0)
    ((:exe_state __exe_state) 0)
    ((:exe_result __exe_result) 0)
    ((:err_code __err_code) 0)
    ((:err_info __err_info) "")
    ((:wait_for_millisec __wait_for_millisec) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _eye_kind (round __eye_kind))
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
  (:eye_kind
   (&optional __eye_kind)
   (if __eye_kind (setq _eye_kind __eye_kind)) _eye_kind)
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
    ;; uint32 _eye_kind
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
     ;; uint32 _eye_kind
       (write-long _eye_kind s)
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
   ;; uint32 _eye_kind
     (setq _eye_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get eye_msgs::EyeState :md5sum-) "41f7fe8eaece5c7faa443d0f00d98c30")
(setf (get eye_msgs::EyeState :datatype-) "eye_msgs/EyeState")
(setf (get eye_msgs::EyeState :definition-)
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

# 人脸录入
uint32 EYE_FACE_RECORD          = 5
uint32 EYE_BODY_RECORD          = 6 
# 欢迎模式
uint32 EYE_WELCOME_DEMO         = 61
# 回大厅找人
uint32 EYE_LOBBY_DEMO           = 62

# 任务取消（不需要请求）
uint32 EYE_CANCEL               = 100

# 类型
uint32 eye_kind
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



(provide :eye_msgs/EyeState "41f7fe8eaece5c7faa443d0f00d98c30")


