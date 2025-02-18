// Auto-generated. Do not edit!

// (in-package perception_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PercReq {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.req_id = null;
      this.perc_kind = null;
      this.danger_info = null;
    }
    else {
      if (initObj.hasOwnProperty('req_id')) {
        this.req_id = initObj.req_id
      }
      else {
        this.req_id = 0;
      }
      if (initObj.hasOwnProperty('perc_kind')) {
        this.perc_kind = initObj.perc_kind
      }
      else {
        this.perc_kind = 0;
      }
      if (initObj.hasOwnProperty('danger_info')) {
        this.danger_info = initObj.danger_info
      }
      else {
        this.danger_info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PercReq
    // Serialize message field [req_id]
    bufferOffset = _serializer.uint64(obj.req_id, buffer, bufferOffset);
    // Serialize message field [perc_kind]
    bufferOffset = _serializer.uint32(obj.perc_kind, buffer, bufferOffset);
    // Serialize message field [danger_info]
    bufferOffset = _serializer.string(obj.danger_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PercReq
    let len;
    let data = new PercReq(null);
    // Deserialize message field [req_id]
    data.req_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [perc_kind]
    data.perc_kind = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [danger_info]
    data.danger_info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.danger_info);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'perception_msgs/PercReq';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '492b0539a30d91f76050eff6a0b4c63a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # 动作执行id,增加含义：时间+序号 
    uint64 req_id
    
    # Perceive Kind
    
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
    
    uint32 PERC_HAND_OK              = 70
    uint32 PERC_HAND_V               = 71
    uint32 PERC_HAND_SHAKE           = 72
    uint32 PERC_HAND_COME            = 73
    uint32 PERC_HAND_WAVE            = 74
    uint32 PERC_CAMERA_DEMO          = 80
    
    # 任务取消（不需要请求）
    uint32 PERC_CANCEL               = 100
    
    # 感知类型
    uint32 perc_kind
    
    # 危险信息
    string danger_info
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PercReq(null);
    if (msg.req_id !== undefined) {
      resolved.req_id = msg.req_id;
    }
    else {
      resolved.req_id = 0
    }

    if (msg.perc_kind !== undefined) {
      resolved.perc_kind = msg.perc_kind;
    }
    else {
      resolved.perc_kind = 0
    }

    if (msg.danger_info !== undefined) {
      resolved.danger_info = msg.danger_info;
    }
    else {
      resolved.danger_info = ''
    }

    return resolved;
    }
};

// Constants for message
PercReq.Constants = {
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
  PERC_HAND_OK: 70,
  PERC_HAND_V: 71,
  PERC_HAND_SHAKE: 72,
  PERC_HAND_COME: 73,
  PERC_HAND_WAVE: 74,
  PERC_CAMERA_DEMO: 80,
  PERC_CANCEL: 100,
}

module.exports = PercReq;
