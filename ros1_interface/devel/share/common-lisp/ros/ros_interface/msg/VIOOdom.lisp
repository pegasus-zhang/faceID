; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude VIOOdom.msg.html

(cl:defclass <VIOOdom> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type ros_interface-msg:PointENU
    :initform (cl:make-instance 'ros_interface-msg:PointENU))
   (orientation
    :reader orientation
    :initarg :orientation
    :type ros_interface-msg:Quaternion
    :initform (cl:make-instance 'ros_interface-msg:Quaternion))
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (position_std_dev
    :reader position_std_dev
    :initarg :position_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (orientation_std_dev
    :reader orientation_std_dev
    :initarg :orientation_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D)))
)

(cl:defclass VIOOdom (<VIOOdom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VIOOdom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VIOOdom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<VIOOdom> is deprecated: use ros_interface-msg:VIOOdom instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:position-val is deprecated.  Use ros_interface-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:orientation-val is deprecated.  Use ros_interface-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:pitch-val is deprecated.  Use ros_interface-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:roll-val is deprecated.  Use ros_interface-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:heading-val is deprecated.  Use ros_interface-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'position_std_dev-val :lambda-list '(m))
(cl:defmethod position_std_dev-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:position_std_dev-val is deprecated.  Use ros_interface-msg:position_std_dev instead.")
  (position_std_dev m))

(cl:ensure-generic-function 'orientation_std_dev-val :lambda-list '(m))
(cl:defmethod orientation_std_dev-val ((m <VIOOdom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:orientation_std_dev-val is deprecated.  Use ros_interface-msg:orientation_std_dev instead.")
  (orientation_std_dev m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VIOOdom>) ostream)
  "Serializes a message object of type '<VIOOdom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position_std_dev) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation_std_dev) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VIOOdom>) istream)
  "Deserializes a message object of type '<VIOOdom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position_std_dev) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation_std_dev) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VIOOdom>)))
  "Returns string type for a message object of type '<VIOOdom>"
  "ros_interface/VIOOdom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VIOOdom)))
  "Returns string type for a message object of type 'VIOOdom"
  "ros_interface/VIOOdom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VIOOdom>)))
  "Returns md5sum for a message object of type '<VIOOdom>"
  "26bbbc0f0fc437f554ced320e72f76c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VIOOdom)))
  "Returns md5sum for a message object of type 'VIOOdom"
  "26bbbc0f0fc437f554ced320e72f76c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VIOOdom>)))
  "Returns full string definition for message of type '<VIOOdom>"
  (cl:format cl:nil "Header   header     #  ~%PointENU   position     # # xxx坐标系下相对于原点的xyz~%Quaternion   orientation     # # 姿态四元数~%float32   pitch     # # 姿态角(单位弧度，满足右手定则)~%float32   roll     #  ~%float32   heading     #  ~%Point3D   position_std_dev     # # 位置标准差~%Point3D   orientation_std_dev     # # 姿态标准差~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PointENU~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/Quaternion~%float32   qx     #  ~%float32   qy     #  ~%float32   qz     #  ~%float32   qw     #  ~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VIOOdom)))
  "Returns full string definition for message of type 'VIOOdom"
  (cl:format cl:nil "Header   header     #  ~%PointENU   position     # # xxx坐标系下相对于原点的xyz~%Quaternion   orientation     # # 姿态四元数~%float32   pitch     # # 姿态角(单位弧度，满足右手定则)~%float32   roll     #  ~%float32   heading     #  ~%Point3D   position_std_dev     # # 位置标准差~%Point3D   orientation_std_dev     # # 姿态标准差~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PointENU~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/Quaternion~%float32   qx     #  ~%float32   qy     #  ~%float32   qz     #  ~%float32   qw     #  ~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VIOOdom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position_std_dev))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation_std_dev))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VIOOdom>))
  "Converts a ROS message object to a list"
  (cl:list 'VIOOdom
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':position_std_dev (position_std_dev msg))
    (cl:cons ':orientation_std_dev (orientation_std_dev msg))
))
