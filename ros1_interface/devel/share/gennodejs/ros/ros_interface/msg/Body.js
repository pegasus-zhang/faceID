// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point3D = require('./Point3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Body {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.type = null;
      this.sub_type = null;
      this.confidence = null;
      this.posture_type = null;
      this.center_point_abs = null;
      this.theta = null;
      this.length = null;
      this.width = null;
      this.height = null;
      this.polygon_point_abs = null;
      this.velocity = null;
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
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('sub_type')) {
        this.sub_type = initObj.sub_type
      }
      else {
        this.sub_type = 0;
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
      if (initObj.hasOwnProperty('posture_type')) {
        this.posture_type = initObj.posture_type
      }
      else {
        this.posture_type = 0;
      }
      if (initObj.hasOwnProperty('center_point_abs')) {
        this.center_point_abs = initObj.center_point_abs
      }
      else {
        this.center_point_abs = new Point3D();
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0.0;
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('polygon_point_abs')) {
        this.polygon_point_abs = initObj.polygon_point_abs
      }
      else {
        this.polygon_point_abs = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new Point3D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Body
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [sub_type]
    bufferOffset = _serializer.int32(obj.sub_type, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    // Serialize message field [posture_type]
    bufferOffset = _serializer.int32(obj.posture_type, buffer, bufferOffset);
    // Serialize message field [center_point_abs]
    bufferOffset = Point3D.serialize(obj.center_point_abs, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.float32(obj.theta, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [polygon_point_abs]
    // Serialize the length for message field [polygon_point_abs]
    bufferOffset = _serializer.uint32(obj.polygon_point_abs.length, buffer, bufferOffset);
    obj.polygon_point_abs.forEach((val) => {
      bufferOffset = Point3D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [velocity]
    bufferOffset = Point3D.serialize(obj.velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Body
    let len;
    let data = new Body(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sub_type]
    data.sub_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [posture_type]
    data.posture_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [center_point_abs]
    data.center_point_abs = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [polygon_point_abs]
    // Deserialize array length for message field [polygon_point_abs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.polygon_point_abs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.polygon_point_abs[i] = Point3D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [velocity]
    data.velocity = Point3D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 12 * object.polygon_point_abs.length;
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Body';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3816a053eac0ba3ff3d35c3b3a7032d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    uint32   id     # #人体ID
    int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定用户，TYPE=3//其他用户 
    int32   sub_type     # #人物子类别，SUB_TYPE=0//未识别，SUB_TYPE=1//成年人，SUB_TYPE=2//儿童，SUB_TYPE=3//老人
    float32   confidence     # #置信度
    int32   posture_type     # #人体姿态类型，POSTURE_TYPE=0//未知姿态，POSTURE_TYPE=1//站，POSTURE_TYPE=2//坐，POSTURE_TYPE=3//躺
    Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
    float32   theta     # #在世界坐标系下人体的朝向
    float32   length     # #人体长度
    float32   width     # #人体宽度
    float32   height     # #人体高度
    Point3D[] polygon_point_abs # # 世界坐标系下人体3D框点坐标
    Point3D   velocity     # #在世界坐标系下的人体速度
    
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
    MSG: ros_interface/Point3D
    float32   x     #  
    float32   y     #  
    float32   z     #  
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Body(null);
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

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.sub_type !== undefined) {
      resolved.sub_type = msg.sub_type;
    }
    else {
      resolved.sub_type = 0
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    if (msg.posture_type !== undefined) {
      resolved.posture_type = msg.posture_type;
    }
    else {
      resolved.posture_type = 0
    }

    if (msg.center_point_abs !== undefined) {
      resolved.center_point_abs = Point3D.Resolve(msg.center_point_abs)
    }
    else {
      resolved.center_point_abs = new Point3D()
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0.0
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.polygon_point_abs !== undefined) {
      resolved.polygon_point_abs = new Array(msg.polygon_point_abs.length);
      for (let i = 0; i < resolved.polygon_point_abs.length; ++i) {
        resolved.polygon_point_abs[i] = Point3D.Resolve(msg.polygon_point_abs[i]);
      }
    }
    else {
      resolved.polygon_point_abs = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = Point3D.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new Point3D()
    }

    return resolved;
    }
};

module.exports = Body;
