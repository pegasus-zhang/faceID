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

class OccGrid {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.index_x = null;
      this.index_y = null;
      this.index_z = null;
      this.grid_size_x = null;
      this.grid_size_y = null;
      this.grid_size_z = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('index_x')) {
        this.index_x = initObj.index_x
      }
      else {
        this.index_x = 0;
      }
      if (initObj.hasOwnProperty('index_y')) {
        this.index_y = initObj.index_y
      }
      else {
        this.index_y = 0;
      }
      if (initObj.hasOwnProperty('index_z')) {
        this.index_z = initObj.index_z
      }
      else {
        this.index_z = 0;
      }
      if (initObj.hasOwnProperty('grid_size_x')) {
        this.grid_size_x = initObj.grid_size_x
      }
      else {
        this.grid_size_x = 0.0;
      }
      if (initObj.hasOwnProperty('grid_size_y')) {
        this.grid_size_y = initObj.grid_size_y
      }
      else {
        this.grid_size_y = 0.0;
      }
      if (initObj.hasOwnProperty('grid_size_z')) {
        this.grid_size_z = initObj.grid_size_z
      }
      else {
        this.grid_size_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OccGrid
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [index_x]
    bufferOffset = _serializer.int32(obj.index_x, buffer, bufferOffset);
    // Serialize message field [index_y]
    bufferOffset = _serializer.int32(obj.index_y, buffer, bufferOffset);
    // Serialize message field [index_z]
    bufferOffset = _serializer.int32(obj.index_z, buffer, bufferOffset);
    // Serialize message field [grid_size_x]
    bufferOffset = _serializer.float32(obj.grid_size_x, buffer, bufferOffset);
    // Serialize message field [grid_size_y]
    bufferOffset = _serializer.float32(obj.grid_size_y, buffer, bufferOffset);
    // Serialize message field [grid_size_z]
    bufferOffset = _serializer.float32(obj.grid_size_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OccGrid
    let len;
    let data = new OccGrid(null);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index_x]
    data.index_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index_y]
    data.index_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index_z]
    data.index_z = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [grid_size_x]
    data.grid_size_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [grid_size_y]
    data.grid_size_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [grid_size_z]
    data.grid_size_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/OccGrid';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '44aafbeacd0b2f46dbacbb6fc274af9e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
    int32   index_x     # //网格横向编号
    int32   index_y     # //网格纵向编号
    int32   index_z     # //网格垂直方向编号
    float32   grid_size_x     # //网格横向大小，单位：米
    float32   grid_size_y     # //网格纵向大小，单位：米
    float32   grid_size_z     # //网格垂直方向大小，单位：米
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OccGrid(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.index_x !== undefined) {
      resolved.index_x = msg.index_x;
    }
    else {
      resolved.index_x = 0
    }

    if (msg.index_y !== undefined) {
      resolved.index_y = msg.index_y;
    }
    else {
      resolved.index_y = 0
    }

    if (msg.index_z !== undefined) {
      resolved.index_z = msg.index_z;
    }
    else {
      resolved.index_z = 0
    }

    if (msg.grid_size_x !== undefined) {
      resolved.grid_size_x = msg.grid_size_x;
    }
    else {
      resolved.grid_size_x = 0.0
    }

    if (msg.grid_size_y !== undefined) {
      resolved.grid_size_y = msg.grid_size_y;
    }
    else {
      resolved.grid_size_y = 0.0
    }

    if (msg.grid_size_z !== undefined) {
      resolved.grid_size_z = msg.grid_size_z;
    }
    else {
      resolved.grid_size_z = 0.0
    }

    return resolved;
    }
};

module.exports = OccGrid;
