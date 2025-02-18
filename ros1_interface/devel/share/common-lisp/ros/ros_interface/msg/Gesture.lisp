; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Gesture.msg.html

(cl:defclass <Gesture> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (confidence
    :reader confidence
    :initarg :confidence
    :type cl:float
    :initform 0.0)
   (gesture_type
    :reader gesture_type
    :initarg :gesture_type
    :type cl:integer
    :initform 0)
   (gesture_box
    :reader gesture_box
    :initarg :gesture_box
    :type ros_interface-msg:BBox2D
    :initform (cl:make-instance 'ros_interface-msg:BBox2D)))
)

(cl:defclass Gesture (<Gesture>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gesture>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gesture)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Gesture> is deprecated: use ros_interface-msg:Gesture instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Gesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Gesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:id-val is deprecated.  Use ros_interface-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <Gesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:confidence-val is deprecated.  Use ros_interface-msg:confidence instead.")
  (confidence m))

(cl:ensure-generic-function 'gesture_type-val :lambda-list '(m))
(cl:defmethod gesture_type-val ((m <Gesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:gesture_type-val is deprecated.  Use ros_interface-msg:gesture_type instead.")
  (gesture_type m))

(cl:ensure-generic-function 'gesture_box-val :lambda-list '(m))
(cl:defmethod gesture_box-val ((m <Gesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:gesture_box-val is deprecated.  Use ros_interface-msg:gesture_box instead.")
  (gesture_box m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gesture>) ostream)
  "Serializes a message object of type '<Gesture>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'gesture_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gesture_box) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gesture>) istream)
  "Deserializes a message object of type '<Gesture>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gesture_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gesture_box) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gesture>)))
  "Returns string type for a message object of type '<Gesture>"
  "ros_interface/Gesture")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gesture)))
  "Returns string type for a message object of type 'Gesture"
  "ros_interface/Gesture")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gesture>)))
  "Returns md5sum for a message object of type '<Gesture>"
  "0281d8a12e33d2fbe20a398379db4076")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gesture)))
  "Returns md5sum for a message object of type 'Gesture"
  "0281d8a12e33d2fbe20a398379db4076")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gesture>)))
  "Returns full string definition for message of type '<Gesture>"
  (cl:format cl:nil "Header   header     #  ~%uint8   id     # #手势ID~%float32   confidence     # #置信度~%int32   gesture_type     # #手势类型，GESTURE_TYPE=0//未知模式，GESTURE_TYPE=1//来，手指指向下方，GESTURE_TYPE=2//握手，GESTURE_TYPE=3//招手，打招呼~%BBox2D   gesture_box     # # 手势图像框~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/BBox2D~%int16   xmin     # # 图像框左上角的x坐标~%int16   ymin     # # 图像框左上角的y坐标~%int16   xmax     # # 图像框右下角的x坐标~%int16   ymax     # # 图像框右下角的y坐标~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gesture)))
  "Returns full string definition for message of type 'Gesture"
  (cl:format cl:nil "Header   header     #  ~%uint8   id     # #手势ID~%float32   confidence     # #置信度~%int32   gesture_type     # #手势类型，GESTURE_TYPE=0//未知模式，GESTURE_TYPE=1//来，手指指向下方，GESTURE_TYPE=2//握手，GESTURE_TYPE=3//招手，打招呼~%BBox2D   gesture_box     # # 手势图像框~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/BBox2D~%int16   xmin     # # 图像框左上角的x坐标~%int16   ymin     # # 图像框左上角的y坐标~%int16   xmax     # # 图像框右下角的x坐标~%int16   ymax     # # 图像框右下角的y坐标~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gesture>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gesture_box))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gesture>))
  "Converts a ROS message object to a list"
  (cl:list 'Gesture
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':confidence (confidence msg))
    (cl:cons ':gesture_type (gesture_type msg))
    (cl:cons ':gesture_box (gesture_box msg))
))
