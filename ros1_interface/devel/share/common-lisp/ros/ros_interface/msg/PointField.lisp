; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude PointField.msg.html

(cl:defclass <PointField> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (offset
    :reader offset
    :initarg :offset
    :type cl:integer
    :initform 0)
   (datatype
    :reader datatype
    :initarg :datatype
    :type cl:fixnum
    :initform 0)
   (count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0))
)

(cl:defclass PointField (<PointField>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointField>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointField)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<PointField> is deprecated: use ros_interface-msg:PointField instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:name-val is deprecated.  Use ros_interface-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'offset-val :lambda-list '(m))
(cl:defmethod offset-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:offset-val is deprecated.  Use ros_interface-msg:offset instead.")
  (offset m))

(cl:ensure-generic-function 'datatype-val :lambda-list '(m))
(cl:defmethod datatype-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:datatype-val is deprecated.  Use ros_interface-msg:datatype instead.")
  (datatype m))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:count-val is deprecated.  Use ros_interface-msg:count instead.")
  (count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointField>) ostream)
  "Serializes a message object of type '<PointField>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'datatype)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'count)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointField>) istream)
  "Deserializes a message object of type '<PointField>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'datatype)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'count)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointField>)))
  "Returns string type for a message object of type '<PointField>"
  "ros_interface/PointField")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointField)))
  "Returns string type for a message object of type 'PointField"
  "ros_interface/PointField")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointField>)))
  "Returns md5sum for a message object of type '<PointField>"
  "48e3f56ffdc943e5086f72d2c50c436c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointField)))
  "Returns md5sum for a message object of type 'PointField"
  "48e3f56ffdc943e5086f72d2c50c436c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointField>)))
  "Returns full string definition for message of type '<PointField>"
  (cl:format cl:nil "string   name     # # Name of field~%uint32   offset     # # Offset from start of point struct~%uint8   datatype     # # Datatype enumeration, see above~%uint32   count     # # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointField)))
  "Returns full string definition for message of type 'PointField"
  (cl:format cl:nil "string   name     # # Name of field~%uint32   offset     # # Offset from start of point struct~%uint8   datatype     # # Datatype enumeration, see above~%uint32   count     # # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointField>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointField>))
  "Converts a ROS message object to a list"
  (cl:list 'PointField
    (cl:cons ':name (name msg))
    (cl:cons ':offset (offset msg))
    (cl:cons ':datatype (datatype msg))
    (cl:cons ':count (count msg))
))
