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

class EyeCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.action_id = null;
      this.eye_kind = null;
      this.human_name = null;
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
      if (initObj.hasOwnProperty('human_name')) {
        this.human_name = initObj.human_name
      }
      else {
        this.human_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EyeCmd
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [action_id]
    bufferOffset = _serializer.uint64(obj.action_id, buffer, bufferOffset);
    // Serialize message field [eye_kind]
    bufferOffset = _serializer.uint32(obj.eye_kind, buffer, bufferOffset);
    // Serialize message field [human_name]
    bufferOffset = _serializer.string(obj.human_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EyeCmd
    let len;
    let data = new EyeCmd(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [eye_kind]
    data.eye_kind = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [human_name]
    data.human_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.human_name);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'eye_msgs/EyeCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b7afd2407918ee30626ee4948899aad8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    #动作执行id,增加含义：时间+序号
    uint64 action_id
    
    # 人脸录入
    uint32 EYE_FACE_RECORD          = 5
    uint32 EYE_BODY_RECORD          = 6        
    
    # 欢迎模式
    uint32 EYE_WELCOME_DEMO         = 61
    # 回大厅找人
    uint32 EYE_LOBBY_DEMO           = 62
    
    # 任务取消
    uint32 EYE_CANCEL               = 100
    
    # 类型
    uint32 eye_kind
    
    # 人的名字
    string human_name
    
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
    const resolved = new EyeCmd(null);
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

    if (msg.human_name !== undefined) {
      resolved.human_name = msg.human_name;
    }
    else {
      resolved.human_name = ''
    }

    return resolved;
    }
};

// Constants for message
EyeCmd.Constants = {
  EYE_FACE_RECORD: 5,
  EYE_BODY_RECORD: 6,
  EYE_WELCOME_DEMO: 61,
  EYE_LOBBY_DEMO: 62,
  EYE_CANCEL: 100,
}

module.exports = EyeCmd;
