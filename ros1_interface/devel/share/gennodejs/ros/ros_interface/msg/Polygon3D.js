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

//-----------------------------------------------------------

class Polygon3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.coordinate_system = null;
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('coordinate_system')) {
        this.coordinate_system = initObj.coordinate_system
      }
      else {
        this.coordinate_system = 0;
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Polygon3D
    // Serialize message field [coordinate_system]
    bufferOffset = _serializer.int32(obj.coordinate_system, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = Point3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Polygon3D
    let len;
    let data = new Polygon3D(null);
    // Deserialize message field [coordinate_system]
    data.coordinate_system = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = Point3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.points.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Polygon3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'badbfc2b6a0c2dc8f8c20c4bfe03c2ab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32   coordinate_system     # 坐标系
    Point3D[] points # 三维点集
    
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
    const resolved = new Polygon3D(null);
    if (msg.coordinate_system !== undefined) {
      resolved.coordinate_system = msg.coordinate_system;
    }
    else {
      resolved.coordinate_system = 0
    }

    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = Point3D.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    return resolved;
    }
};

module.exports = Polygon3D;
