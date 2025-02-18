// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point = require('./Point.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PercCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.action_id = null;
      this.perc_kind = null;
      this.req_id = null;
      this.angle = null;
      this.point_name = null;
      this.point = null;
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
      if (initObj.hasOwnProperty('perc_kind')) {
        this.perc_kind = initObj.perc_kind
      }
      else {
        this.perc_kind = 0;
      }
      if (initObj.hasOwnProperty('req_id')) {
        this.req_id = initObj.req_id
      }
      else {
        this.req_id = 0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('point_name')) {
        this.point_name = initObj.point_name
      }
      else {
        this.point_name = '';
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = new Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PercCmd
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [action_id]
    bufferOffset = _serializer.uint64(obj.action_id, buffer, bufferOffset);
    // Serialize message field [perc_kind]
    bufferOffset = _serializer.int32(obj.perc_kind, buffer, bufferOffset);
    // Serialize message field [req_id]
    bufferOffset = _serializer.uint64(obj.req_id, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    // Serialize message field [point_name]
    bufferOffset = _serializer.string(obj.point_name, buffer, bufferOffset);
    // Serialize message field [point]
    bufferOffset = Point.serialize(obj.point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PercCmd
    let len;
    let data = new PercCmd(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [perc_kind]
    data.perc_kind = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [req_id]
    data.req_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [point_name]
    data.point_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [point]
    data.point = Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.point_name);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/PercCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ee16e7d49b47f91bbd34c18cdee9485';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    uint64   action_id     # #动作执行id
    int32   perc_kind     # # Perception Kind 枚举类型 uint32 PERC_DEST   = 1   #点到点 uint32 PERC_ABS    = 2   #绝对位置 uint32 PERC_REL    = 3    #相对位置 uint32 PERC_AUTO_CHARGING   = 20  # 自动充电 uint32 PERC_CHECK_ENV       = 21  # 环境查看 uint32 PERC_AUTO_MAPPING    = 22  # 自动建图 uint32 PERC_FOLLOW               = 30  # 跟随模式 uint32 PERC_STRANGER_WELCOME     = 31  # 陌生人迎接 uint32 PERC_OWNER_WELCOME        = 32  # 主人迎接 uint32 PERC_BEHAVIOR_INTERACTION = 33  # 行为互动 uint32 PERC_HANDSHAKE            = 34   # 握手动作 uint32 PERC_STANDBY_ACCOMPANY    = 35  # 待机陪伴 uint32 PERC_HAPPY_ACCOMPANY      = 36  # 娱乐陪伴 uint32 PERC_WORK_ACCOMPANY       = 37  # 工作陪伴 uint32 PERC_POSITIVE_ACCOMPANY   = 38  # 积极陪伴 uint32 PERC_NEGATIVE_ACCOMPANY   = 39  # 消极陪伴 uint32 PERC_CHILD_WATCH          = 40  # 小孩看护 uint32 PERC_OLDER_WATCH          = 41  # 老人看护 uint32 PERC_DANGER_REMINDER      = 42   # 危险提醒 uint32 PERC_EVENT_REMINDER       = 43  # 事件提醒 uint32 PERC_CATWALK_START        = 44  # 开始走秀 uint32 PERC_CATWALK_ACT          = 45  # 走秀互动 uint32 PERC_CATWALK_SHOW         = 46  # 走秀展示 uint32 PERC_CATWALK_BACK         = 47  # 走秀返回 uint32 PERC_FREE_TIME   = 50  # 自由活动 uint32 PERC_SOCIALIZE   = 51  # 社交模式 uint32 PERC_DANGER_INFO = 60  # 上报危险信息（不需要请求） uint32 PERC_CANCEL      = 100  # 任务取消（不需要请求） uint32 PERC_NODE_CLOSE = 200  #关闭指令 uint32 PERC_NODE_START = 201  #启动指令 uint32 PERC_NODE_RESET = 202  #重启指令
    uint64   req_id     # #发送请求的id，可以先不用管，调试使用
    float32   angle     # # 语音的角度
    string   point_name     # # 字符串表示某个位置（语义位置）
    Point   point     # geometry_msgs/Point point  # Point表示某个位置
    
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
    MSG: ros_interface/Point
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
    const resolved = new PercCmd(null);
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

    if (msg.perc_kind !== undefined) {
      resolved.perc_kind = msg.perc_kind;
    }
    else {
      resolved.perc_kind = 0
    }

    if (msg.req_id !== undefined) {
      resolved.req_id = msg.req_id;
    }
    else {
      resolved.req_id = 0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.point_name !== undefined) {
      resolved.point_name = msg.point_name;
    }
    else {
      resolved.point_name = ''
    }

    if (msg.point !== undefined) {
      resolved.point = Point.Resolve(msg.point)
    }
    else {
      resolved.point = new Point()
    }

    return resolved;
    }
};

module.exports = PercCmd;
