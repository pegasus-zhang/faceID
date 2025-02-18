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

class TwistWithCovariance {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.covariance = null;
    }
    else {
      if (initObj.hasOwnProperty('covariance')) {
        this.covariance = initObj.covariance
      }
      else {
        this.covariance = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TwistWithCovariance
    // Serialize message field [covariance]
    bufferOffset = _arraySerializer.float32(obj.covariance, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TwistWithCovariance
    let len;
    let data = new TwistWithCovariance(null);
    // Deserialize message field [covariance]
    data.covariance = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.covariance.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/TwistWithCovariance';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e94311bfb2e686d923cb826b25755fa1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] covariance #  
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TwistWithCovariance(null);
    if (msg.covariance !== undefined) {
      resolved.covariance = msg.covariance;
    }
    else {
      resolved.covariance = []
    }

    return resolved;
    }
};

module.exports = TwistWithCovariance;
