; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude PointLLH.msg.html

(cl:defclass <PointLLH> (roslisp-msg-protocol:ros-message)
  ((lon
    :reader lon
    :initarg :lon
    :type cl:float
    :initform 0.0)
   (lat
    :reader lat
    :initarg :lat
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0))
)

(cl:defclass PointLLH (<PointLLH>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointLLH>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointLLH)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<PointLLH> is deprecated: use ros_interface-msg:PointLLH instead.")))

(cl:ensure-generic-function 'lon-val :lambda-list '(m))
(cl:defmethod lon-val ((m <PointLLH>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:lon-val is deprecated.  Use ros_interface-msg:lon instead.")
  (lon m))

(cl:ensure-generic-function 'lat-val :lambda-list '(m))
(cl:defmethod lat-val ((m <PointLLH>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:lat-val is deprecated.  Use ros_interface-msg:lat instead.")
  (lat m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <PointLLH>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:height-val is deprecated.  Use ros_interface-msg:height instead.")
  (height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointLLH>) ostream)
  "Serializes a message object of type '<PointLLH>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lon))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointLLH>) istream)
  "Deserializes a message object of type '<PointLLH>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lon) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lat) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointLLH>)))
  "Returns string type for a message object of type '<PointLLH>"
  "ros_interface/PointLLH")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointLLH)))
  "Returns string type for a message object of type 'PointLLH"
  "ros_interface/PointLLH")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointLLH>)))
  "Returns md5sum for a message object of type '<PointLLH>"
  "c3958392cb26a0a2103a249fb404dc1d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointLLH)))
  "Returns md5sum for a message object of type 'PointLLH"
  "c3958392cb26a0a2103a249fb404dc1d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointLLH>)))
  "Returns full string definition for message of type '<PointLLH>"
  (cl:format cl:nil "float32   lon     # # Longitude in degrees, ranging from -180 to 180.~%float32   lat     # # Latitude in degrees, ranging from -90 to 90.~%float32   height     # # WGS-84 ellipsoid height in meters.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointLLH)))
  "Returns full string definition for message of type 'PointLLH"
  (cl:format cl:nil "float32   lon     # # Longitude in degrees, ranging from -180 to 180.~%float32   lat     # # Latitude in degrees, ranging from -90 to 90.~%float32   height     # # WGS-84 ellipsoid height in meters.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointLLH>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointLLH>))
  "Converts a ROS message object to a list"
  (cl:list 'PointLLH
    (cl:cons ':lon (lon msg))
    (cl:cons ':lat (lat msg))
    (cl:cons ':height (height msg))
))
