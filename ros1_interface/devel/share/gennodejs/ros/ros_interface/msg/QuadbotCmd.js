// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Twist = require('./Twist.js');
let ComplexCommand = require('./ComplexCommand.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class QuadbotCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.action_id = null;
      this.quadbot_kind = null;
      this.action_name = null;
      this.twist = null;
      this.complex_cmd = null;
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
      if (initObj.hasOwnProperty('quadbot_kind')) {
        this.quadbot_kind = initObj.quadbot_kind
      }
      else {
        this.quadbot_kind = 0;
      }
      if (initObj.hasOwnProperty('action_name')) {
        this.action_name = initObj.action_name
      }
      else {
        this.action_name = '';
      }
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = new Twist();
      }
      if (initObj.hasOwnProperty('complex_cmd')) {
        this.complex_cmd = initObj.complex_cmd
      }
      else {
        this.complex_cmd = new ComplexCommand();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QuadbotCmd
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [action_id]
    bufferOffset = _serializer.uint64(obj.action_id, buffer, bufferOffset);
    // Serialize message field [quadbot_kind]
    bufferOffset = _serializer.int32(obj.quadbot_kind, buffer, bufferOffset);
    // Serialize message field [action_name]
    bufferOffset = _serializer.string(obj.action_name, buffer, bufferOffset);
    // Serialize message field [twist]
    bufferOffset = Twist.serialize(obj.twist, buffer, bufferOffset);
    // Serialize message field [complex_cmd]
    bufferOffset = ComplexCommand.serialize(obj.complex_cmd, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QuadbotCmd
    let len;
    let data = new QuadbotCmd(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [quadbot_kind]
    data.quadbot_kind = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [action_name]
    data.action_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [twist]
    data.twist = Twist.deserialize(buffer, bufferOffset);
    // Deserialize message field [complex_cmd]
    data.complex_cmd = ComplexCommand.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.action_name);
    return length + 50;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/QuadbotCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b913b00e78766226918c3d24c7939f9a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    uint64   action_id     # #动作执行id
    int32   quadbot_kind     # #简单指令（坐下...）；复杂指令（走直线/走圆弧）
    string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了
    Twist   twist     #  
    ComplexCommand   complex_cmd     # #规划端不使用这个指令
    
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
    
    ================================================================================
    MSG: ros_interface/Twist
    Vector3   linear     # 线速度（x方向 y方向 z方向）
    Vector3   angular     # 角速度（x方向 y方向 z方向）
    
    ================================================================================
    MSG: ros_interface/Vector3
    float32   x     #  
    float32   y     #  
    float32   z     #  
    
    ================================================================================
    MSG: ros_interface/ComplexCommand
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
    const resolved = new QuadbotCmd(null);
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

    if (msg.quadbot_kind !== undefined) {
      resolved.quadbot_kind = msg.quadbot_kind;
    }
    else {
      resolved.quadbot_kind = 0
    }

    if (msg.action_name !== undefined) {
      resolved.action_name = msg.action_name;
    }
    else {
      resolved.action_name = ''
    }

    if (msg.twist !== undefined) {
      resolved.twist = Twist.Resolve(msg.twist)
    }
    else {
      resolved.twist = new Twist()
    }

    if (msg.complex_cmd !== undefined) {
      resolved.complex_cmd = ComplexCommand.Resolve(msg.complex_cmd)
    }
    else {
      resolved.complex_cmd = new ComplexCommand()
    }

    return resolved;
    }
};

module.exports = QuadbotCmd;
