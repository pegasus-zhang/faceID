; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude OccGrid.msg.html

(cl:defclass <OccGrid> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (index_x
    :reader index_x
    :initarg :index_x
    :type cl:integer
    :initform 0)
   (index_y
    :reader index_y
    :initarg :index_y
    :type cl:integer
    :initform 0)
   (index_z
    :reader index_z
    :initarg :index_z
    :type cl:integer
    :initform 0)
   (grid_size_x
    :reader grid_size_x
    :initarg :grid_size_x
    :type cl:float
    :initform 0.0)
   (grid_size_y
    :reader grid_size_y
    :initarg :grid_size_y
    :type cl:float
    :initform 0.0)
   (grid_size_z
    :reader grid_size_z
    :initarg :grid_size_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass OccGrid (<OccGrid>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OccGrid>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OccGrid)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<OccGrid> is deprecated: use ros_interface-msg:OccGrid instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:type-val is deprecated.  Use ros_interface-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'index_x-val :lambda-list '(m))
(cl:defmethod index_x-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:index_x-val is deprecated.  Use ros_interface-msg:index_x instead.")
  (index_x m))

(cl:ensure-generic-function 'index_y-val :lambda-list '(m))
(cl:defmethod index_y-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:index_y-val is deprecated.  Use ros_interface-msg:index_y instead.")
  (index_y m))

(cl:ensure-generic-function 'index_z-val :lambda-list '(m))
(cl:defmethod index_z-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:index_z-val is deprecated.  Use ros_interface-msg:index_z instead.")
  (index_z m))

(cl:ensure-generic-function 'grid_size_x-val :lambda-list '(m))
(cl:defmethod grid_size_x-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:grid_size_x-val is deprecated.  Use ros_interface-msg:grid_size_x instead.")
  (grid_size_x m))

(cl:ensure-generic-function 'grid_size_y-val :lambda-list '(m))
(cl:defmethod grid_size_y-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:grid_size_y-val is deprecated.  Use ros_interface-msg:grid_size_y instead.")
  (grid_size_y m))

(cl:ensure-generic-function 'grid_size_z-val :lambda-list '(m))
(cl:defmethod grid_size_z-val ((m <OccGrid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:grid_size_z-val is deprecated.  Use ros_interface-msg:grid_size_z instead.")
  (grid_size_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OccGrid>) ostream)
  "Serializes a message object of type '<OccGrid>"
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index_z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'grid_size_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'grid_size_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'grid_size_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OccGrid>) istream)
  "Deserializes a message object of type '<OccGrid>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index_z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grid_size_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grid_size_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grid_size_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OccGrid>)))
  "Returns string type for a message object of type '<OccGrid>"
  "ros_interface/OccGrid")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OccGrid)))
  "Returns string type for a message object of type 'OccGrid"
  "ros_interface/OccGrid")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OccGrid>)))
  "Returns md5sum for a message object of type '<OccGrid>"
  "44aafbeacd0b2f46dbacbb6fc274af9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OccGrid)))
  "Returns md5sum for a message object of type 'OccGrid"
  "44aafbeacd0b2f46dbacbb6fc274af9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OccGrid>)))
  "Returns full string definition for message of type '<OccGrid>"
  (cl:format cl:nil "int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%int32   index_x     # //网格横向编号~%int32   index_y     # //网格纵向编号~%int32   index_z     # //网格垂直方向编号~%float32   grid_size_x     # //网格横向大小，单位：米~%float32   grid_size_y     # //网格纵向大小，单位：米~%float32   grid_size_z     # //网格垂直方向大小，单位：米~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OccGrid)))
  "Returns full string definition for message of type 'OccGrid"
  (cl:format cl:nil "int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%int32   index_x     # //网格横向编号~%int32   index_y     # //网格纵向编号~%int32   index_z     # //网格垂直方向编号~%float32   grid_size_x     # //网格横向大小，单位：米~%float32   grid_size_y     # //网格纵向大小，单位：米~%float32   grid_size_z     # //网格垂直方向大小，单位：米~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OccGrid>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OccGrid>))
  "Converts a ROS message object to a list"
  (cl:list 'OccGrid
    (cl:cons ':type (type msg))
    (cl:cons ':index_x (index_x msg))
    (cl:cons ':index_y (index_y msg))
    (cl:cons ':index_z (index_z msg))
    (cl:cons ':grid_size_x (grid_size_x msg))
    (cl:cons ':grid_size_y (grid_size_y msg))
    (cl:cons ':grid_size_z (grid_size_z msg))
))
