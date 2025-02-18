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

class ComplexCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type_id = null;
      this.unit_id = null;
      this.data_a = null;
      this.data_b = null;
    }
    else {
      if (initObj.hasOwnProperty('type_id')) {
        this.type_id = initObj.type_id
      }
      else {
        this.type_id = 0;
      }
      if (initObj.hasOwnProperty('unit_id')) {
        this.unit_id = initObj.unit_id
      }
      else {
        this.unit_id = 0;
      }
      if (initObj.hasOwnProperty('data_a')) {
        this.data_a = initObj.data_a
      }
      else {
        this.data_a = 0.0;
      }
      if (initObj.hasOwnProperty('data_b')) {
        this.data_b = initObj.data_b
      }
      else {
        this.data_b = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ComplexCommand
    // Serialize message field [type_id]
    bufferOffset = _serializer.uint8(obj.type_id, buffer, bufferOffset);
    // Serialize message field [unit_id]
    bufferOffset = _serializer.uint8(obj.unit_id, buffer, bufferOffset);
    // Serialize message field [data_a]
    bufferOffset = _serializer.float32(obj.data_a, buffer, bufferOffset);
    // Serialize message field [data_b]
    bufferOffset = _serializer.float32(obj.data_b, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ComplexCommand
    let len;
    let data = new ComplexCommand(null);
    // Deserialize message field [type_id]
    data.type_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [unit_id]
    data.unit_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [data_a]
    data.data_a = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [data_b]
    data.data_b = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/ComplexCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '06403e95fe785afd6352f59c7b849afb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   type_id     #  
    uint8   unit_id     #  
    float32   data_a     #  
    float32   data_b     #  
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ComplexCommand(null);
    if (msg.type_id !== undefined) {
      resolved.type_id = msg.type_id;
    }
    else {
      resolved.type_id = 0
    }

    if (msg.unit_id !== undefined) {
      resolved.unit_id = msg.unit_id;
    }
    else {
      resolved.unit_id = 0
    }

    if (msg.data_a !== undefined) {
      resolved.data_a = msg.data_a;
    }
    else {
      resolved.data_a = 0.0
    }

    if (msg.data_b !== undefined) {
      resolved.data_b = msg.data_b;
    }
    else {
      resolved.data_b = 0.0
    }

    return resolved;
    }
};

module.exports = ComplexCommand;
