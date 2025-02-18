;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::BBox2D)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'BBox2D (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::BBOX2D")
  (make-package "ROS_INTERFACE::BBOX2D"))

(in-package "ROS")
;;//! \htmlinclude BBox2D.msg.html


(defclass ros_interface::BBox2D
  :super ros::object
  :slots (_xmin _ymin _xmax _ymax ))

(defmethod ros_interface::BBox2D
  (:init
   (&key
    ((:xmin __xmin) 0)
    ((:ymin __ymin) 0)
    ((:xmax __xmax) 0)
    ((:ymax __ymax) 0)
    )
   (send-super :init)
   (setq _xmin (round __xmin))
   (setq _ymin (round __ymin))
   (setq _xmax (round __xmax))
   (setq _ymax (round __ymax))
   self)
  (:xmin
   (&optional __xmin)
   (if __xmin (setq _xmin __xmin)) _xmin)
  (:ymin
   (&optional __ymin)
   (if __ymin (setq _ymin __ymin)) _ymin)
  (:xmax
   (&optional __xmax)
   (if __xmax (setq _xmax __xmax)) _xmax)
  (:ymax
   (&optional __ymax)
   (if __ymax (setq _ymax __ymax)) _ymax)
  (:serialization-length
   ()
   (+
    ;; int16 _xmin
    2
    ;; int16 _ymin
    2
    ;; int16 _xmax
    2
    ;; int16 _ymax
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _xmin
       (write-word _xmin s)
     ;; int16 _ymin
       (write-word _ymin s)
     ;; int16 _xmax
       (write-word _xmax s)
     ;; int16 _ymax
       (write-word _ymax s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _xmin
     (setq _xmin (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _ymin
     (setq _ymin (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _xmax
     (setq _xmax (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _ymax
     (setq _ymax (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get ros_interface::BBox2D :md5sum-) "d19258be40eb6712eae30dd94922a828")
(setf (get ros_interface::BBox2D :datatype-) "ros_interface/BBox2D")
(setf (get ros_interface::BBox2D :definition-)
      "int16   xmin     # # 图像框左上角的x坐标
int16   ymin     # # 图像框左上角的y坐标
int16   xmax     # # 图像框右下角的x坐标
int16   ymax     # # 图像框右下角的y坐标

")



(provide :ros_interface/BBox2D "d19258be40eb6712eae30dd94922a828")


