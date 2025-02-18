; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude RobotTwist.msg.html

(cl:defclass <RobotTwist> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type ros_interface-msg:Vector3
    :initform (cl:make-instance 'ros_interface-msg:Vector3))
   (angular
    :reader angular
    :initarg :angular
    :type ros_interface-msg:Vector3
    :initform (cl:make-instance 'ros_interface-msg:Vector3))
   (action_name
    :reader action_name
    :initarg :action_name
    :type cl:string
    :initform ""))
)

(cl:defclass RobotTwist (<RobotTwist>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotTwist>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotTwist)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<RobotTwist> is deprecated: use ros_interface-msg:RobotTwist instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <RobotTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear-val is deprecated.  Use ros_interface-msg:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <RobotTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:angular-val is deprecated.  Use ros_interface-msg:angular instead.")
  (angular m))

(cl:ensure-generic-function 'action_name-val :lambda-list '(m))
(cl:defmethod action_name-val ((m <RobotTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:action_name-val is deprecated.  Use ros_interface-msg:action_name instead.")
  (action_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotTwist>) ostream)
  "Serializes a message object of type '<RobotTwist>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotTwist>) istream)
  "Deserializes a message object of type '<RobotTwist>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotTwist>)))
  "Returns string type for a message object of type '<RobotTwist>"
  "ros_interface/RobotTwist")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTwist)))
  "Returns string type for a message object of type 'RobotTwist"
  "ros_interface/RobotTwist")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotTwist>)))
  "Returns md5sum for a message object of type '<RobotTwist>"
  "7938edcb0110b16827b9b0f7a4e4695d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotTwist)))
  "Returns md5sum for a message object of type 'RobotTwist"
  "7938edcb0110b16827b9b0f7a4e4695d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotTwist>)))
  "Returns full string definition for message of type '<RobotTwist>"
  (cl:format cl:nil "Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotTwist)))
  "Returns full string definition for message of type 'RobotTwist"
  (cl:format cl:nil "Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotTwist>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular))
     4 (cl:length (cl:slot-value msg 'action_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotTwist>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotTwist
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
    (cl:cons ':action_name (action_name msg))
))
