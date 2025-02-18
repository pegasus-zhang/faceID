;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::ComplexCommand)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'ComplexCommand (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::COMPLEXCOMMAND")
  (make-package "ROS_INTERFACE::COMPLEXCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ComplexCommand.msg.html


(defclass ros_interface::ComplexCommand
  :super ros::object
  :slots (_type_id _unit_id _data_a _data_b ))

(defmethod ros_interface::ComplexCommand
  (:init
   (&key
    ((:type_id __type_id) 0)
    ((:unit_id __unit_id) 0)
    ((:data_a __data_a) 0.0)
    ((:data_b __data_b) 0.0)
    )
   (send-super :init)
   (setq _type_id (round __type_id))
   (setq _unit_id (round __unit_id))
   (setq _data_a (float __data_a))
   (setq _data_b (float __data_b))
   self)
  (:type_id
   (&optional __type_id)
   (if __type_id (setq _type_id __type_id)) _type_id)
  (:unit_id
   (&optional __unit_id)
   (if __unit_id (setq _unit_id __unit_id)) _unit_id)
  (:data_a
   (&optional __data_a)
   (if __data_a (setq _data_a __data_a)) _data_a)
  (:data_b
   (&optional __data_b)
   (if __data_b (setq _data_b __data_b)) _data_b)
  (:serialization-length
   ()
   (+
    ;; uint8 _type_id
    1
    ;; uint8 _unit_id
    1
    ;; float32 _data_a
    4
    ;; float32 _data_b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _type_id
       (write-byte _type_id s)
     ;; uint8 _unit_id
       (write-byte _unit_id s)
     ;; float32 _data_a
       (sys::poke _data_a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _data_b
       (sys::poke _data_b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _type_id
     (setq _type_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _unit_id
     (setq _unit_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _data_a
     (setq _data_a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _data_b
     (setq _data_b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::ComplexCommand :md5sum-) "06403e95fe785afd6352f59c7b849afb")
(setf (get ros_interface::ComplexCommand :datatype-) "ros_interface/ComplexCommand")
(setf (get ros_interface::ComplexCommand :definition-)
      "uint8   type_id     #  
uint8   unit_id     #  
float32   data_a     #  
float32   data_b     #  

")



(provide :ros_interface/ComplexCommand "06403e95fe785afd6352f59c7b849afb")


