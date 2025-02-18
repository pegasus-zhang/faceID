; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude FaceList.msg.html

(cl:defclass <FaceList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (face
    :reader face
    :initarg :face
    :type (cl:vector ros_interface-msg:Face)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:Face :initial-element (cl:make-instance 'ros_interface-msg:Face))))
)

(cl:defclass FaceList (<FaceList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<FaceList> is deprecated: use ros_interface-msg:FaceList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FaceList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'face-val :lambda-list '(m))
(cl:defmethod face-val ((m <FaceList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:face-val is deprecated.  Use ros_interface-msg:face instead.")
  (face m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceList>) ostream)
  "Serializes a message object of type '<FaceList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'face))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'face))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceList>) istream)
  "Deserializes a message object of type '<FaceList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'face) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'face)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:Face))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceList>)))
  "Returns string type for a message object of type '<FaceList>"
  "ros_interface/FaceList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceList)))
  "Returns string type for a message object of type 'FaceList"
  "ros_interface/FaceList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceList>)))
  "Returns md5sum for a message object of type '<FaceList>"
  "95adfebc50f00fb22ca152865b53b267")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceList)))
  "Returns md5sum for a message object of type 'FaceList"
  "95adfebc50f00fb22ca152865b53b267")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceList>)))
  "Returns full string definition for message of type '<FaceList>"
  (cl:format cl:nil "Header   header     #  ~%Face[]  face   #感知的所有人体信息~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Face~%Header   header     #  ~%uint32   id     # #面容ID~%string   name     # #面容名称~%int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤~%int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户~%float32   confidence     # #人脸检测置信度~%BBox2D   face_box     # # 人脸图像框~%BBox2D   body_box     # # 人体图像框~%Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置~%sensor_msgs/Image image~%~%================================================================================~%MSG: ros_interface/BBox2D~%int16   xmin     # # 图像框左上角的x坐标~%int16   ymin     # # 图像框左上角的y坐标~%int16   xmax     # # 图像框右下角的x坐标~%int16   ymax     # # 图像框右下角的y坐标~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceList)))
  "Returns full string definition for message of type 'FaceList"
  (cl:format cl:nil "Header   header     #  ~%Face[]  face   #感知的所有人体信息~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Face~%Header   header     #  ~%uint32   id     # #面容ID~%string   name     # #面容名称~%int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤~%int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户~%float32   confidence     # #人脸检测置信度~%BBox2D   face_box     # # 人脸图像框~%BBox2D   body_box     # # 人体图像框~%Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置~%sensor_msgs/Image image~%~%================================================================================~%MSG: ros_interface/BBox2D~%int16   xmin     # # 图像框左上角的x坐标~%int16   ymin     # # 图像框左上角的y坐标~%int16   xmax     # # 图像框右下角的x坐标~%int16   ymax     # # 图像框右下角的y坐标~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'face) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceList>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceList
    (cl:cons ':header (header msg))
    (cl:cons ':face (face msg))
))
