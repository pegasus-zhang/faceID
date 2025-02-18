// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Obstacle = require('./Obstacle.js');
let FreeSpace = require('./FreeSpace.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ObstacleList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.obstaclelist = null;
      this.free_space = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('obstaclelist')) {
        this.obstaclelist = initObj.obstaclelist
      }
      else {
        this.obstaclelist = [];
      }
      if (initObj.hasOwnProperty('free_space')) {
        this.free_space = initObj.free_space
      }
      else {
        this.free_space = new FreeSpace();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [obstaclelist]
    // Serialize the length for message field [obstaclelist]
    bufferOffset = _serializer.uint32(obj.obstaclelist.length, buffer, bufferOffset);
    obj.obstaclelist.forEach((val) => {
      bufferOffset = Obstacle.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [free_space]
    bufferOffset = FreeSpace.serialize(obj.free_space, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleList
    let len;
    let data = new ObstacleList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstaclelist]
    // Deserialize array length for message field [obstaclelist]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstaclelist = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstaclelist[i] = Obstacle.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [free_space]
    data.free_space = FreeSpace.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.obstaclelist.forEach((val) => {
      length += Obstacle.getMessageSize(val);
    });
    length += FreeSpace.getMessageSize(object.free_space);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/ObstacleList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '05b2fafa6d44e7a83845863b5ebb615f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    Obstacle[] obstaclelist # #感知识别出的所有物体信息
    FreeSpace   free_space     # #可行使区域
    
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
    MSG: ros_interface/Obstacle
    Header   header     #  
    uint8   id     # #物体ID
    int32   type     # #物体类型，TYPE=0//未知物体，TYPE=1//门，TYPE=2//窗户，TYPE=3//冰箱，TYPE=4//电视，TYPE=5//风扇，TYPE=6//衣柜，TYPE=7//床，TYPE=8//沙发，TYPE=9//桌子，TYPE=10//椅子，TYPE=11//楼梯，TYPE=12//台阶，TYPE=13//斜坡，TYPE=14//坑洼，TYPE=15//人
    float32   confidence     # #置信度
    Point3D   center_point_abs     # #在世界坐标系下的物体中心位置
    float32   theta     # #在世界坐标系下物体的朝向
    Point3D   velocity     # #在世界坐标系下的物体的速度
    float32   length     # #物体外接立体的长度
    float32   width     # #物体外接立体的宽度
    float32   height     # #物体外接立体的高度
    OccGrid[] occupy_grid # # 世界坐标系下物体占据的网格
    
    ================================================================================
    MSG: ros_interface/Point3D
    float32   x     #  
    float32   y     #  
    float32   z     #  
    
    ================================================================================
    MSG: ros_interface/OccGrid
    int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
    int32   index_x     # //网格横向编号
    int32   index_y     # //网格纵向编号
    int32   index_z     # //网格垂直方向编号
    float32   grid_size_x     # //网格横向大小，单位：米
    float32   grid_size_y     # //网格纵向大小，单位：米
    float32   grid_size_z     # //网格垂直方向大小，单位：米
    
    ================================================================================
    MSG: ros_interface/FreeSpace
    Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
    OccGrid[] freegrids # //网格横向编号
    #Polygon3D[] freegrids
    Point3D[] freespace_region # //网格大小，单位：米
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.obstaclelist !== undefined) {
      resolved.obstaclelist = new Array(msg.obstaclelist.length);
      for (let i = 0; i < resolved.obstaclelist.length; ++i) {
        resolved.obstaclelist[i] = Obstacle.Resolve(msg.obstaclelist[i]);
      }
    }
    else {
      resolved.obstaclelist = []
    }

    if (msg.free_space !== undefined) {
      resolved.free_space = FreeSpace.Resolve(msg.free_space)
    }
    else {
      resolved.free_space = new FreeSpace()
    }

    return resolved;
    }
};

module.exports = ObstacleList;
