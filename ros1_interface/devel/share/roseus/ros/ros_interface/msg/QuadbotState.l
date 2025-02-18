;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::QuadbotState)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'QuadbotState (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::QUADBOTSTATE")
  (make-package "ROS_INTERFACE::QUADBOTSTATE"))

(in-package "ROS")
;;//! \htmlinclude QuadbotState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::QuadbotState
  :super ros::object
  :slots (_header _action_id _action_name _action_state _action_result _exe_name _exe_state _exe_result _err_code _err_info _wait_for_millisec ))

(defmethod ros_interface::QuadbotState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:action_name __action_name) "")
    ((:action_state __action_state) 0)
    ((:action_result __action_result) 0)
    ((:exe_name __exe_name) "")
    ((:exe_state __exe_state) 0)
    ((:exe_result __exe_result) 0)
    ((:err_code __err_code) 0)
    ((:err_info __err_info) "")
    ((:wait_for_millisec __wait_for_millisec) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _action_name (string __action_name))
   (setq _action_state (round __action_state))
   (setq _action_result (round __action_result))
   (setq _exe_name (string __exe_name))
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
  (:action_name
   (&optional __action_name)
   (if __action_name (setq _action_name __action_name)) _action_name)
  (:action_state
   (&optional __action_state)
   (if __action_state (setq _action_state __action_state)) _action_state)
  (:action_result
   (&optional __action_result)
   (if __action_result (setq _action_result __action_result)) _action_result)
  (:exe_name
   (&optional __exe_name)
   (if __exe_name (setq _exe_name __exe_name)) _exe_name)
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
    ;; string _action_name
    4 (length _action_name)
    ;; int32 _action_state
    4
    ;; int32 _action_result
    4
    ;; string _exe_name
    4 (length _exe_name)
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
     ;; string _action_name
       (write-long (length _action_name) s) (princ _action_name s)
     ;; int32 _action_state
       (write-long _action_state s)
     ;; int32 _action_result
       (write-long _action_result s)
     ;; string _exe_name
       (write-long (length _exe_name) s) (princ _exe_name s)
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
   ;; string _action_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _action_state
     (setq _action_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _action_result
     (setq _action_result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _exe_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _exe_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get ros_interface::QuadbotState :md5sum-) "62874a497f75be8fb0d09338630a9af5")
(setf (get ros_interface::QuadbotState :datatype-) "ros_interface/QuadbotState")
(setf (get ros_interface::QuadbotState :definition-)
      "Header   header     #  
uint64   action_id     # #动作执行id
string   action_name     #  
int32   action_state     #  
int32   action_result     #  
string   exe_name     #  
int32   exe_state     #  
int32   exe_result     #  
int32   err_code     #  
string   err_info     #  
uint64   wait_for_millisec     #  

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



(provide :ros_interface/QuadbotState "62874a497f75be8fb0d09338630a9af5")


