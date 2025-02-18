; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude BBox2D.msg.html

(cl:defclass <BBox2D> (roslisp-msg-protocol:ros-message)
  ((xmin
    :reader xmin
    :initarg :xmin
    :type cl:fixnum
    :initform 0)
   (ymin
    :reader ymin
    :initarg :ymin
    :type cl:fixnum
    :initform 0)
   (xmax
    :reader xmax
    :initarg :xmax
    :type cl:fixnum
    :initform 0)
   (ymax
    :reader ymax
    :initarg :ymax
    :type cl:fixnum
    :initform 0))
)

(cl:defclass BBox2D (<BBox2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BBox2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BBox2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<BBox2D> is deprecated: use ros_interface-msg:BBox2D instead.")))

(cl:ensure-generic-function 'xmin-val :lambda-list '(m))
(cl:defmethod xmin-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:xmin-val is deprecated.  Use ros_interface-msg:xmin instead.")
  (xmin m))

(cl:ensure-generic-function 'ymin-val :lambda-list '(m))
(cl:defmethod ymin-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:ymin-val is deprecated.  Use ros_interface-msg:ymin instead.")
  (ymin m))

(cl:ensure-generic-function 'xmax-val :lambda-list '(m))
(cl:defmethod xmax-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:xmax-val is deprecated.  Use ros_interface-msg:xmax instead.")
  (xmax m))

(cl:ensure-generic-function 'ymax-val :lambda-list '(m))
(cl:defmethod ymax-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:ymax-val is deprecated.  Use ros_interface-msg:ymax instead.")
  (ymax m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BBox2D>) ostream)
  "Serializes a message object of type '<BBox2D>"
  (cl:let* ((signed (cl:slot-value msg 'xmin)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ymin)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'xmax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ymax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BBox2D>) istream)
  "Deserializes a message object of type '<BBox2D>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xmin) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ymin) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xmax) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ymax) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BBox2D>)))
  "Returns string type for a message object of type '<BBox2D>"
  "ros_interface/BBox2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BBox2D)))
  "Returns string type for a message object of type 'BBox2D"
  "ros_interface/BBox2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BBox2D>)))
  "Returns md5sum for a message object of type '<BBox2D>"
  "d19258be40eb6712eae30dd94922a828")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BBox2D)))
  "Returns md5sum for a message object of type 'BBox2D"
  "d19258be40eb6712eae30dd94922a828")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BBox2D>)))
  "Returns full string definition for message of type '<BBox2D>"
  (cl:format cl:nil "int16   xmin     # # 图像框左上角的x坐标~%int16   ymin     # # 图像框左上角的y坐标~%int16   xmax     # # 图像框右下角的x坐标~%int16   ymax     # # 图像框右下角的y坐标~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BBox2D)))
  "Returns full string definition for message of type 'BBox2D"
  (cl:format cl:nil "int16   xmin     # # 图像框左上角的x坐标~%int16   ymin     # # 图像框左上角的y坐标~%int16   xmax     # # 图像框右下角的x坐标~%int16   ymax     # # 图像框右下角的y坐标~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BBox2D>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BBox2D>))
  "Converts a ROS message object to a list"
  (cl:list 'BBox2D
    (cl:cons ':xmin (xmin msg))
    (cl:cons ':ymin (ymin msg))
    (cl:cons ':xmax (xmax msg))
    (cl:cons ':ymax (ymax msg))
))
