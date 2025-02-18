;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::QuadbotCmd)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'QuadbotCmd (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::QUADBOTCMD")
  (make-package "ROS_INTERFACE::QUADBOTCMD"))

(in-package "ROS")
;;//! \htmlinclude QuadbotCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ros_interface::QuadbotCmd
  :super ros::object
  :slots (_header _action_id _quadbot_kind _action_name _twist _complex_cmd ))

(defmethod ros_interface::QuadbotCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action_id __action_id) 0)
    ((:quadbot_kind __quadbot_kind) 0)
    ((:action_name __action_name) "")
    ((:twist __twist) (instance ros_interface::Twist :init))
    ((:complex_cmd __complex_cmd) (instance ros_interface::ComplexCommand :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _action_id (round __action_id))
   (setq _quadbot_kind (round __quadbot_kind))
   (setq _action_name (string __action_name))
   (setq _twist __twist)
   (setq _complex_cmd __complex_cmd)
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
  (:quadbot_kind
   (&optional __quadbot_kind)
   (if __quadbot_kind (setq _quadbot_kind __quadbot_kind)) _quadbot_kind)
  (:action_name
   (&optional __action_name)
   (if __action_name (setq _action_name __action_name)) _action_name)
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:complex_cmd
   (&rest __complex_cmd)
   (if (keywordp (car __complex_cmd))
       (send* _complex_cmd __complex_cmd)
     (progn
       (if __complex_cmd (setq _complex_cmd (car __complex_cmd)))
       _complex_cmd)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _action_id
    8
    ;; int32 _quadbot_kind
    4
    ;; string _action_name
    4 (length _action_name)
    ;; ros_interface/Twist _twist
    (send _twist :serialization-length)
    ;; ros_interface/ComplexCommand _complex_cmd
    (send _complex_cmd :serialization-length)
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
     ;; int32 _quadbot_kind
       (write-long _quadbot_kind s)
     ;; string _action_name
       (write-long (length _action_name) s) (princ _action_name s)
     ;; ros_interface/Twist _twist
       (send _twist :serialize s)
     ;; ros_interface/ComplexCommand _complex_cmd
       (send _complex_cmd :serialize s)
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
   ;; int32 _quadbot_kind
     (setq _quadbot_kind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _action_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; ros_interface/Twist _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;; ros_interface/ComplexCommand _complex_cmd
     (send _complex_cmd :deserialize buf ptr-) (incf ptr- (send _complex_cmd :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::QuadbotCmd :md5sum-) "b913b00e78766226918c3d24c7939f9a")
(setf (get ros_interface::QuadbotCmd :datatype-) "ros_interface/QuadbotCmd")
(setf (get ros_interface::QuadbotCmd :definition-)
      "Header   header     #  
uint64   action_id     # #动作执行id
int32   quadbot_kind     # #简单指令（坐下...）；复杂指令（走直线/走圆弧）
string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了
Twist   twist     #  
ComplexCommand   complex_cmd     # #规划端不使用这个指令

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
MSG: ros_interface/Twist
Vector3   linear     # 线速度（x方向 y方向 z方向）
Vector3   angular     # 角速度（x方向 y方向 z方向）

================================================================================
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  

================================================================================
MSG: ros_interface/ComplexCommand
uint8   type_id     #  
uint8   unit_id     #  
float32   data_a     #  
float32   data_b     #  

")



(provide :ros_interface/QuadbotCmd "b913b00e78766226918c3d24c7939f9a")


