// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vector3 = require('./Vector3.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RobotEnd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.is_heading = null;
      this.endpoint = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('is_heading')) {
        this.is_heading = initObj.is_heading
      }
      else {
        this.is_heading = false;
      }
      if (initObj.hasOwnProperty('endpoint')) {
        this.endpoint = initObj.endpoint
      }
      else {
        this.endpoint = new Vector3();
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotEnd
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [is_heading]
    bufferOffset = _serializer.bool(obj.is_heading, buffer, bufferOffset);
    // Serialize message field [endpoint]
    bufferOffset = Vector3.serialize(obj.endpoint, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotEnd
    let len;
    let data = new RobotEnd(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [is_heading]
    data.is_heading = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [endpoint]
    data.endpoint = Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/RobotEnd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '79738a95184440d887069e7ba5c4e9d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    bool   is_heading     # 是否是寻声导航
    Vector3   endpoint     # 导航终点
    float32   angle     # 寻声导航角度
    
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
    const resolved = new RobotEnd(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.is_heading !== undefined) {
      resolved.is_heading = msg.is_heading;
    }
    else {
      resolved.is_heading = false
    }

    if (msg.endpoint !== undefined) {
      resolved.endpoint = Vector3.Resolve(msg.endpoint)
    }
    else {
      resolved.endpoint = new Vector3()
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = RobotEnd;
