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

class PointLLH {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lon = null;
      this.lat = null;
      this.height = null;
    }
    else {
      if (initObj.hasOwnProperty('lon')) {
        this.lon = initObj.lon
      }
      else {
        this.lon = 0.0;
      }
      if (initObj.hasOwnProperty('lat')) {
        this.lat = initObj.lat
      }
      else {
        this.lat = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointLLH
    // Serialize message field [lon]
    bufferOffset = _serializer.float32(obj.lon, buffer, bufferOffset);
    // Serialize message field [lat]
    bufferOffset = _serializer.float32(obj.lat, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointLLH
    let len;
    let data = new PointLLH(null);
    // Deserialize message field [lon]
    data.lon = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lat]
    data.lat = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/PointLLH';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c3958392cb26a0a2103a249fb404dc1d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32   lon     # # Longitude in degrees, ranging from -180 to 180.
    float32   lat     # # Latitude in degrees, ranging from -90 to 90.
    float32   height     # # WGS-84 ellipsoid height in meters.
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PointLLH(null);
    if (msg.lon !== undefined) {
      resolved.lon = msg.lon;
    }
    else {
      resolved.lon = 0.0
    }

    if (msg.lat !== undefined) {
      resolved.lat = msg.lat;
    }
    else {
      resolved.lat = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    return resolved;
    }
};

module.exports = PointLLH;
