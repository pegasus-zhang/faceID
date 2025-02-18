// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Body = require('./Body.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BodyList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.body = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('body')) {
        this.body = initObj.body
      }
      else {
        this.body = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BodyList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [body]
    // Serialize the length for message field [body]
    bufferOffset = _serializer.uint32(obj.body.length, buffer, bufferOffset);
    obj.body.forEach((val) => {
      bufferOffset = Body.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BodyList
    let len;
    let data = new BodyList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [body]
    // Deserialize array length for message field [body]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.body = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.body[i] = Body.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.body.forEach((val) => {
      length += Body.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/BodyList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22fef3e180a31acf726a36da08fe1ec9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    Body[]  body   #感知的所有人体信息
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
    MSG: ros_interface/Body
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
    const resolved = new BodyList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.body !== undefined) {
      resolved.body = new Array(msg.body.length);
      for (let i = 0; i < resolved.body.length; ++i) {
        resolved.body[i] = Body.Resolve(msg.body[i]);
      }
    }
    else {
      resolved.body = []
    }

    return resolved;
    }
};

module.exports = BodyList;
