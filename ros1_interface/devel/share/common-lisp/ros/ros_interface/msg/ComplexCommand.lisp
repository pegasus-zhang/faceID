; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude ComplexCommand.msg.html

(cl:defclass <ComplexCommand> (roslisp-msg-protocol:ros-message)
  ((type_id
    :reader type_id
    :initarg :type_id
    :type cl:fixnum
    :initform 0)
   (unit_id
    :reader unit_id
    :initarg :unit_id
    :type cl:fixnum
    :initform 0)
   (data_a
    :reader data_a
    :initarg :data_a
    :type cl:float
    :initform 0.0)
   (data_b
    :reader data_b
    :initarg :data_b
    :type cl:float
    :initform 0.0))
)

(cl:defclass ComplexCommand (<ComplexCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComplexCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComplexCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<ComplexCommand> is deprecated: use ros_interface-msg:ComplexCommand instead.")))

(cl:ensure-generic-function 'type_id-val :lambda-list '(m))
(cl:defmethod type_id-val ((m <ComplexCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:type_id-val is deprecated.  Use ros_interface-msg:type_id instead.")
  (type_id m))

(cl:ensure-generic-function 'unit_id-val :lambda-list '(m))
(cl:defmethod unit_id-val ((m <ComplexCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:unit_id-val is deprecated.  Use ros_interface-msg:unit_id instead.")
  (unit_id m))

(cl:ensure-generic-function 'data_a-val :lambda-list '(m))
(cl:defmethod data_a-val ((m <ComplexCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:data_a-val is deprecated.  Use ros_interface-msg:data_a instead.")
  (data_a m))

(cl:ensure-generic-function 'data_b-val :lambda-list '(m))
(cl:defmethod data_b-val ((m <ComplexCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:data_b-val is deprecated.  Use ros_interface-msg:data_b instead.")
  (data_b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComplexCommand>) ostream)
  "Serializes a message object of type '<ComplexCommand>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'unit_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'data_a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'data_b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComplexCommand>) istream)
  "Deserializes a message object of type '<ComplexCommand>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'unit_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data_a) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data_b) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComplexCommand>)))
  "Returns string type for a message object of type '<ComplexCommand>"
  "ros_interface/ComplexCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComplexCommand)))
  "Returns string type for a message object of type 'ComplexCommand"
  "ros_interface/ComplexCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComplexCommand>)))
  "Returns md5sum for a message object of type '<ComplexCommand>"
  "06403e95fe785afd6352f59c7b849afb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComplexCommand)))
  "Returns md5sum for a message object of type 'ComplexCommand"
  "06403e95fe785afd6352f59c7b849afb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComplexCommand>)))
  "Returns full string definition for message of type '<ComplexCommand>"
  (cl:format cl:nil "uint8   type_id     #  ~%uint8   unit_id     #  ~%float32   data_a     #  ~%float32   data_b     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComplexCommand)))
  "Returns full string definition for message of type 'ComplexCommand"
  (cl:format cl:nil "uint8   type_id     #  ~%uint8   unit_id     #  ~%float32   data_a     #  ~%float32   data_b     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComplexCommand>))
  (cl:+ 0
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComplexCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ComplexCommand
    (cl:cons ':type_id (type_id msg))
    (cl:cons ':unit_id (unit_id msg))
    (cl:cons ':data_a (data_a msg))
    (cl:cons ':data_b (data_b msg))
))
