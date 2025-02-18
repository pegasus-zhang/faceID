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
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Gnss {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.is_valid = null;
      this.latitude = null;
      this.longitude = null;
      this.elevation = null;
      this.utm_position = null;
      this.attitude = null;
      this.sd_position = null;
      this.sd_velocity = null;
      this.sd_attitude = null;
      this.second = null;
      this.sat_use_num = null;
      this.sat_in_view_num = null;
      this.solution_status = null;
      this.position_type = null;
      this.linear_velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('is_valid')) {
        this.is_valid = initObj.is_valid
      }
      else {
        this.is_valid = false;
      }
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('elevation')) {
        this.elevation = initObj.elevation
      }
      else {
        this.elevation = 0.0;
      }
      if (initObj.hasOwnProperty('utm_position')) {
        this.utm_position = initObj.utm_position
      }
      else {
        this.utm_position = new Point3D();
      }
      if (initObj.hasOwnProperty('attitude')) {
        this.attitude = initObj.attitude
      }
      else {
        this.attitude = new Point3D();
      }
      if (initObj.hasOwnProperty('sd_position')) {
        this.sd_position = initObj.sd_position
      }
      else {
        this.sd_position = new Point3D();
      }
      if (initObj.hasOwnProperty('sd_velocity')) {
        this.sd_velocity = initObj.sd_velocity
      }
      else {
        this.sd_velocity = new Point3D();
      }
      if (initObj.hasOwnProperty('sd_attitude')) {
        this.sd_attitude = initObj.sd_attitude
      }
      else {
        this.sd_attitude = new Point3D();
      }
      if (initObj.hasOwnProperty('second')) {
        this.second = initObj.second
      }
      else {
        this.second = 0.0;
      }
      if (initObj.hasOwnProperty('sat_use_num')) {
        this.sat_use_num = initObj.sat_use_num
      }
      else {
        this.sat_use_num = 0;
      }
      if (initObj.hasOwnProperty('sat_in_view_num')) {
        this.sat_in_view_num = initObj.sat_in_view_num
      }
      else {
        this.sat_in_view_num = 0;
      }
      if (initObj.hasOwnProperty('solution_status')) {
        this.solution_status = initObj.solution_status
      }
      else {
        this.solution_status = 0;
      }
      if (initObj.hasOwnProperty('position_type')) {
        this.position_type = initObj.position_type
      }
      else {
        this.position_type = 0;
      }
      if (initObj.hasOwnProperty('linear_velocity')) {
        this.linear_velocity = initObj.linear_velocity
      }
      else {
        this.linear_velocity = new Point3D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gnss
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [is_valid]
    bufferOffset = _serializer.bool(obj.is_valid, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float32(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float32(obj.longitude, buffer, bufferOffset);
    // Serialize message field [elevation]
    bufferOffset = _serializer.float32(obj.elevation, buffer, bufferOffset);
    // Serialize message field [utm_position]
    bufferOffset = Point3D.serialize(obj.utm_position, buffer, bufferOffset);
    // Serialize message field [attitude]
    bufferOffset = Point3D.serialize(obj.attitude, buffer, bufferOffset);
    // Serialize message field [sd_position]
    bufferOffset = Point3D.serialize(obj.sd_position, buffer, bufferOffset);
    // Serialize message field [sd_velocity]
    bufferOffset = Point3D.serialize(obj.sd_velocity, buffer, bufferOffset);
    // Serialize message field [sd_attitude]
    bufferOffset = Point3D.serialize(obj.sd_attitude, buffer, bufferOffset);
    // Serialize message field [second]
    bufferOffset = _serializer.float32(obj.second, buffer, bufferOffset);
    // Serialize message field [sat_use_num]
    bufferOffset = _serializer.int32(obj.sat_use_num, buffer, bufferOffset);
    // Serialize message field [sat_in_view_num]
    bufferOffset = _serializer.int32(obj.sat_in_view_num, buffer, bufferOffset);
    // Serialize message field [solution_status]
    bufferOffset = _serializer.uint16(obj.solution_status, buffer, bufferOffset);
    // Serialize message field [position_type]
    bufferOffset = _serializer.uint16(obj.position_type, buffer, bufferOffset);
    // Serialize message field [linear_velocity]
    bufferOffset = Point3D.serialize(obj.linear_velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gnss
    let len;
    let data = new Gnss(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [is_valid]
    data.is_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [elevation]
    data.elevation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [utm_position]
    data.utm_position = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [attitude]
    data.attitude = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [sd_position]
    data.sd_position = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [sd_velocity]
    data.sd_velocity = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [sd_attitude]
    data.sd_attitude = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [second]
    data.second = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sat_use_num]
    data.sat_use_num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sat_in_view_num]
    data.sat_in_view_num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [solution_status]
    data.solution_status = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [position_type]
    data.position_type = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [linear_velocity]
    data.linear_velocity = Point3D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 101;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Gnss';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '24b33ab56e90d13bfcf615123e61b968';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    bool   is_valid     # # 数据有效性标志位
    float32   latitude     # # 纬度信息
    float32   longitude     # # 经度信息
    float32   elevation     # # 海拔信息
    Point3D   utm_position     # # UTM坐标位置
    Point3D   attitude     # # 三轴姿态
    Point3D   sd_position     # # 位置标准差
    Point3D   sd_velocity     # # 速度标准差
    Point3D   sd_attitude     # # 姿态标准差
    float32   second     # # 时间
    int32   sat_use_num     # # 使用卫星数
    int32   sat_in_view_num     # # 可见卫星数
    uint16   solution_status     # # 求解状态
    uint16   position_type     # # 定位状态
    Point3D   linear_velocity     # # 线速度信息
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gnss(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.is_valid !== undefined) {
      resolved.is_valid = msg.is_valid;
    }
    else {
      resolved.is_valid = false
    }

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.elevation !== undefined) {
      resolved.elevation = msg.elevation;
    }
    else {
      resolved.elevation = 0.0
    }

    if (msg.utm_position !== undefined) {
      resolved.utm_position = Point3D.Resolve(msg.utm_position)
    }
    else {
      resolved.utm_position = new Point3D()
    }

    if (msg.attitude !== undefined) {
      resolved.attitude = Point3D.Resolve(msg.attitude)
    }
    else {
      resolved.attitude = new Point3D()
    }

    if (msg.sd_position !== undefined) {
      resolved.sd_position = Point3D.Resolve(msg.sd_position)
    }
    else {
      resolved.sd_position = new Point3D()
    }

    if (msg.sd_velocity !== undefined) {
      resolved.sd_velocity = Point3D.Resolve(msg.sd_velocity)
    }
    else {
      resolved.sd_velocity = new Point3D()
    }

    if (msg.sd_attitude !== undefined) {
      resolved.sd_attitude = Point3D.Resolve(msg.sd_attitude)
    }
    else {
      resolved.sd_attitude = new Point3D()
    }

    if (msg.second !== undefined) {
      resolved.second = msg.second;
    }
    else {
      resolved.second = 0.0
    }

    if (msg.sat_use_num !== undefined) {
      resolved.sat_use_num = msg.sat_use_num;
    }
    else {
      resolved.sat_use_num = 0
    }

    if (msg.sat_in_view_num !== undefined) {
      resolved.sat_in_view_num = msg.sat_in_view_num;
    }
    else {
      resolved.sat_in_view_num = 0
    }

    if (msg.solution_status !== undefined) {
      resolved.solution_status = msg.solution_status;
    }
    else {
      resolved.solution_status = 0
    }

    if (msg.position_type !== undefined) {
      resolved.position_type = msg.position_type;
    }
    else {
      resolved.position_type = 0
    }

    if (msg.linear_velocity !== undefined) {
      resolved.linear_velocity = Point3D.Resolve(msg.linear_velocity)
    }
    else {
      resolved.linear_velocity = new Point3D()
    }

    return resolved;
    }
};

module.exports = Gnss;
