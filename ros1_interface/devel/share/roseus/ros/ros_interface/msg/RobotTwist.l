;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::RobotTwist)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'RobotTwist (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::ROBOTTWIST")
  (make-package "ROS_INTERFACE::ROBOTTWIST"))

(in-package "ROS")
;;//! \htmlinclude RobotTwist.msg.html


(defclass ros_interface::RobotTwist
  :super ros::object
  :slots (_linear _angular _action_name ))

(defmethod ros_interface::RobotTwist
  (:init
   (&key
    ((:linear __linear) (instance ros_interface::Vector3 :init))
    ((:angular __angular) (instance ros_interface::Vector3 :init))
    ((:action_name __action_name) "")
    )
   (send-super :init)
   (setq _linear __linear)
   (setq _angular __angular)
   (setq _action_name (string __action_name))
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
  (:action_name
   (&optional __action_name)
   (if __action_name (setq _action_name __action_name)) _action_name)
  (:serialization-length
   ()
   (+
    ;; ros_interface/Vector3 _linear
    (send _linear :serialization-length)
    ;; ros_interface/Vector3 _angular
    (send _angular :serialization-length)
    ;; string _action_name
    4 (length _action_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ros_interface/Vector3 _linear
       (send _linear :serialize s)
     ;; ros_interface/Vector3 _angular
       (send _angular :serialize s)
     ;; string _action_name
       (write-long (length _action_name) s) (princ _action_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ros_interface/Vector3 _linear
     (send _linear :deserialize buf ptr-) (incf ptr- (send _linear :serialization-length))
   ;; ros_interface/Vector3 _angular
     (send _angular :deserialize buf ptr-) (incf ptr- (send _angular :serialization-length))
   ;; string _action_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ros_interface::RobotTwist :md5sum-) "7938edcb0110b16827b9b0f7a4e4695d")
(setf (get ros_interface::RobotTwist :datatype-) "ros_interface/RobotTwist")
(setf (get ros_interface::RobotTwist :definition-)
      "Vector3   linear     # 线速度（x方向 y方向 z方向）
Vector3   angular     # 角速度（x方向 y方向 z方向）
string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了

================================================================================
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  

")



(provide :ros_interface/RobotTwist "7938edcb0110b16827b9b0f7a4e4695d")


