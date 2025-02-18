// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Quaternion = require('./Quaternion.js');
let Point3D = require('./Point3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Imu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.is_valid = null;
      this.orientation = null;
      this.orientation_covariance = null;
      this.angular_velocity = null;
      this.angular_velocity_covariance = null;
      this.linear_acceleration = null;
      this.linear_acceleration_covariance = null;
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
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new Quaternion();
      }
      if (initObj.hasOwnProperty('orientation_covariance')) {
        this.orientation_covariance = initObj.orientation_covariance
      }
      else {
        this.orientation_covariance = [];
      }
      if (initObj.hasOwnProperty('angular_velocity')) {
        this.angular_velocity = initObj.angular_velocity
      }
      else {
        this.angular_velocity = new Point3D();
      }
      if (initObj.hasOwnProperty('angular_velocity_covariance')) {
        this.angular_velocity_covariance = initObj.angular_velocity_covariance
      }
      else {
        this.angular_velocity_covariance = [];
      }
      if (initObj.hasOwnProperty('linear_acceleration')) {
        this.linear_acceleration = initObj.linear_acceleration
      }
      else {
        this.linear_acceleration = new Point3D();
      }
      if (initObj.hasOwnProperty('linear_acceleration_covariance')) {
        this.linear_acceleration_covariance = initObj.linear_acceleration_covariance
      }
      else {
        this.linear_acceleration_covariance = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Imu
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [is_valid]
    bufferOffset = _serializer.bool(obj.is_valid, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [orientation_covariance]
    bufferOffset = _arraySerializer.float32(obj.orientation_covariance, buffer, bufferOffset, null);
    // Serialize message field [angular_velocity]
    bufferOffset = Point3D.serialize(obj.angular_velocity, buffer, bufferOffset);
    // Serialize message field [angular_velocity_covariance]
    bufferOffset = _arraySerializer.float32(obj.angular_velocity_covariance, buffer, bufferOffset, null);
    // Serialize message field [linear_acceleration]
    bufferOffset = Point3D.serialize(obj.linear_acceleration, buffer, bufferOffset);
    // Serialize message field [linear_acceleration_covariance]
    bufferOffset = _arraySerializer.float32(obj.linear_acceleration_covariance, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Imu
    let len;
    let data = new Imu(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [is_valid]
    data.is_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation_covariance]
    data.orientation_covariance = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [angular_velocity]
    data.angular_velocity = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular_velocity_covariance]
    data.angular_velocity_covariance = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [linear_acceleration]
    data.linear_acceleration = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_acceleration_covariance]
    data.linear_acceleration_covariance = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.orientation_covariance.length;
    length += 4 * object.angular_velocity_covariance.length;
    length += 4 * object.linear_acceleration_covariance.length;
    return length + 53;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Imu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aba9f7059a9aa4e1b1e5cb227fa1f0a1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    bool   is_valid     # # 数据有效性标志位
    Quaternion   orientation     # # 角度（四元素）
    float32[] orientation_covariance # # 角度方差
    Point3D   angular_velocity     # # 角速度信息
    float32[] angular_velocity_covariance # # 角速度方差
    Point3D   linear_acceleration     # # 线加速度信息
    float32[] linear_acceleration_covariance # # 线性加速度方差
    
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
    MSG: ros_interface/Quaternion
    float32   qx     #  
    float32   qy     #  
    float32   qz     #  
    float32   qw     #  
    
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
    const resolved = new Imu(null);
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

    if (msg.orientation !== undefined) {
      resolved.orientation = Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new Quaternion()
    }

    if (msg.orientation_covariance !== undefined) {
      resolved.orientation_covariance = msg.orientation_covariance;
    }
    else {
      resolved.orientation_covariance = []
    }

    if (msg.angular_velocity !== undefined) {
      resolved.angular_velocity = Point3D.Resolve(msg.angular_velocity)
    }
    else {
      resolved.angular_velocity = new Point3D()
    }

    if (msg.angular_velocity_covariance !== undefined) {
      resolved.angular_velocity_covariance = msg.angular_velocity_covariance;
    }
    else {
      resolved.angular_velocity_covariance = []
    }

    if (msg.linear_acceleration !== undefined) {
      resolved.linear_acceleration = Point3D.Resolve(msg.linear_acceleration)
    }
    else {
      resolved.linear_acceleration = new Point3D()
    }

    if (msg.linear_acceleration_covariance !== undefined) {
      resolved.linear_acceleration_covariance = msg.linear_acceleration_covariance;
    }
    else {
      resolved.linear_acceleration_covariance = []
    }

    return resolved;
    }
};

module.exports = Imu;
