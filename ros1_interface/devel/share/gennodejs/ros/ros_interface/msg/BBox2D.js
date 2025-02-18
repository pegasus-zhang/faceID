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

class BBox2D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xmin = null;
      this.ymin = null;
      this.xmax = null;
      this.ymax = null;
    }
    else {
      if (initObj.hasOwnProperty('xmin')) {
        this.xmin = initObj.xmin
      }
      else {
        this.xmin = 0;
      }
      if (initObj.hasOwnProperty('ymin')) {
        this.ymin = initObj.ymin
      }
      else {
        this.ymin = 0;
      }
      if (initObj.hasOwnProperty('xmax')) {
        this.xmax = initObj.xmax
      }
      else {
        this.xmax = 0;
      }
      if (initObj.hasOwnProperty('ymax')) {
        this.ymax = initObj.ymax
      }
      else {
        this.ymax = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BBox2D
    // Serialize message field [xmin]
    bufferOffset = _serializer.int16(obj.xmin, buffer, bufferOffset);
    // Serialize message field [ymin]
    bufferOffset = _serializer.int16(obj.ymin, buffer, bufferOffset);
    // Serialize message field [xmax]
    bufferOffset = _serializer.int16(obj.xmax, buffer, bufferOffset);
    // Serialize message field [ymax]
    bufferOffset = _serializer.int16(obj.ymax, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BBox2D
    let len;
    let data = new BBox2D(null);
    // Deserialize message field [xmin]
    data.xmin = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [ymin]
    data.ymin = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xmax]
    data.xmax = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [ymax]
    data.ymax = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/BBox2D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd19258be40eb6712eae30dd94922a828';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16   xmin     # # 图像框左上角的x坐标
    int16   ymin     # # 图像框左上角的y坐标
    int16   xmax     # # 图像框右下角的x坐标
    int16   ymax     # # 图像框右下角的y坐标
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BBox2D(null);
    if (msg.xmin !== undefined) {
      resolved.xmin = msg.xmin;
    }
    else {
      resolved.xmin = 0
    }

    if (msg.ymin !== undefined) {
      resolved.ymin = msg.ymin;
    }
    else {
      resolved.ymin = 0
    }

    if (msg.xmax !== undefined) {
      resolved.xmax = msg.xmax;
    }
    else {
      resolved.xmax = 0
    }

    if (msg.ymax !== undefined) {
      resolved.ymax = msg.ymax;
    }
    else {
      resolved.ymax = 0
    }

    return resolved;
    }
};

module.exports = BBox2D;
