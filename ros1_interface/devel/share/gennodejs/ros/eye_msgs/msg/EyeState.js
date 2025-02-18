// Auto-generated. Do not edit!

// (in-package eye_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EyeState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.action_id = null;
      this.eye_kind = null;
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
      if (initObj.hasOwnProperty('eye_kind')) {
        this.eye_kind = initObj.eye_kind
      }
      else {
        this.eye_kind = 0;
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
    // Serializes a message object of type EyeState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [action_id]
    bufferOffset = _serializer.uint64(obj.action_id, buffer, bufferOffset);
    // Serialize message field [eye_kind]
    bufferOffset = _serializer.uint32(obj.eye_kind, buffer, bufferOffset);
    // Serialize message field [exe_state]
    bufferOffset = _serializer.uint8(obj.exe_state, buffer, bufferOffset);
    // Serialize message field [exe_result]
    bufferOffset = _serializer.uint8(obj.exe_result, buffer, bufferOffset);
    // Serialize message field [err_code]
    bufferOffset = _serializer.uint16(obj.err_code, buffer, bufferOffset);
    // Serialize message field [err_info]
    bufferOffset = _serializer.string(obj.err_info, buffer, bufferOffset);
    // Serialize message field [wait_for_millisec]
    bufferOffset = _serializer.uint64(obj.wait_for_millisec, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EyeState
    let len;
    let data = new EyeState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [eye_kind]
    data.eye_kind = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [exe_state]
    data.exe_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [exe_result]
    data.exe_result = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [err_code]
    data.err_code = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [err_info]
    data.err_info = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wait_for_millisec]
    data.wait_for_millisec = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.err_info);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'eye_msgs/EyeState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '41f7fe8eaece5c7faa443d0f00d98c30';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # ActionState
    uint8 ACTION_IDLE = 0
    uint8 ACTION_RUNNING = 1
    uint8 ACTION_DONE = 2
    
    # ActionResult
    uint8 ACTION_NONE = 0
    uint8 ACTION_SUCCESS = 1
    uint8 ACTION_FAIL = 2
    
    # ErrCode
    uint16 ACTION_ERR_NONE = 0
    uint16 ACTION_ERR_NOWORK = 1
    
    # 当前执行的id
    uint64 action_id
    
    # 人脸录入
    uint32 EYE_FACE_RECORD          = 5
    uint32 EYE_BODY_RECORD          = 6 
    # 欢迎模式
    uint32 EYE_WELCOME_DEMO         = 61
    # 回大厅找人
    uint32 EYE_LOBBY_DEMO           = 62
    
    # 任务取消（不需要请求）
    uint32 EYE_CANCEL               = 100
    
    # 类型
    uint32 eye_kind
    # 执行状态：空闲/正在执行/执行完成
    uint8 exe_state
    # 执行结果：无效/成功/失败
    uint8 exe_result
    
    # 错误码
    uint16 err_code
    # 错误消息
    string err_info
    # 剩余执行时间
    uint64 wait_for_millisec
    
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
    const resolved = new EyeState(null);
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

    if (msg.eye_kind !== undefined) {
      resolved.eye_kind = msg.eye_kind;
    }
    else {
      resolved.eye_kind = 0
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

// Constants for message
EyeState.Constants = {
  ACTION_IDLE: 0,
  ACTION_RUNNING: 1,
  ACTION_DONE: 2,
  ACTION_NONE: 0,
  ACTION_SUCCESS: 1,
  ACTION_FAIL: 2,
  ACTION_ERR_NONE: 0,
  ACTION_ERR_NOWORK: 1,
  EYE_FACE_RECORD: 5,
  EYE_BODY_RECORD: 6,
  EYE_WELCOME_DEMO: 61,
  EYE_LOBBY_DEMO: 62,
  EYE_CANCEL: 100,
}

module.exports = EyeState;
