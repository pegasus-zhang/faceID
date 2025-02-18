; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Twist.msg.html

(cl:defclass <Twist> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type ros_interface-msg:Vector3
    :initform (cl:make-instance 'ros_interface-msg:Vector3))
   (angular
    :reader angular
    :initarg :angular
    :type ros_interface-msg:Vector3
    :initform (cl:make-instance 'ros_interface-msg:Vector3)))
)

(cl:defclass Twist (<Twist>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Twist>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Twist)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Twist> is deprecated: use ros_interface-msg:Twist instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <Twist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear-val is deprecated.  Use ros_interface-msg:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <Twist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:angular-val is deprecated.  Use ros_interface-msg:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Twist>) ostream)
  "Serializes a message object of type '<Twist>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Twist>) istream)
  "Deserializes a message object of type '<Twist>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Twist>)))
  "Returns string type for a message object of type '<Twist>"
  "ros_interface/Twist")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Twist)))
  "Returns string type for a message object of type 'Twist"
  "ros_interface/Twist")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Twist>)))
  "Returns md5sum for a message object of type '<Twist>"
  "6d107193b261039abb32b01ddb75189b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Twist)))
  "Returns md5sum for a message object of type 'Twist"
  "6d107193b261039abb32b01ddb75189b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Twist>)))
  "Returns full string definition for message of type '<Twist>"
  (cl:format cl:nil "Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Twist)))
  "Returns full string definition for message of type 'Twist"
  (cl:format cl:nil "Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Twist>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Twist>))
  "Converts a ROS message object to a list"
  (cl:list 'Twist
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))
