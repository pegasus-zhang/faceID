;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::PointField)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'PointField (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::POINTFIELD")
  (make-package "ROS_INTERFACE::POINTFIELD"))

(in-package "ROS")
;;//! \htmlinclude PointField.msg.html


(defclass ros_interface::PointField
  :super ros::object
  :slots (_name _offset _datatype _count ))

(defmethod ros_interface::PointField
  (:init
   (&key
    ((:name __name) "")
    ((:offset __offset) 0)
    ((:datatype __datatype) 0)
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _offset (round __offset))
   (setq _datatype (round __datatype))
   (setq _count (round __count))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:datatype
   (&optional __datatype)
   (if __datatype (setq _datatype __datatype)) _datatype)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint32 _offset
    4
    ;; uint8 _datatype
    1
    ;; uint32 _count
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint32 _offset
       (write-long _offset s)
     ;; uint8 _datatype
       (write-byte _datatype s)
     ;; uint32 _count
       (write-long _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _offset
     (setq _offset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _datatype
     (setq _datatype (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::PointField :md5sum-) "48e3f56ffdc943e5086f72d2c50c436c")
(setf (get ros_interface::PointField :datatype-) "ros_interface/PointField")
(setf (get ros_interface::PointField :definition-)
      "string   name     # # Name of field
uint32   offset     # # Offset from start of point struct
uint8   datatype     # # Datatype enumeration, see above
uint32   count     # # How many elements in the field

")



(provide :ros_interface/PointField "48e3f56ffdc943e5086f72d2c50c436c")


