;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Header)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Header (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::HEADER")
  (make-package "ROS_INTERFACE::HEADER"))

(in-package "ROS")
;;//! \htmlinclude Header.msg.html


(defclass ros_interface::Header
  :super ros::object
  :slots (_seq _stamp _frame_id ))

(defmethod ros_interface::Header
  (:init
   (&key
    ((:seq __seq) 0)
    ((:stamp __stamp) (instance ros_interface::Time :init))
    ((:frame_id __frame_id) "")
    )
   (send-super :init)
   (setq _seq (round __seq))
   (setq _stamp __stamp)
   (setq _frame_id (string __frame_id))
   self)
  (:seq
   (&optional __seq)
   (if __seq (setq _seq __seq)) _seq)
  (:stamp
   (&rest __stamp)
   (if (keywordp (car __stamp))
       (send* _stamp __stamp)
     (progn
       (if __stamp (setq _stamp (car __stamp)))
       _stamp)))
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:serialization-length
   ()
   (+
    ;; uint32 _seq
    4
    ;; ros_interface/Time _stamp
    (send _stamp :serialization-length)
    ;; string _frame_id
    4 (length _frame_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _seq
       (write-long _seq s)
     ;; ros_interface/Time _stamp
       (send _stamp :serialize s)
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _seq
     (setq _seq (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; ros_interface/Time _stamp
     (send _stamp :deserialize buf ptr-) (incf ptr- (send _stamp :serialization-length))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ros_interface::Header :md5sum-) "0c5bf43024b68e0783400bcaa26f13ef")
(setf (get ros_interface::Header :datatype-) "ros_interface/Header")
(setf (get ros_interface::Header :definition-)
      "uint32   seq     # std_msgs.Sequence number for each message. Each module maintains its own counter for sequence_num, always starting from 1 on boot.
Time   stamp     # 时间戳
string   frame_id     # 帧id

================================================================================
MSG: ros_interface/Time
uint32   sec     # builtin_interfaces.秒
uint32   nanosec     # 纳秒

")



(provide :ros_interface/Header "0c5bf43024b68e0783400bcaa26f13ef")


