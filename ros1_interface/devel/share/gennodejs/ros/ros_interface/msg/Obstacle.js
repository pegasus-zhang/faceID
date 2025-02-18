// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point3D = require('./Point3D.js');
let OccGrid = require('./OccGrid.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Obstacle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.type = null;
      this.confidence = null;
      this.center_point_abs = null;
      this.theta = null;
      this.velocity = null;
      this.length = null;
      this.width = null;
      this.height = null;
      this.occupy_grid = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
      if (initObj.hasOwnProperty('center_point_abs')) {
        this.center_point_abs = initObj.center_point_abs
      }
      else {
        this.center_point_abs = new Point3D();
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new Point3D();
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('occupy_grid')) {
        this.occupy_grid = initObj.occupy_grid
      }
      else {
        this.occupy_grid = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Obstacle
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    // Serialize message field [center_point_abs]
    bufferOffset = Point3D.serialize(obj.center_point_abs, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.float32(obj.theta, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = Point3D.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [occupy_grid]
    // Serialize the length for message field [occupy_grid]
    bufferOffset = _serializer.uint32(obj.occupy_grid.length, buffer, bufferOffset);
    obj.occupy_grid.forEach((val) => {
      bufferOffset = OccGrid.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Obstacle
    let len;
    let data = new Obstacle(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [center_point_abs]
    data.center_point_abs = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [occupy_grid]
    // Deserialize array length for message field [occupy_grid]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.occupy_grid = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.occupy_grid[i] = OccGrid.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 28 * object.occupy_grid.length;
    return length + 53;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Obstacle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8cdacb9dc63898edc5f02d22321631b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Obstacle(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    if (msg.center_point_abs !== undefined) {
      resolved.center_point_abs = Point3D.Resolve(msg.center_point_abs)
    }
    else {
      resolved.center_point_abs = new Point3D()
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = Point3D.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new Point3D()
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.occupy_grid !== undefined) {
      resolved.occupy_grid = new Array(msg.occupy_grid.length);
      for (let i = 0; i < resolved.occupy_grid.length; ++i) {
        resolved.occupy_grid[i] = OccGrid.Resolve(msg.occupy_grid[i]);
      }
    }
    else {
      resolved.occupy_grid = []
    }

    return resolved;
    }
};

module.exports = Obstacle;
