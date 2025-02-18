// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Quaternion {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.qx = null;
      this.qy = null;
      this.qz = null;
      this.qw = null;
    }
    else {
      if (initObj.hasOwnProperty('qx')) {
        this.qx = initObj.qx
      }
      else {
        this.qx = 0.0;
      }
      if (initObj.hasOwnProperty('qy')) {
        this.qy = initObj.qy
      }
      else {
        this.qy = 0.0;
      }
      if (initObj.hasOwnProperty('qz')) {
        this.qz = initObj.qz
      }
      else {
        this.qz = 0.0;
      }
      if (initObj.hasOwnProperty('qw')) {
        this.qw = initObj.qw
      }
      else {
        this.qw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Quaternion
    // Serialize message field [qx]
    bufferOffset = _serializer.float32(obj.qx, buffer, bufferOffset);
    // Serialize message field [qy]
    bufferOffset = _serializer.float32(obj.qy, buffer, bufferOffset);
    // Serialize message field [qz]
    bufferOffset = _serializer.float32(obj.qz, buffer, bufferOffset);
    // Serialize message field [qw]
    bufferOffset = _serializer.float32(obj.qw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Quaternion
    let len;
    let data = new Quaternion(null);
    // Deserialize message field [qx]
    data.qx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [qy]
    data.qy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [qz]
    data.qz = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [qw]
    data.qw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Quaternion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da959fb3fb7383ea37fa4a34b97f97ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32   qx     #  
    float32   qy     #  
    float32   qz     #  
    float32   qw     #  
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Quaternion(null);
    if (msg.qx !== undefined) {
      resolved.qx = msg.qx;
    }
    else {
      resolved.qx = 0.0
    }

    if (msg.qy !== undefined) {
      resolved.qy = msg.qy;
    }
    else {
      resolved.qy = 0.0
    }

    if (msg.qz !== undefined) {
      resolved.qz = msg.qz;
    }
    else {
      resolved.qz = 0.0
    }

    if (msg.qw !== undefined) {
      resolved.qw = msg.qw;
    }
    else {
      resolved.qw = 0.0
    }

    return resolved;
    }
};

module.exports = Quaternion;
