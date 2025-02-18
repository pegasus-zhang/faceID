; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude FusedLocalization.msg.html

(cl:defclass <FusedLocalization> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type ros_interface-msg:PointLLH
    :initform (cl:make-instance 'ros_interface-msg:PointLLH))
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
   (linear_velocity
    :reader linear_velocity
    :initarg :linear_velocity
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (linear_acceleration
    :reader linear_acceleration
    :initarg :linear_acceleration
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (angular_velocity
    :reader angular_velocity
    :initarg :angular_velocity
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (odom_type
    :reader odom_type
    :initarg :odom_type
    :type cl:integer
    :initform 0)
   (location_valid_flag
    :reader location_valid_flag
    :initarg :location_valid_flag
    :type cl:string
    :initform "")
   (origin_lat
    :reader origin_lat
    :initarg :origin_lat
    :type cl:float
    :initform 0.0)
   (origin_lon
    :reader origin_lon
    :initarg :origin_lon
    :type cl:float
    :initform 0.0)
   (utm_position
    :reader utm_position
    :initarg :utm_position
    :type ros_interface-msg:PointENU
    :initform (cl:make-instance 'ros_interface-msg:PointENU))
   (position_std_dev
    :reader position_std_dev
    :initarg :position_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (orientation_std_dev
    :reader orientation_std_dev
    :initarg :orientation_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (linear_velocity_std_dev
    :reader linear_velocity_std_dev
    :initarg :linear_velocity_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (linear_acceleration_std_dev
    :reader linear_acceleration_std_dev
    :initarg :linear_acceleration_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D))
   (angular_velocity_std_dev
    :reader angular_velocity_std_dev
    :initarg :angular_velocity_std_dev
    :type ros_interface-msg:Point3D
    :initform (cl:make-instance 'ros_interface-msg:Point3D)))
)

(cl:defclass FusedLocalization (<FusedLocalization>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FusedLocalization>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FusedLocalization)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<FusedLocalization> is deprecated: use ros_interface-msg:FusedLocalization instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:position-val is deprecated.  Use ros_interface-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:pitch-val is deprecated.  Use ros_interface-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:roll-val is deprecated.  Use ros_interface-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:heading-val is deprecated.  Use ros_interface-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'linear_velocity-val :lambda-list '(m))
(cl:defmethod linear_velocity-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear_velocity-val is deprecated.  Use ros_interface-msg:linear_velocity instead.")
  (linear_velocity m))

(cl:ensure-generic-function 'linear_acceleration-val :lambda-list '(m))
(cl:defmethod linear_acceleration-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear_acceleration-val is deprecated.  Use ros_interface-msg:linear_acceleration instead.")
  (linear_acceleration m))

(cl:ensure-generic-function 'angular_velocity-val :lambda-list '(m))
(cl:defmethod angular_velocity-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:angular_velocity-val is deprecated.  Use ros_interface-msg:angular_velocity instead.")
  (angular_velocity m))

(cl:ensure-generic-function 'odom_type-val :lambda-list '(m))
(cl:defmethod odom_type-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:odom_type-val is deprecated.  Use ros_interface-msg:odom_type instead.")
  (odom_type m))

(cl:ensure-generic-function 'location_valid_flag-val :lambda-list '(m))
(cl:defmethod location_valid_flag-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:location_valid_flag-val is deprecated.  Use ros_interface-msg:location_valid_flag instead.")
  (location_valid_flag m))

(cl:ensure-generic-function 'origin_lat-val :lambda-list '(m))
(cl:defmethod origin_lat-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:origin_lat-val is deprecated.  Use ros_interface-msg:origin_lat instead.")
  (origin_lat m))

(cl:ensure-generic-function 'origin_lon-val :lambda-list '(m))
(cl:defmethod origin_lon-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:origin_lon-val is deprecated.  Use ros_interface-msg:origin_lon instead.")
  (origin_lon m))

(cl:ensure-generic-function 'utm_position-val :lambda-list '(m))
(cl:defmethod utm_position-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:utm_position-val is deprecated.  Use ros_interface-msg:utm_position instead.")
  (utm_position m))

(cl:ensure-generic-function 'position_std_dev-val :lambda-list '(m))
(cl:defmethod position_std_dev-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:position_std_dev-val is deprecated.  Use ros_interface-msg:position_std_dev instead.")
  (position_std_dev m))

(cl:ensure-generic-function 'orientation_std_dev-val :lambda-list '(m))
(cl:defmethod orientation_std_dev-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:orientation_std_dev-val is deprecated.  Use ros_interface-msg:orientation_std_dev instead.")
  (orientation_std_dev m))

(cl:ensure-generic-function 'linear_velocity_std_dev-val :lambda-list '(m))
(cl:defmethod linear_velocity_std_dev-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear_velocity_std_dev-val is deprecated.  Use ros_interface-msg:linear_velocity_std_dev instead.")
  (linear_velocity_std_dev m))

(cl:ensure-generic-function 'linear_acceleration_std_dev-val :lambda-list '(m))
(cl:defmethod linear_acceleration_std_dev-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:linear_acceleration_std_dev-val is deprecated.  Use ros_interface-msg:linear_acceleration_std_dev instead.")
  (linear_acceleration_std_dev m))

(cl:ensure-generic-function 'angular_velocity_std_dev-val :lambda-list '(m))
(cl:defmethod angular_velocity_std_dev-val ((m <FusedLocalization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:angular_velocity_std_dev-val is deprecated.  Use ros_interface-msg:angular_velocity_std_dev instead.")
  (angular_velocity_std_dev m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FusedLocalization>) ostream)
  "Serializes a message object of type '<FusedLocalization>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
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
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_acceleration) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular_velocity) ostream)
  (cl:let* ((signed (cl:slot-value msg 'odom_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'location_valid_flag))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'location_valid_flag))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_lat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_lon))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'utm_position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position_std_dev) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation_std_dev) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_velocity_std_dev) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_acceleration_std_dev) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular_velocity_std_dev) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FusedLocalization>) istream)
  "Deserializes a message object of type '<FusedLocalization>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_acceleration) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular_velocity) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'odom_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'location_valid_flag) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'location_valid_flag) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_lat) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_lon) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'utm_position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position_std_dev) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation_std_dev) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_velocity_std_dev) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_acceleration_std_dev) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular_velocity_std_dev) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FusedLocalization>)))
  "Returns string type for a message object of type '<FusedLocalization>"
  "ros_interface/FusedLocalization")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FusedLocalization)))
  "Returns string type for a message object of type 'FusedLocalization"
  "ros_interface/FusedLocalization")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FusedLocalization>)))
  "Returns md5sum for a message object of type '<FusedLocalization>"
  "bda9fd4dd99802b8fbac3adb5d1dc90b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FusedLocalization)))
  "Returns md5sum for a message object of type 'FusedLocalization"
  "bda9fd4dd99802b8fbac3adb5d1dc90b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FusedLocalization>)))
  "Returns full string definition for message of type '<FusedLocalization>"
  (cl:format cl:nil "Header   header     #  ~%PointLLH   position     # # 经纬度高程~%float32   pitch     # # 姿态角(单位弧度，满足右手定则)~%float32   roll     #  ~%float32   heading     #  ~%Point3D   linear_velocity     # # 线速度（m/s，xxx坐标系）~%Point3D   linear_acceleration     # # 线加速度（m/s2，xxx坐标系）~%Point3D   angular_velocity     # # 角速度（度/s，xxx坐标系，满足右手定则）~%int32   odom_type     # # 融合标志:0-(纯gps) 1-(gps+imu递推) 2-(语义匹配定位) 3-(语义匹配+imu+gps)~%string   location_valid_flag     # # Location有效性标志位0: invalid； 1: valid~%float32   origin_lat     # # 参考点纬度 GCJ-02格式~%float32   origin_lon     # # 参考点经度 GCJ-02格式~%PointENU   utm_position     # # 相对参考点xyz坐标~%Point3D   position_std_dev     # # 位置标准差~%Point3D   orientation_std_dev     # # 方向标准差~%Point3D   linear_velocity_std_dev     # # 速度标准差~%Point3D   linear_acceleration_std_dev     # # 加速度标准差~%Point3D   angular_velocity_std_dev     # # 角速度标准差~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PointLLH~%float32   lon     # # Longitude in degrees, ranging from -180 to 180.~%float32   lat     # # Latitude in degrees, ranging from -90 to 90.~%float32   height     # # WGS-84 ellipsoid height in meters.~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/PointENU~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FusedLocalization)))
  "Returns full string definition for message of type 'FusedLocalization"
  (cl:format cl:nil "Header   header     #  ~%PointLLH   position     # # 经纬度高程~%float32   pitch     # # 姿态角(单位弧度，满足右手定则)~%float32   roll     #  ~%float32   heading     #  ~%Point3D   linear_velocity     # # 线速度（m/s，xxx坐标系）~%Point3D   linear_acceleration     # # 线加速度（m/s2，xxx坐标系）~%Point3D   angular_velocity     # # 角速度（度/s，xxx坐标系，满足右手定则）~%int32   odom_type     # # 融合标志:0-(纯gps) 1-(gps+imu递推) 2-(语义匹配定位) 3-(语义匹配+imu+gps)~%string   location_valid_flag     # # Location有效性标志位0: invalid； 1: valid~%float32   origin_lat     # # 参考点纬度 GCJ-02格式~%float32   origin_lon     # # 参考点经度 GCJ-02格式~%PointENU   utm_position     # # 相对参考点xyz坐标~%Point3D   position_std_dev     # # 位置标准差~%Point3D   orientation_std_dev     # # 方向标准差~%Point3D   linear_velocity_std_dev     # # 速度标准差~%Point3D   linear_acceleration_std_dev     # # 加速度标准差~%Point3D   angular_velocity_std_dev     # # 角速度标准差~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/PointLLH~%float32   lon     # # Longitude in degrees, ranging from -180 to 180.~%float32   lat     # # Latitude in degrees, ranging from -90 to 90.~%float32   height     # # WGS-84 ellipsoid height in meters.~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/PointENU~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FusedLocalization>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_acceleration))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular_velocity))
     4
     4 (cl:length (cl:slot-value msg 'location_valid_flag))
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'utm_position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position_std_dev))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation_std_dev))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_velocity_std_dev))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_acceleration_std_dev))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular_velocity_std_dev))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FusedLocalization>))
  "Converts a ROS message object to a list"
  (cl:list 'FusedLocalization
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':linear_velocity (linear_velocity msg))
    (cl:cons ':linear_acceleration (linear_acceleration msg))
    (cl:cons ':angular_velocity (angular_velocity msg))
    (cl:cons ':odom_type (odom_type msg))
    (cl:cons ':location_valid_flag (location_valid_flag msg))
    (cl:cons ':origin_lat (origin_lat msg))
    (cl:cons ':origin_lon (origin_lon msg))
    (cl:cons ':utm_position (utm_position msg))
    (cl:cons ':position_std_dev (position_std_dev msg))
    (cl:cons ':orientation_std_dev (orientation_std_dev msg))
    (cl:cons ':linear_velocity_std_dev (linear_velocity_std_dev msg))
    (cl:cons ':linear_acceleration_std_dev (linear_acceleration_std_dev msg))
    (cl:cons ':angular_velocity_std_dev (angular_velocity_std_dev msg))
))
