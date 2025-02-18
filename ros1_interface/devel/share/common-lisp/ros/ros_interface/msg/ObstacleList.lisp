; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude ObstacleList.msg.html

(cl:defclass <ObstacleList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (obstaclelist
    :reader obstaclelist
    :initarg :obstaclelist
    :type (cl:vector ros_interface-msg:Obstacle)
   :initform (cl:make-array 0 :element-type 'ros_interface-msg:Obstacle :initial-element (cl:make-instance 'ros_interface-msg:Obstacle)))
   (free_space
    :reader free_space
    :initarg :free_space
    :type ros_interface-msg:FreeSpace
    :initform (cl:make-instance 'ros_interface-msg:FreeSpace)))
)

(cl:defclass ObstacleList (<ObstacleList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<ObstacleList> is deprecated: use ros_interface-msg:ObstacleList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ObstacleList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:header-val is deprecated.  Use ros_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'obstaclelist-val :lambda-list '(m))
(cl:defmethod obstaclelist-val ((m <ObstacleList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:obstaclelist-val is deprecated.  Use ros_interface-msg:obstaclelist instead.")
  (obstaclelist m))

(cl:ensure-generic-function 'free_space-val :lambda-list '(m))
(cl:defmethod free_space-val ((m <ObstacleList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:free_space-val is deprecated.  Use ros_interface-msg:free_space instead.")
  (free_space m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleList>) ostream)
  "Serializes a message object of type '<ObstacleList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstaclelist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstaclelist))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'free_space) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleList>) istream)
  "Deserializes a message object of type '<ObstacleList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstaclelist) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstaclelist)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_interface-msg:Obstacle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'free_space) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleList>)))
  "Returns string type for a message object of type '<ObstacleList>"
  "ros_interface/ObstacleList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleList)))
  "Returns string type for a message object of type 'ObstacleList"
  "ros_interface/ObstacleList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleList>)))
  "Returns md5sum for a message object of type '<ObstacleList>"
  "05b2fafa6d44e7a83845863b5ebb615f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleList)))
  "Returns md5sum for a message object of type 'ObstacleList"
  "05b2fafa6d44e7a83845863b5ebb615f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleList>)))
  "Returns full string definition for message of type '<ObstacleList>"
  (cl:format cl:nil "Header   header     #  ~%Obstacle[] obstaclelist # #感知识别出的所有物体信息~%FreeSpace   free_space     # #可行使区域~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Obstacle~%Header   header     #  ~%uint8   id     # #物体ID~%int32   type     # #物体类型，TYPE=0//未知物体，TYPE=1//门，TYPE=2//窗户，TYPE=3//冰箱，TYPE=4//电视，TYPE=5//风扇，TYPE=6//衣柜，TYPE=7//床，TYPE=8//沙发，TYPE=9//桌子，TYPE=10//椅子，TYPE=11//楼梯，TYPE=12//台阶，TYPE=13//斜坡，TYPE=14//坑洼，TYPE=15//人~%float32   confidence     # #置信度~%Point3D   center_point_abs     # #在世界坐标系下的物体中心位置~%float32   theta     # #在世界坐标系下物体的朝向~%Point3D   velocity     # #在世界坐标系下的物体的速度~%float32   length     # #物体外接立体的长度~%float32   width     # #物体外接立体的宽度~%float32   height     # #物体外接立体的高度~%OccGrid[] occupy_grid # # 世界坐标系下物体占据的网格~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/OccGrid~%int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%int32   index_x     # //网格横向编号~%int32   index_y     # //网格纵向编号~%int32   index_z     # //网格垂直方向编号~%float32   grid_size_x     # //网格横向大小，单位：米~%float32   grid_size_y     # //网格纵向大小，单位：米~%float32   grid_size_z     # //网格垂直方向大小，单位：米~%~%================================================================================~%MSG: ros_interface/FreeSpace~%Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%OccGrid[] freegrids # //网格横向编号~%#Polygon3D[] freegrids~%Point3D[] freespace_region # //网格大小，单位：米~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleList)))
  "Returns full string definition for message of type 'ObstacleList"
  (cl:format cl:nil "Header   header     #  ~%Obstacle[] obstaclelist # #感知识别出的所有物体信息~%FreeSpace   free_space     # #可行使区域~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ros_interface/Obstacle~%Header   header     #  ~%uint8   id     # #物体ID~%int32   type     # #物体类型，TYPE=0//未知物体，TYPE=1//门，TYPE=2//窗户，TYPE=3//冰箱，TYPE=4//电视，TYPE=5//风扇，TYPE=6//衣柜，TYPE=7//床，TYPE=8//沙发，TYPE=9//桌子，TYPE=10//椅子，TYPE=11//楼梯，TYPE=12//台阶，TYPE=13//斜坡，TYPE=14//坑洼，TYPE=15//人~%float32   confidence     # #置信度~%Point3D   center_point_abs     # #在世界坐标系下的物体中心位置~%float32   theta     # #在世界坐标系下物体的朝向~%Point3D   velocity     # #在世界坐标系下的物体的速度~%float32   length     # #物体外接立体的长度~%float32   width     # #物体外接立体的宽度~%float32   height     # #物体外接立体的高度~%OccGrid[] occupy_grid # # 世界坐标系下物体占据的网格~%~%================================================================================~%MSG: ros_interface/Point3D~%float32   x     #  ~%float32   y     #  ~%float32   z     #  ~%~%================================================================================~%MSG: ros_interface/OccGrid~%int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%int32   index_x     # //网格横向编号~%int32   index_y     # //网格纵向编号~%int32   index_z     # //网格垂直方向编号~%float32   grid_size_x     # //网格横向大小，单位：米~%float32   grid_size_y     # //网格纵向大小，单位：米~%float32   grid_size_z     # //网格垂直方向大小，单位：米~%~%================================================================================~%MSG: ros_interface/FreeSpace~%Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶~%OccGrid[] freegrids # //网格横向编号~%#Polygon3D[] freegrids~%Point3D[] freespace_region # //网格大小，单位：米~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstaclelist) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'free_space))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleList>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleList
    (cl:cons ':header (header msg))
    (cl:cons ':obstaclelist (obstaclelist msg))
    (cl:cons ':free_space (free_space msg))
))
