; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Odometry.msg.html

(cl:defclass <Odometry> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (child_frame_id
    :reader child_frame_id
    :initarg :child_frame_id
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type ros_interface-msg:PoseWithCovariance
    :initform (cl:make-instance 'ros_interface-msg:PoseWithCovariance))
   (twist
    :reader twist
    :initarg :twist
    :type ros_interface-msg:TwistWithCovariance
    :initform (cl:make-instance 'ros_interface-msg:TwistWithCovariance)))
)

(cl:defclass Odometry (<Odometry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Odometry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Odometry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Odometry> is deprecated: use ros_interface-msg:Odometry instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'child_frame_id-val :lambda-list '(m))
(cl:defmethod child_frame_id-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:child_frame_id-val is deprecated.  Use ros_interface-msg:child_frame_id instead.")
  (child_frame_id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:pose-val is deprecated.  Use ros_interface-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:twist-val is deprecated.  Use ros_interface-msg:twist instead.")
  (twist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Odometry>) ostream)
  "Serializes a message object of type '<Odometry>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'child_frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'child_frame_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Odometry>) istream)
  "Deserializes a message object of type '<Odometry>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'child_frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'child_frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Odometry>)))
  "Returns string type for a message object of type '<Odometry>"
  "ros_interface/Odometry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Odometry)))
  "Returns string type for a message object of type 'Odometry"
  "ros_interface/Odometry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Odometry>)))
  "Returns md5sum for a message object of type '<Odometry>"
  "22d96cb55252fc83b8a389e3f3a97fc7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Odometry)))
  "Returns md5sum for a message object of type 'Odometry"
  "22d96cb55252fc83b8a389e3f3a97fc7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Odometry>)))
  "Returns full string definition for message of type '<Odometry>"
  (cl:format cl:nil "Header   header     #  ~%string   child_frame_id     #  ~%PoseWithCovariance   pose     #  ~%TwistWithCovariance   twist     #  ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PoseWithCovariance~%float32[] covariance #  ~%~%================================================================================~%MSG: ros_interface/TwistWithCovariance~%float32[] covariance #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Odometry)))
  "Returns full string definition for message of type 'Odometry"
  (cl:format cl:nil "Header   header     #  ~%string   child_frame_id     #  ~%PoseWithCovariance   pose     #  ~%TwistWithCovariance   twist     #  ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PoseWithCovariance~%float32[] covariance #  ~%~%================================================================================~%MSG: ros_interface/TwistWithCovariance~%float32[] covariance #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Odometry>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'child_frame_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Odometry>))
  "Converts a ROS message object to a list"
  (cl:list 'Odometry
    (cl:cons ':header (header msg))
    (cl:cons ':child_frame_id (child_frame_id msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':twist (twist msg))
))
