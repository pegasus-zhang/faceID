; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Quaternion.msg.html

(cl:defclass <Quaternion> (roslisp-msg-protocol:ros-message)
  ((qx
    :reader qx
    :initarg :qx
    :type cl:float
    :initform 0.0)
   (qy
    :reader qy
    :initarg :qy
    :type cl:float
    :initform 0.0)
   (qz
    :reader qz
    :initarg :qz
    :type cl:float
    :initform 0.0)
   (qw
    :reader qw
    :initarg :qw
    :type cl:float
    :initform 0.0))
)

(cl:defclass Quaternion (<Quaternion>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Quaternion>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Quaternion)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Quaternion> is deprecated: use ros_interface-msg:Quaternion instead.")))

(cl:ensure-generic-function 'qx-val :lambda-list '(m))
(cl:defmethod qx-val ((m <Quaternion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:qx-val is deprecated.  Use ros_interface-msg:qx instead.")
  (qx m))

(cl:ensure-generic-function 'qy-val :lambda-list '(m))
(cl:defmethod qy-val ((m <Quaternion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:qy-val is deprecated.  Use ros_interface-msg:qy instead.")
  (qy m))

(cl:ensure-generic-function 'qz-val :lambda-list '(m))
(cl:defmethod qz-val ((m <Quaternion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:qz-val is deprecated.  Use ros_interface-msg:qz instead.")
  (qz m))

(cl:ensure-generic-function 'qw-val :lambda-list '(m))
(cl:defmethod qw-val ((m <Quaternion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:qw-val is deprecated.  Use ros_interface-msg:qw instead.")
  (qw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Quaternion>) ostream)
  "Serializes a message object of type '<Quaternion>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'qx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'qy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'qz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'qw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Quaternion>) istream)
  "Deserializes a message object of type '<Quaternion>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qz) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Quaternion>)))
  "Returns string type for a message object of type '<Quaternion>"
  "ros_interface/Quaternion")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Quaternion)))
  "Returns string type for a message object of type 'Quaternion"
  "ros_interface/Quaternion")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Quaternion>)))
  "Returns md5sum for a message object of type '<Quaternion>"
  "da959fb3fb7383ea37fa4a34b97f97ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Quaternion)))
  "Returns md5sum for a message object of type 'Quaternion"
  "da959fb3fb7383ea37fa4a34b97f97ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Quaternion>)))
  "Returns full string definition for message of type '<Quaternion>"
  (cl:format cl:nil "float32   qx     #  ~%float32   qy     #  ~%float32   qz     #  ~%float32   qw     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Quaternion)))
  "Returns full string definition for message of type 'Quaternion"
  (cl:format cl:nil "float32   qx     #  ~%float32   qy     #  ~%float32   qz     #  ~%float32   qw     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Quaternion>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Quaternion>))
  "Converts a ROS message object to a list"
  (cl:list 'Quaternion
    (cl:cons ':qx (qx msg))
    (cl:cons ':qy (qy msg))
    (cl:cons ':qz (qz msg))
    (cl:cons ':qw (qw msg))
))
