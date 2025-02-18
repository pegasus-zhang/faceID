; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Polygon3D.msg.html

(cl:defclass <Polygon3D> (roslisp-msg-protocol:ros-message)
  ((coordinate_system
    :reader coordinate_system
    :initarg :coordinate_system
    :type cl:integer
    :initform 0)
   (points
    :reader points
    :initarg :points
    :type (cl:vector ros_interface-msg:Point3D)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:Point3D :initial-element (cl:make-instance 'ros_interface-msg:Point3D))))
)

(cl:defclass Polygon3D (<Polygon3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Polygon3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Polygon3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Polygon3D> is deprecated: use ros_interface-msg:Polygon3D instead.")))

(cl:ensure-generic-function 'coordinate_system-val :lambda-list '(m))
(cl:defmethod coordinate_system-val ((m <Polygon3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:coordinate_system-val is deprecated.  Use ros_interface-msg:coordinate_system instead.")
  (coordinate_system m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Polygon3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:points-val is deprecated.  Use ros_interface-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Polygon3D>) ostream)
  "Serializes a message object of type '<Polygon3D>"
  (cl:let* ((signed (cl:slot-value msg 'coordinate_system)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Polygon3D>) istream)
  "Deserializes a message object of type '<Polygon3D>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'coordinate_system) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:Point3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Polygon3D>)))
  "Returns string type for a message object of type '<Polygon3D>"
  "ros_interface/Polygon3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Polygon3D)))
  "Returns string type for a message object of type 'Polygon3D"
  "ros_interface/Polygon3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Polygon3D>)))
  "Returns md5sum for a message object of type '<Polygon3D>"
  "badbfc2b6a0c2dc8f8c20c4bfe03c2ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Polygon3D)))
  "Returns md5sum for a message object of type 'Polygon3D"
  "badbfc2b6a0c2dc8f8c20c4bfe03c2ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Polygon3D>)))
  "Returns full string definition for message of type '<Polygon3D>"
  (cl:format cl:nil "int32   coordinate_system     # 坐标系~%Point3D[] points # 三维点集~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Polygon3D)))
  "Returns full string definition for message of type 'Polygon3D"
  (cl:format cl:nil "int32   coordinate_system     # 坐标系~%Point3D[] points # 三维点集~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Polygon3D>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Polygon3D>))
  "Converts a ROS message object to a list"
  (cl:list 'Polygon3D
    (cl:cons ':coordinate_system (coordinate_system msg))
    (cl:cons ':points (points msg))
))
