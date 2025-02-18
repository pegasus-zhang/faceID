; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude RobotPlan.msg.html

(cl:defclass <RobotPlan> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (twists
    :reader twists
    :initarg :twists
    :type (cl:vector ros_interface-msg:RobotTwist)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:RobotTwist :initial-element (cl:make-instance 'ros_interface-msg:RobotTwist))))
)

(cl:defclass RobotPlan (<RobotPlan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotPlan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotPlan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<RobotPlan> is deprecated: use ros_interface-msg:RobotPlan instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RobotPlan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'twists-val :lambda-list '(m))
(cl:defmethod twists-val ((m <RobotPlan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:twists-val is deprecated.  Use ros_interface-msg:twists instead.")
  (twists m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotPlan>) ostream)
  "Serializes a message object of type '<RobotPlan>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'twists))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'twists))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotPlan>) istream)
  "Deserializes a message object of type '<RobotPlan>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'twists) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'twists)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:RobotTwist))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotPlan>)))
  "Returns string type for a message object of type '<RobotPlan>"
  "ros_interface/RobotPlan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotPlan)))
  "Returns string type for a message object of type 'RobotPlan"
  "ros_interface/RobotPlan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotPlan>)))
  "Returns md5sum for a message object of type '<RobotPlan>"
  "8b76360f7adf2338a7c5b793baf2bfa4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotPlan)))
  "Returns md5sum for a message object of type 'RobotPlan"
  "8b76360f7adf2338a7c5b793baf2bfa4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotPlan>)))
  "Returns full string definition for message of type '<RobotPlan>"
  (cl:format cl:nil "Header   header     #  ~%RobotTwist[] twists #  ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/RobotTwist~%Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotPlan)))
  "Returns full string definition for message of type 'RobotPlan"
  (cl:format cl:nil "Header   header     #  ~%RobotTwist[] twists #  ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/RobotTwist~%Vector3   linear     # 线速度（x方向 y方向 z方向）~%Vector3   angular     # 角速度（x方向 y方向 z方向）~%string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了~%~%================================================================================~%MSG: ros_interface/Vector3~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotPlan>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'twists) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotPlan>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotPlan
    (cl:cons ':header (header msg))
    (cl:cons ':twists (twists msg))
))
