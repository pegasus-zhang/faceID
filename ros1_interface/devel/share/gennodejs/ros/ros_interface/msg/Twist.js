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

//-----------------------------------------------------------

class Twist {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.linear = null;
      this.angular = null;
    }
    else {
      if (initObj.hasOwnProperty('linear')) {
        this.linear = initObj.linear
      }
      else {
        this.linear = new Vector3();
      }
      if (initObj.hasOwnProperty('angular')) {
        this.angular = initObj.angular
      }
      else {
        this.angular = new Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Twist
    // Serialize message field [linear]
    bufferOffset = Vector3.serialize(obj.linear, buffer, bufferOffset);
    // Serialize message field [angular]
    bufferOffset = Vector3.serialize(obj.angular, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Twist
    let len;
    let data = new Twist(null);
    // Deserialize message field [linear]
    data.linear = Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular]
    data.angular = Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Twist';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d107193b261039abb32b01ddb75189b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Vector3   linear     # 线速度（x方向 y方向 z方向）
    Vector3   angular     # 角速度（x方向 y方向 z方向）
    
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
    const resolved = new Twist(null);
    if (msg.linear !== undefined) {
      resolved.linear = Vector3.Resolve(msg.linear)
    }
    else {
      resolved.linear = new Vector3()
    }

    if (msg.angular !== undefined) {
      resolved.angular = Vector3.Resolve(msg.angular)
    }
    else {
      resolved.angular = new Vector3()
    }

    return resolved;
    }
};

module.exports = Twist;
