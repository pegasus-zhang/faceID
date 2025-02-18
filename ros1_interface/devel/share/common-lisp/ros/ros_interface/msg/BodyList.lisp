; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude BodyList.msg.html

(cl:defclass <BodyList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (body
    :reader body
    :initarg :body
    :type (cl:vector ros_interface-msg:Body)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:Body :initial-element (cl:make-instance 'ros_interface-msg:Body))))
)

(cl:defclass BodyList (<BodyList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BodyList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BodyList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<BodyList> is deprecated: use ros_interface-msg:BodyList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BodyList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'body-val :lambda-list '(m))
(cl:defmethod body-val ((m <BodyList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:body-val is deprecated.  Use ros_interface-msg:body instead.")
  (body m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BodyList>) ostream)
  "Serializes a message object of type '<BodyList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'body))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'body))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BodyList>) istream)
  "Deserializes a message object of type '<BodyList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'body) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'body)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:Body))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BodyList>)))
  "Returns string type for a message object of type '<BodyList>"
  "ros_interface/BodyList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BodyList)))
  "Returns string type for a message object of type 'BodyList"
  "ros_interface/BodyList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BodyList>)))
  "Returns md5sum for a message object of type '<BodyList>"
  "22fef3e180a31acf726a36da08fe1ec9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BodyList)))
  "Returns md5sum for a message object of type 'BodyList"
  "22fef3e180a31acf726a36da08fe1ec9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BodyList>)))
  "Returns full string definition for message of type '<BodyList>"
  (cl:format cl:nil "Header   header     #  ~%Body[]  body   #感知的所有人体信息~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Body~%Header   header     #  ~%uint32   id     # #人体ID~%int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定用户，TYPE=3//其他用户 ~%int32   sub_type     # #人物子类别，SUB_TYPE=0//未识别，SUB_TYPE=1//成年人，SUB_TYPE=2//儿童，SUB_TYPE=3//老人~%float32   confidence     # #置信度~%int32   posture_type     # #人体姿态类型，POSTURE_TYPE=0//未知姿态，POSTURE_TYPE=1//站，POSTURE_TYPE=2//坐，POSTURE_TYPE=3//躺~%Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置~%float32   theta     # #在世界坐标系下人体的朝向~%float32   length     # #人体长度~%float32   width     # #人体宽度~%float32   height     # #人体高度~%Point3D[] polygon_point_abs # # 世界坐标系下人体3D框点坐标~%Point3D   velocity     # #在世界坐标系下的人体速度~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BodyList)))
  "Returns full string definition for message of type 'BodyList"
  (cl:format cl:nil "Header   header     #  ~%Body[]  body   #感知的所有人体信息~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Body~%Header   header     #  ~%uint32   id     # #人体ID~%int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定用户，TYPE=3//其他用户 ~%int32   sub_type     # #人物子类别，SUB_TYPE=0//未识别，SUB_TYPE=1//成年人，SUB_TYPE=2//儿童，SUB_TYPE=3//老人~%float32   confidence     # #置信度~%int32   posture_type     # #人体姿态类型，POSTURE_TYPE=0//未知姿态，POSTURE_TYPE=1//站，POSTURE_TYPE=2//坐，POSTURE_TYPE=3//躺~%Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置~%float32   theta     # #在世界坐标系下人体的朝向~%float32   length     # #人体长度~%float32   width     # #人体宽度~%float32   height     # #人体高度~%Point3D[] polygon_point_abs # # 世界坐标系下人体3D框点坐标~%Point3D   velocity     # #在世界坐标系下的人体速度~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BodyList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'body) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BodyList>))
  "Converts a ROS message object to a list"
  (cl:list 'BodyList
    (cl:cons ':header (header msg))
    (cl:cons ':body (body msg))
))
