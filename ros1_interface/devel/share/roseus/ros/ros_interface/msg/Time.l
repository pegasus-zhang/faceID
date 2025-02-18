;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Time)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Time (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::TIME")
  (make-package "ROS_INTERFACE::TIME"))

(in-package "ROS")
;;//! \htmlinclude Time.msg.html


(defclass ros_interface::Time
  :super ros::object
  :slots (_sec _nanosec ))

(defmethod ros_interface::Time
  (:init
   (&key
    ((:sec __sec) 0)
    ((:nanosec __nanosec) 0)
    )
   (send-super :init)
   (setq _sec (round __sec))
   (setq _nanosec (round __nanosec))
   self)
  (:sec
   (&optional __sec)
   (if __sec (setq _sec __sec)) _sec)
  (:nanosec
   (&optional __nanosec)
   (if __nanosec (setq _nanosec __nanosec)) _nanosec)
  (:serialization-length
   ()
   (+
    ;; uint32 _sec
    4
    ;; uint32 _nanosec
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _sec
       (write-long _sec s)
     ;; uint32 _nanosec
       (write-long _nanosec s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _sec
     (setq _sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nanosec
     (setq _nanosec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::Time :md5sum-) "339243da06184125ab1f941a8e72a84b")
(setf (get ros_interface::Time :datatype-) "ros_interface/Time")
(setf (get ros_interface::Time :definition-)
      "uint32   sec     # builtin_interfaces.秒
uint32   nanosec     # 纳秒

")



(provide :ros_interface/Time "339243da06184125ab1f941a8e72a84b")


