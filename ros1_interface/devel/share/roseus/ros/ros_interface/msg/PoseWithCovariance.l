;; Auto-generated. Do not edit!


(when (boundp 'ros_interface::PoseWithCovariance)
  (if (not (find-package "ROS_INTERFACE"))
    (make-package "ROS_INTERFACE"))
  (shadow 'PoseWithCovariance (find-package "ROS_INTERFACE")))
(unless (find-package "ROS_INTERFACE::POSEWITHCOVARIANCE")
  (make-package "ROS_INTERFACE::POSEWITHCOVARIANCE"))

(in-package "ROS")
;;//! \htmlinclude PoseWithCovariance.msg.html


(defclass ros_interface::PoseWithCovariance
  :super ros::object
  :slots (_covariance ))

(defmethod ros_interface::PoseWithCovariance
  (:init
   (&key
    ((:covariance __covariance) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _covariance __covariance)
   self)
  (:covariance
   (&optional __covariance)
   (if __covariance (setq _covariance __covariance)) _covariance)
  (:serialization-length
   ()
   (+
    ;; float32[] _covariance
    (* 4    (length _covariance)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _covariance
     (write-long (length _covariance) s)
     (dotimes (i (length _covariance))
       (sys::poke (elt _covariance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _covariance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _covariance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _covariance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get ros_interface::PoseWithCovariance :md5sum-) "e94311bfb2e686d923cb826b25755fa1")
(setf (get ros_interface::PoseWithCovariance :datatype-) "ros_interface/PoseWithCovariance")
(setf (get ros_interface::PoseWithCovariance :definition-)
      "float32[] covariance #  

")



(provide :ros_interface/PoseWithCovariance "e94311bfb2e686d923cb826b25755fa1")


