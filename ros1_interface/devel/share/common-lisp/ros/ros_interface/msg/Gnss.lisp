; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude Gnss.msg.html

(cl:defclass <Gnss> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (is_valid
    :reader is_valid
    :initarg :is_valid
    :type cl:boolean
    :initform cl:nil)
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (elevation
    :reader elevation
    :initarg :elevation
    :type cl:float
    :initform 0.0)
   (utm_position
    :reader utm_position
    :initarg :utm_position
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (attitude
    :reader attitude
    :initarg :attitude
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (sd_position
    :reader sd_position
    :initarg :sd_position
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (sd_velocity
    :reader sd_velocity
    :initarg :sd_velocity
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (sd_attitude
    :reader sd_attitude
    :initarg :sd_attitude
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (second
    :reader second
    :initarg :second
    :type cl:float
    :initform 0.0)
   (sat_use_num
    :reader sat_use_num
    :initarg :sat_use_num
    :type cl:integer
    :initform 0)
   (sat_in_view_num
    :reader sat_in_view_num
    :initarg :sat_in_view_num
    :type cl:integer
    :initform 0)
   (solution_status
    :reader solution_status
    :initarg :solution_status
    :type cl:fixnum
    :initform 0)
   (position_type
    :reader position_type
    :initarg :position_type
    :type cl:fixnum
    :initform 0)
   (linear_velocity
    :reader linear_velocity
    :initarg :linear_velocity
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D)))
)

(cl:defclass Gnss (<Gnss>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gnss>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gnss)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<Gnss> is deprecated: use ros_interface-msg:Gnss instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'is_valid-val :lambda-list '(m))
(cl:defmethod is_valid-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:is_valid-val is deprecated.  Use ros_interface-msg:is_valid instead.")
  (is_valid m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:latitude-val is deprecated.  Use ros_interface-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:longitude-val is deprecated.  Use ros_interface-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'elevation-val :lambda-list '(m))
(cl:defmethod elevation-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:elevation-val is deprecated.  Use ros_interface-msg:elevation instead.")
  (elevation m))

(cl:ensure-generic-function 'utm_position-val :lambda-list '(m))
(cl:defmethod utm_position-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:utm_position-val is deprecated.  Use ros_interface-msg:utm_position instead.")
  (utm_position m))

(cl:ensure-generic-function 'attitude-val :lambda-list '(m))
(cl:defmethod attitude-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:attitude-val is deprecated.  Use ros_interface-msg:attitude instead.")
  (attitude m))

(cl:ensure-generic-function 'sd_position-val :lambda-list '(m))
(cl:defmethod sd_position-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:sd_position-val is deprecated.  Use ros_interface-msg:sd_position instead.")
  (sd_position m))

(cl:ensure-generic-function 'sd_velocity-val :lambda-list '(m))
(cl:defmethod sd_velocity-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:sd_velocity-val is deprecated.  Use ros_interface-msg:sd_velocity instead.")
  (sd_velocity m))

(cl:ensure-generic-function 'sd_attitude-val :lambda-list '(m))
(cl:defmethod sd_attitude-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:sd_attitude-val is deprecated.  Use ros_interface-msg:sd_attitude instead.")
  (sd_attitude m))

(cl:ensure-generic-function 'second-val :lambda-list '(m))
(cl:defmethod second-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:second-val is deprecated.  Use ros_interface-msg:second instead.")
  (second m))

(cl:ensure-generic-function 'sat_use_num-val :lambda-list '(m))
(cl:defmethod sat_use_num-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:sat_use_num-val is deprecated.  Use ros_interface-msg:sat_use_num instead.")
  (sat_use_num m))

(cl:ensure-generic-function 'sat_in_view_num-val :lambda-list '(m))
(cl:defmethod sat_in_view_num-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:sat_in_view_num-val is deprecated.  Use ros_interface-msg:sat_in_view_num instead.")
  (sat_in_view_num m))

(cl:ensure-generic-function 'solution_status-val :lambda-list '(m))
(cl:defmethod solution_status-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:solution_status-val is deprecated.  Use ros_interface-msg:solution_status instead.")
  (solution_status m))

(cl:ensure-generic-function 'position_type-val :lambda-list '(m))
(cl:defmethod position_type-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:position_type-val is deprecated.  Use ros_interface-msg:position_type instead.")
  (position_type m))

(cl:ensure-generic-function 'linear_velocity-val :lambda-list '(m))
(cl:defmethod linear_velocity-val ((m <Gnss>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear_velocity-val is deprecated.  Use ros_interface-msg:linear_velocity instead.")
  (linear_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gnss>) ostream)
  "Serializes a message object of type '<Gnss>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_valid) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'elevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'utm_position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'attitude) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sd_position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sd_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sd_attitude) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'second))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'sat_use_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sat_in_view_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'solution_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'solution_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'position_type)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gnss>) istream)
  "Deserializes a message object of type '<Gnss>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'is_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevation) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'utm_position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'attitude) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sd_position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sd_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sd_attitude) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'second) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sat_use_num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sat_in_view_num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'solution_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'solution_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'position_type)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gnss>)))
  "Returns string type for a message object of type '<Gnss>"
  "ros_interface/Gnss")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gnss)))
  "Returns string type for a message object of type 'Gnss"
  "ros_interface/Gnss")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gnss>)))
  "Returns md5sum for a message object of type '<Gnss>"
  "24b33ab56e90d13bfcf615123e61b968")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gnss)))
  "Returns md5sum for a message object of type 'Gnss"
  "24b33ab56e90d13bfcf615123e61b968")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gnss>)))
  "Returns full string definition for message of type '<Gnss>"
  (cl:format cl:nil "Header   header     #  ~%bool   is_valid     # # 数据有效性标志位~%float32   latitude     # # 纬度信息~%float32   longitude     # # 经度信息~%float32   elevation     # # 海拔信息~%Point3D   utm_position     # # UTM坐标位置~%Point3D   attitude     # # 三轴姿态~%Point3D   sd_position     # # 位置标准差~%Point3D   sd_velocity     # # 速度标准差~%Point3D   sd_attitude     # # 姿态标准差~%float32   second     # # 时间~%int32   sat_use_num     # # 使用卫星数~%int32   sat_in_view_num     # # 可见卫星数~%uint16   solution_status     # # 求解状态~%uint16   position_type     # # 定位状态~%Point3D   linear_velocity     # # 线速度信息~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gnss)))
  "Returns full string definition for message of type 'Gnss"
  (cl:format cl:nil "Header   header     #  ~%bool   is_valid     # # 数据有效性标志位~%float32   latitude     # # 纬度信息~%float32   longitude     # # 经度信息~%float32   elevation     # # 海拔信息~%Point3D   utm_position     # # UTM坐标位置~%Point3D   attitude     # # 三轴姿态~%Point3D   sd_position     # # 位置标准差~%Point3D   sd_velocity     # # 速度标准差~%Point3D   sd_attitude     # # 姿态标准差~%float32   second     # # 时间~%int32   sat_use_num     # # 使用卫星数~%int32   sat_in_view_num     # # 可见卫星数~%uint16   solution_status     # # 求解状态~%uint16   position_type     # # 定位状态~%Point3D   linear_velocity     # # 线速度信息~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gnss>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'utm_position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'attitude))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sd_position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sd_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sd_attitude))
     4
     4
     4
     2
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gnss>))
  "Converts a ROS message object to a list"
  (cl:list 'Gnss
    (cl:cons ':header (header msg))
    (cl:cons ':is_valid (is_valid msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':elevation (elevation msg))
    (cl:cons ':utm_position (utm_position msg))
    (cl:cons ':attitude (attitude msg))
    (cl:cons ':sd_position (sd_position msg))
    (cl:cons ':sd_velocity (sd_velocity msg))
    (cl:cons ':sd_attitude (sd_attitude msg))
    (cl:cons ':second (second msg))
    (cl:cons ':sat_use_num (sat_use_num msg))
    (cl:cons ':sat_in_view_num (sat_in_view_num msg))
    (cl:cons ':solution_status (solution_status msg))
    (cl:cons ':position_type (position_type msg))
    (cl:cons ':linear_velocity (linear_velocity msg))
))
