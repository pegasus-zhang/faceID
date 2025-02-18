;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::OccGrid)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'OccGrid (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::OCCGRID")
  (make-package "ROS_INTERFACE::OCCGRID"))

(in-package "ROS")
;;//! \htmlinclude OccGrid.msg.html


(defclass ros_interface::OccGrid
  :super ros::object
  :slots (_type _index_x _index_y _index_z _grid_size_x _grid_size_y _grid_size_z ))

(defmethod ros_interface::OccGrid
  (:init
   (&key
    ((:type __type) 0)
    ((:index_x __index_x) 0)
    ((:index_y __index_y) 0)
    ((:index_z __index_z) 0)
    ((:grid_size_x __grid_size_x) 0.0)
    ((:grid_size_y __grid_size_y) 0.0)
    ((:grid_size_z __grid_size_z) 0.0)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _index_x (round __index_x))
   (setq _index_y (round __index_y))
   (setq _index_z (round __index_z))
   (setq _grid_size_x (float __grid_size_x))
   (setq _grid_size_y (float __grid_size_y))
   (setq _grid_size_z (float __grid_size_z))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:index_x
   (&optional __index_x)
   (if __index_x (setq _index_x __index_x)) _index_x)
  (:index_y
   (&optional __index_y)
   (if __index_y (setq _index_y __index_y)) _index_y)
  (:index_z
   (&optional __index_z)
   (if __index_z (setq _index_z __index_z)) _index_z)
  (:grid_size_x
   (&optional __grid_size_x)
   (if __grid_size_x (setq _grid_size_x __grid_size_x)) _grid_size_x)
  (:grid_size_y
   (&optional __grid_size_y)
   (if __grid_size_y (setq _grid_size_y __grid_size_y)) _grid_size_y)
  (:grid_size_z
   (&optional __grid_size_z)
   (if __grid_size_z (setq _grid_size_z __grid_size_z)) _grid_size_z)
  (:serialization-length
   ()
   (+
    ;; int32 _type
    4
    ;; int32 _index_x
    4
    ;; int32 _index_y
    4
    ;; int32 _index_z
    4
    ;; float32 _grid_size_x
    4
    ;; float32 _grid_size_y
    4
    ;; float32 _grid_size_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _type
       (write-long _type s)
     ;; int32 _index_x
       (write-long _index_x s)
     ;; int32 _index_y
       (write-long _index_y s)
     ;; int32 _index_z
       (write-long _index_z s)
     ;; float32 _grid_size_x
       (sys::poke _grid_size_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _grid_size_y
       (sys::poke _grid_size_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _grid_size_z
       (sys::poke _grid_size_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index_x
     (setq _index_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index_y
     (setq _index_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index_z
     (setq _index_z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _grid_size_x
     (setq _grid_size_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _grid_size_y
     (setq _grid_size_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _grid_size_z
     (setq _grid_size_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interface::OccGrid :md5sum-) "44aafbeacd0b2f46dbacbb6fc274af9e")
(setf (get ros_interface::OccGrid :datatype-) "ros_interface/OccGrid")
(setf (get ros_interface::OccGrid :definition-)
      "int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
int32   index_x     # //网格横向编号
int32   index_y     # //网格纵向编号
int32   index_z     # //网格垂直方向编号
float32   grid_size_x     # //网格横向大小，单位：米
float32   grid_size_y     # //网格纵向大小，单位：米
float32   grid_size_z     # //网格垂直方向大小，单位：米

")



(provide :ros_interface/OccGrid "44aafbeacd0b2f46dbacbb6fc274af9e")


