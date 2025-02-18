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

class Terrain {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.type = null;
      this.sub_type = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('sub_type')) {
        this.sub_type = initObj.sub_type
      }
      else {
        this.sub_type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Terrain
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [sub_type]
    bufferOffset = _serializer.int32(obj.sub_type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Terrain
    let len;
    let data = new Terrain(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sub_type]
    data.sub_type = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Terrain';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '97919d0c95de1d91d1adc1ba724ac117';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    int32   type     # #室内或者室外，TYPE=0//未知，TYPE=1//室内，TYPE=2//室外
    int32   sub_type     # #地形类型，SUB_TYPE=0//未知地形，SUB_TYPE=1//水泥路面，SUB_TYPE=2//光滑路面，SUB_TYPE=3//沙地，UB_TYPE=4//碎石路面，SUB_TYPE=5//草地，SUB_TYPE=6//坑洼，SUB_TYPE=7//地毯，SUB_TYPE=8//斜坡，SUB_TYPE=9//阶梯，SUB_TYPE=10//木地板,SUB_TYPE=11//瓷砖
    
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
    const resolved = new Terrain(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.sub_type !== undefined) {
      resolved.sub_type = msg.sub_type;
    }
    else {
      resolved.sub_type = 0
    }

    return resolved;
    }
};

module.exports = Terrain;
