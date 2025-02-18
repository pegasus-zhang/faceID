// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RobotTwist = require('./RobotTwist.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RobotPlan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.twists = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('twists')) {
        this.twists = initObj.twists
      }
      else {
        this.twists = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotPlan
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [twists]
    // Serialize the length for message field [twists]
    bufferOffset = _serializer.uint32(obj.twists.length, buffer, bufferOffset);
    obj.twists.forEach((val) => {
      bufferOffset = RobotTwist.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotPlan
    let len;
    let data = new RobotPlan(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [twists]
    // Deserialize array length for message field [twists]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.twists = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.twists[i] = RobotTwist.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.twists.forEach((val) => {
      length += RobotTwist.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/RobotPlan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8b76360f7adf2338a7c5b793baf2bfa4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    RobotTwist[] twists #  
    
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
    MSG: ros_interface/RobotTwist
    Vector3   linear     # 线速度（x方向 y方向 z方向）
    Vector3   angular     # 角速度（x方向 y方向 z方向）
    string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了
    
    ================================================================================
    MSG: ros_interface/Vector3
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
    const resolved = new RobotPlan(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.twists !== undefined) {
      resolved.twists = new Array(msg.twists.length);
      for (let i = 0; i < resolved.twists.length; ++i) {
        resolved.twists[i] = RobotTwist.Resolve(msg.twists[i]);
      }
    }
    else {
      resolved.twists = []
    }

    return resolved;
    }
};

module.exports = RobotPlan;
