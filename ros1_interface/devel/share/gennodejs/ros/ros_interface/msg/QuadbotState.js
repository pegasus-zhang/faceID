// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class QuadbotState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.action_id = null;
      this.action_name = null;
      this.action_state = null;
      this.action_result = null;
      this.exe_name = null;
      this.exe_state = null;
      this.exe_result = null;
      this.err_code = null;
      this.err_info = null;
      this.wait_for_millisec = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('action_id')) {
        this.action_id = initObj.action_id
      }
      else {
        this.action_id = 0;
      }
      if (initObj.hasOwnProperty('action_name')) {
        this.action_name = initObj.action_name
      }
      else {
        this.action_name = '';
      }
      if (initObj.hasOwnProperty('action_state')) {
        this.action_state = initObj.action_state
      }
      else {
        this.action_state = 0;
      }
      if (initObj.hasOwnProperty('action_result')) {
        this.action_result = initObj.action_result
      }
      else {
        this.action_result = 0;
      }
      if (initObj.hasOwnProperty('exe_name')) {
        this.exe_name = initObj.exe_name
      }
      else {
        this.exe_name = '';
      }
      if (initObj.hasOwnProperty('exe_state')) {
        this.exe_state = initObj.exe_state
      }
      else {
        this.exe_state = 0;
      }
      if (initObj.hasOwnProperty('exe_result')) {
        this.exe_result = initObj.exe_result
      }
      else {
        this.exe_result = 0;
      }
      if (initObj.hasOwnProperty('err_code')) {
        this.err_code = initObj.err_code
      }
      else {
        this.err_code = 0;
      }
      if (initObj.hasOwnProperty('err_info')) {
        this.err_info = initObj.err_info
      }
      else {
        this.err_info = '';
      }
      if (initObj.hasOwnProperty('wait_for_millisec')) {
        this.wait_for_millisec = initObj.wait_for_millisec
      }
      else {
        this.wait_for_millisec = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QuadbotState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [action_id]
    bufferOffset = _serializer.uint64(obj.action_id, buffer, bufferOffset);
    // Serialize message field [action_name]
    bufferOffset = _serializer.string(obj.action_name, buffer, bufferOffset);
    // Serialize message field [action_state]
    bufferOffset = _serializer.int32(obj.action_state, buffer, bufferOffset);
    // Serialize message field [action_result]
    bufferOffset = _serializer.int32(obj.action_result, buffer, bufferOffset);
    // Serialize message field [exe_name]
    bufferOffset = _serializer.string(obj.exe_name, buffer, bufferOffset);
    // Serialize message field [exe_state]
    bufferOffset = _serializer.int32(obj.exe_state, buffer, bufferOffset);
    // Serialize message field [exe_result]
    bufferOffset = _serializer.int32(obj.exe_result, buffer, bufferOffset);
    // Serialize message field [err_code]
    bufferOffset = _serializer.int32(obj.err_code, buffer, bufferOffset);
    // Serialize message field [err_info]
    bufferOffset = _serializer.string(obj.err_info, buffer, bufferOffset);
    // Serialize message field [wait_for_millisec]
    bufferOffset = _serializer.uint64(obj.wait_for_millisec, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QuadbotState
    let len;
    let data = new QuadbotState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [action_name]
    data.action_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [action_state]
    data.action_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [action_result]
    data.action_result = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [exe_name]
    data.exe_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [exe_state]
    data.exe_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [exe_result]
    data.exe_result = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [err_code]
    data.err_code = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [err_info]
    data.err_info = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wait_for_millisec]
    data.wait_for_millisec = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.action_name);
    length += _getByteLength(object.exe_name);
    length += _getByteLength(object.err_info);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/QuadbotState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '62874a497f75be8fb0d09338630a9af5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    uint64   action_id     # #动作执行id
    string   action_name     #  
    int32   action_state     #  
    int32   action_result     #  
    string   exe_name     #  
    int32   exe_state     #  
    int32   exe_result     #  
    int32   err_code     #  
    string   err_info     #  
    uint64   wait_for_millisec     #  
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new QuadbotState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.action_id !== undefined) {
      resolved.action_id = msg.action_id;
    }
    else {
      resolved.action_id = 0
    }

    if (msg.action_name !== undefined) {
      resolved.action_name = msg.action_name;
    }
    else {
      resolved.action_name = ''
    }

    if (msg.action_state !== undefined) {
      resolved.action_state = msg.action_state;
    }
    else {
      resolved.action_state = 0
    }

    if (msg.action_result !== undefined) {
      resolved.action_result = msg.action_result;
    }
    else {
      resolved.action_result = 0
    }

    if (msg.exe_name !== undefined) {
      resolved.exe_name = msg.exe_name;
    }
    else {
      resolved.exe_name = ''
    }

    if (msg.exe_state !== undefined) {
      resolved.exe_state = msg.exe_state;
    }
    else {
      resolved.exe_state = 0
    }

    if (msg.exe_result !== undefined) {
      resolved.exe_result = msg.exe_result;
    }
    else {
      resolved.exe_result = 0
    }

    if (msg.err_code !== undefined) {
      resolved.err_code = msg.err_code;
    }
    else {
      resolved.err_code = 0
    }

    if (msg.err_info !== undefined) {
      resolved.err_info = msg.err_info;
    }
    else {
      resolved.err_info = ''
    }

    if (msg.wait_for_millisec !== undefined) {
      resolved.wait_for_millisec = msg.wait_for_millisec;
    }
    else {
      resolved.wait_for_millisec = 0
    }

    return resolved;
    }
};

module.exports = QuadbotState;
