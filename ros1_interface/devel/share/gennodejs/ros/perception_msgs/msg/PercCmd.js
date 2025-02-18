// Auto-generated. Do not edit!

// (in-package perception_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class PercCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.action_id = null;
      this.perc_kind = null;
      this.req_id = null;
      this.on_off = null;
      this.follow_name = null;
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
      if (initObj.hasOwnProperty('on_off')) {
        this.on_off = initObj.on_off
      }
      else {
        this.on_off = 0;
      }
      if (initObj.hasOwnProperty('follow_name')) {
        this.follow_name = initObj.follow_name
      }
      else {
        this.follow_name = '';
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
        this.point = new geometry_msgs.msg.Point();
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
    bufferOffset = _serializer.uint32(obj.perc_kind, buffer, bufferOffset);
    // Serialize message field [req_id]
    bufferOffset = _serializer.uint64(obj.req_id, buffer, bufferOffset);
    // Serialize message field [on_off]
    bufferOffset = _serializer.uint32(obj.on_off, buffer, bufferOffset);
    // Serialize message field [follow_name]
    bufferOffset = _serializer.string(obj.follow_name, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    // Serialize message field [point_name]
    bufferOffset = _serializer.string(obj.point_name, buffer, bufferOffset);
    // Serialize message field [point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.point, buffer, bufferOffset);
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
    data.perc_kind = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [req_id]
    data.req_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [on_off]
    data.on_off = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [follow_name]
    data.follow_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [point_name]
    data.point_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [point]
    data.point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.follow_name);
    length += _getByteLength(object.point_name);
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'perception_msgs/PercCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08540cb1d7896a929933b0fa32473d34';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    #动作执行id,增加含义：时间+序号
    uint64 action_id
    
    # Perceive Kind
    uint32 PERC_DEST                 = 1
    uint32 PERC_ABS                  = 2
    uint32 PERC_REL                  = 3
    
    # 自动充电
    uint32 PERC_AUTO_CHARGING        = 20
    # 环境查看
    uint32 PERC_CHECK_ENV            = 21
    # 自动建图
    uint32 PERC_AUTO_MAPPING         = 22
    
    # 跟随模式
    uint32 PERC_FOLLOW               = 30
    # 陌生人迎接
    uint32 PERC_STRANGER_WELCOME     = 31
    # 主人迎接
    uint32 PERC_OWNER_WELCOME        = 32
    # 行为互动
    uint32 PERC_BEHAVIOR_INTERACTION = 33
    # 握手动作
    uint32 PERC_HANDSHAKE            = 34
    
    # 待机陪伴
    uint32 PERC_STANDBY_ACCOMPANY    = 35
    # 娱乐陪伴
    uint32 PERC_HAPPY_ACCOMPANY      = 36
    # 工作陪伴
    uint32 PERC_WORK_ACCOMPANY       = 37
    # 积极陪伴
    uint32 PERC_POSITIVE_ACCOMPANY   = 38
    # 消极陪伴
    uint32 PERC_NEGATIVE_ACCOMPANY   = 39
    
    # 小孩看护
    uint32 PERC_CHILD_WATCH          = 40
    # 老人看护
    uint32 PERC_OLDER_WATCH          = 41
    # 危险提醒
    uint32 PERC_DANGER_REMINDER      = 42
    # 事件提醒
    uint32 PERC_EVENT_REMINDER       = 43
    # 开始走秀（语言下方，不需要感知）
    uint32 PERC_CATWALK_START        = 44
    # 走秀互动
    uint32 PERC_CATWALK_ACT          = 45
    # 走秀展示
    uint32 PERC_CATWALK_SHOW         = 46
    # 走秀返回
    uint32 PERC_CATWALK_BACK         = 47
    
    # 自由活动
    uint32 PERC_FREE_TIME            = 50
    # 社交模式
    uint32 PERC_SOCIALIZE            = 51
    # 围观场景
    uint32 PERC_SPECT_PERFORM        = 55
    # 表情分析
    uint32 PERC_FACE_DETCTION        = 56
    
    
    # 上报危险信息（不需要请求）
    uint32 PERC_DANGER_INFO          = 60
    # 欢迎模式
    uint32 PERC_WELCOME_DEMO         = 61
    # 回大厅找人
    uint32 PERC_LOBBY_DEMO           = 62
    
    # 任务取消（不需要请求）
    uint32 PERC_CANCEL               = 100
    
    uint32 PERC_NODE_CLOSE           = 200
    uint32 PERC_NODE_START           = 201
    uint32 PERC_NODE_RESET           = 202
    
    # 感知命令类型
    uint32 perc_kind
    uint64 req_id
    
    # 跟随开关
    uint32 FOLLOW_ON  = 1
    uint32 FOLLOW_OFF = 2
    uint32 on_off
    string follow_name
    
    # 目标角度
    float64 angle
    
    # 字符串表示某个位置
    string point_name
    
    # Point表示某个位置
    geometry_msgs/Point point
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
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
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

    if (msg.on_off !== undefined) {
      resolved.on_off = msg.on_off;
    }
    else {
      resolved.on_off = 0
    }

    if (msg.follow_name !== undefined) {
      resolved.follow_name = msg.follow_name;
    }
    else {
      resolved.follow_name = ''
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
      resolved.point = geometry_msgs.msg.Point.Resolve(msg.point)
    }
    else {
      resolved.point = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

// Constants for message
PercCmd.Constants = {
  PERC_DEST: 1,
  PERC_ABS: 2,
  PERC_REL: 3,
  PERC_AUTO_CHARGING: 20,
  PERC_CHECK_ENV: 21,
  PERC_AUTO_MAPPING: 22,
  PERC_FOLLOW: 30,
  PERC_STRANGER_WELCOME: 31,
  PERC_OWNER_WELCOME: 32,
  PERC_BEHAVIOR_INTERACTION: 33,
  PERC_HANDSHAKE: 34,
  PERC_STANDBY_ACCOMPANY: 35,
  PERC_HAPPY_ACCOMPANY: 36,
  PERC_WORK_ACCOMPANY: 37,
  PERC_POSITIVE_ACCOMPANY: 38,
  PERC_NEGATIVE_ACCOMPANY: 39,
  PERC_CHILD_WATCH: 40,
  PERC_OLDER_WATCH: 41,
  PERC_DANGER_REMINDER: 42,
  PERC_EVENT_REMINDER: 43,
  PERC_CATWALK_START: 44,
  PERC_CATWALK_ACT: 45,
  PERC_CATWALK_SHOW: 46,
  PERC_CATWALK_BACK: 47,
  PERC_FREE_TIME: 50,
  PERC_SOCIALIZE: 51,
  PERC_SPECT_PERFORM: 55,
  PERC_FACE_DETCTION: 56,
  PERC_DANGER_INFO: 60,
  PERC_WELCOME_DEMO: 61,
  PERC_LOBBY_DEMO: 62,
  PERC_CANCEL: 100,
  PERC_NODE_CLOSE: 200,
  PERC_NODE_START: 201,
  PERC_NODE_RESET: 202,
  FOLLOW_ON: 1,
  FOLLOW_OFF: 2,
}

module.exports = PercCmd;
