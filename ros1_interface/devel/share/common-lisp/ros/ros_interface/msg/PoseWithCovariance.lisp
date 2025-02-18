; Auto-generated. Do not edit!


(cl:in-package ros_interface-msg)


;//! \htmlinclude PoseWithCovariance.msg.html

(cl:defclass <PoseWithCovariance> (roslisp-msg-protocol:ros-message)
  ((covariance
    :reader covariance
    :initarg :covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass PoseWithCovariance (<PoseWithCovariance>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PoseWithCovariance>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PoseWithCovariance)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interface-msg:<PoseWithCovariance> is deprecated: use ros_interface-msg:PoseWithCovariance instead.")))

(cl:ensure-generic-function 'covariance-val :lambda-list '(m))
(cl:defmethod covariance-val ((m <PoseWithCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interface-msg:covariance-val is deprecated.  Use ros_interface-msg:covariance instead.")
  (covariance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PoseWithCovariance>) ostream)
  "Serializes a message object of type '<PoseWithCovariance>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'covariance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'covariance))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PoseWithCovariance>) istream)
  "Deserializes a message object of type '<PoseWithCovariance>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'covariance) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'covariance)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PoseWithCovariance>)))
  "Returns string type for a message object of type '<PoseWithCovariance>"
  "ros_interface/PoseWithCovariance")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PoseWithCovariance)))
  "Returns string type for a message object of type 'PoseWithCovariance"
  "ros_interface/PoseWithCovariance")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PoseWithCovariance>)))
  "Returns md5sum for a message object of type '<PoseWithCovariance>"
  "e94311bfb2e686d923cb826b25755fa1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PoseWithCovariance)))
  "Returns md5sum for a message object of type 'PoseWithCovariance"
  "e94311bfb2e686d923cb826b25755fa1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PoseWithCovariance>)))
  "Returns full string definition for message of type '<PoseWithCovariance>"
  (cl:format cl:nil "float32[] covariance #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PoseWithCovariance)))
  "Returns full string definition for message of type 'PoseWithCovariance"
  (cl:format cl:nil "float32[] covariance #  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PoseWithCovariance>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PoseWithCovariance>))
  "Converts a ROS message object to a list"
  (cl:list 'PoseWithCovariance
    (cl:cons ':covariance (covariance msg))
))
