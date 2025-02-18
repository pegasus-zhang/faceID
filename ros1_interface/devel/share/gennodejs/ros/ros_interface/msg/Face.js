// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BBox2D = require('./BBox2D.js');
let Point3D = require('./Point3D.js');
let std_msgs = _finder('std_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class Face {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.name = null;
      this.emotion_type = null;
      this.type = null;
      this.confidence = null;
      this.face_box = null;
      this.body_box = null;
      this.center_point_abs = null;
      this.image = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('emotion_type')) {
        this.emotion_type = initObj.emotion_type
      }
      else {
        this.emotion_type = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
      if (initObj.hasOwnProperty('face_box')) {
        this.face_box = initObj.face_box
      }
      else {
        this.face_box = new BBox2D();
      }
      if (initObj.hasOwnProperty('body_box')) {
        this.body_box = initObj.body_box
      }
      else {
        this.body_box = new BBox2D();
      }
      if (initObj.hasOwnProperty('center_point_abs')) {
        this.center_point_abs = initObj.center_point_abs
      }
      else {
        this.center_point_abs = new Point3D();
      }
      if (initObj.hasOwnProperty('image')) {
        this.image = initObj.image
      }
      else {
        this.image = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Face
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [emotion_type]
    bufferOffset = _serializer.int32(obj.emotion_type, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    // Serialize message field [face_box]
    bufferOffset = BBox2D.serialize(obj.face_box, buffer, bufferOffset);
    // Serialize message field [body_box]
    bufferOffset = BBox2D.serialize(obj.body_box, buffer, bufferOffset);
    // Serialize message field [center_point_abs]
    bufferOffset = Point3D.serialize(obj.center_point_abs, buffer, bufferOffset);
    // Serialize message field [image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.image, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Face
    let len;
    let data = new Face(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [emotion_type]
    data.emotion_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [face_box]
    data.face_box = BBox2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [body_box]
    data.body_box = BBox2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [center_point_abs]
    data.center_point_abs = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [image]
    data.image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.name);
    length += sensor_msgs.msg.Image.getMessageSize(object.image);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Face';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0d64c2d16db71623f9aa8dc2f423d616';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    uint32   id     # #面容ID
    string   name     # #面容名称
    int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤
    int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户
    float32   confidence     # #人脸检测置信度
    BBox2D   face_box     # # 人脸图像框
    BBox2D   body_box     # # 人体图像框
    Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
    sensor_msgs/Image image
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: ros_interface/BBox2D
    int16   xmin     # # 图像框左上角的x坐标
    int16   ymin     # # 图像框左上角的y坐标
    int16   xmax     # # 图像框右下角的x坐标
    int16   ymax     # # 图像框右下角的y坐标
    
    ================================================================================
    MSG: ros_interface/Point3D
    float32   x     #  
    float32   y     #  
    float32   z     #  
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Face(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.emotion_type !== undefined) {
      resolved.emotion_type = msg.emotion_type;
    }
    else {
      resolved.emotion_type = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    if (msg.face_box !== undefined) {
      resolved.face_box = BBox2D.Resolve(msg.face_box)
    }
    else {
      resolved.face_box = new BBox2D()
    }

    if (msg.body_box !== undefined) {
      resolved.body_box = BBox2D.Resolve(msg.body_box)
    }
    else {
      resolved.body_box = new BBox2D()
    }

    if (msg.center_point_abs !== undefined) {
      resolved.center_point_abs = Point3D.Resolve(msg.center_point_abs)
    }
    else {
      resolved.center_point_abs = new Point3D()
    }

    if (msg.image !== undefined) {
      resolved.image = sensor_msgs.msg.Image.Resolve(msg.image)
    }
    else {
      resolved.image = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = Face;
