;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Twist)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Twist (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::TWIST")
  (make-package "ROS_INTERFACE::TWIST"))

(in-package "ROS")
;;//! \htmlinclude Twist.msg.html


(defclass ros_interface::Twist
  :super ros::object
  :slots (_linear _angular ))

(defmethod ros_interface::Twist
  (:init
   (&key
    ((:linear __linear) (instance ros_interface::Vector3 :init))
    ((:angular __angular) (instance ros_interface::Vector3 :init))
    )
   (send-super :init)
   (setq _linear __linear)
   (setq _angular __angular)
   self)
  (:linear
   (&rest __linear)
   (if (keywordp (car __linear))
       (send* _linear __linear)
     (progn
       (if __linear (setq _linear (car __linear)))
       _linear)))
  (:angular
   (&rest __angular)
   (if (keywordp (car __angular))
       (send* _angular __angular)
     (progn
       (if __angular (setq _angular (car __angular)))
       _angular)))
  (:serialization-length
   ()
   (+
    ;; ros_interface/Vector3 _linear
    (send _linear :serialization-length)
    ;; ros_interface/Vector3 _angular
    (send _angular :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ros_interface/Vector3 _linear
       (send _linear :serialize s)
     ;; ros_interface/Vector3 _angular
       (send _angular :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ros_interface/Vector3 _linear
     (send _linear :deserialize buf ptr-) (incf ptr- (send _linear :serialization-length))
   ;; ros_interface/Vector3 _angular
     (send _angular :deserialize buf ptr-) (incf ptr- (send _angular :serialization-length))
   ;;
   self)
  )

(setf (get ros_interface::Twist :md5sum-) "6d107193b261039abb32b01ddb75189b")
(setf (get ros_interface::Twist :datatype-) "ros_interface/Twist")
(setf (get ros_interface::Twist :definition-)
      "Vector3   linear     # 线速度（x方向 y方向 z方向）
Vector3   angular     # 角速度（x方向 y方向 z方向）

================================================================================
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/Twist "6d107193b261039abb32b01ddb75189b")


