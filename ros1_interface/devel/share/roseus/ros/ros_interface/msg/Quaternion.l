;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::Quaternion)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'Quaternion (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::QUATERNION")
  (make-package "ROS_INTERFACE::QUATERNION"))

(in-package "ROS")
;;//! \htmlinclude Quaternion.msg.html


(defclass ros_interface::Quaternion
  :super ros::object
  :slots (_qx _qy _qz _qw ))

(defmethod ros_interface::Quaternion
  (:init
   (&key
    ((:qx __qx) 0.0)
    ((:qy __qy) 0.0)
    ((:qz __qz) 0.0)
    ((:qw __qw) 0.0)
    )
   (send-super :init)
   (setq _qx (float __qx))
   (setq _qy (float __qy))
   (setq _qz (float __qz))
   (setq _qw (float __qw))
   self)
  (:qx
   (&optional __qx)
   (if __qx (setq _qx __qx)) _qx)
  (:qy
   (&optional __qy)
   (if __qy (setq _qy __qy)) _qy)
  (:qz
   (&optional __qz)
   (if __qz (setq _qz __qz)) _qz)
  (:qw
   (&optional __qw)
   (if __qw (setq _qw __qw)) _qw)
  (:serialization-length
   ()
   (+
    ;; float32 _qx
    4
    ;; float32 _qy
    4
    ;; float32 _qz
    4
    ;; float32 _qw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _qx
       (sys::poke _qx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _qy
       (sys::poke _qy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _qz
       (sys::poke _qz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _qw
       (sys::poke _qw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _qx
     (setq _qx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _qy
     (setq _qy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _qz
     (setq _qz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _qw
     (setq _qw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::Quaternion :md5sum-) "da959fb3fb7383ea37fa4a34b97f97ff")
(setf (get ros_interface::Quaternion :datatype-) "ros_interface/Quaternion")
(setf (get ros_interface::Quaternion :definition-)
      "float32   qx     #  
float32   qy     #  
float32   qz     #  
float32   qw     #  

")



(provide :ros_interface/Quaternion "da959fb3fb7383ea37fa4a34b97f97ff")


