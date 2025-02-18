// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PointENU = require('./PointENU.js');
let Quaternion = require('./Quaternion.js');
let Point3D = require('./Point3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class VIOOdom {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.position = null;
      this.orientation = null;
      this.pitch = null;
      this.roll = null;
      this.heading = null;
      this.position_std_dev = null;
      this.orientation_std_dev = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new PointENU();
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new Quaternion();
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('position_std_dev')) {
        this.position_std_dev = initObj.position_std_dev
      }
      else {
        this.position_std_dev = new Point3D();
      }
      if (initObj.hasOwnProperty('orientation_std_dev')) {
        this.orientation_std_dev = initObj.orientation_std_dev
      }
      else {
        this.orientation_std_dev = new Point3D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VIOOdom
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = PointENU.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float32(obj.heading, buffer, bufferOffset);
    // Serialize message field [position_std_dev]
    bufferOffset = Point3D.serialize(obj.position_std_dev, buffer, bufferOffset);
    // Serialize message field [orientation_std_dev]
    bufferOffset = Point3D.serialize(obj.orientation_std_dev, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VIOOdom
    let len;
    let data = new VIOOdom(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = PointENU.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position_std_dev]
    data.position_std_dev = Point3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation_std_dev]
    data.orientation_std_dev = Point3D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/VIOOdom';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26bbbc0f0fc437f554ced320e72f76c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    PointENU   position     # # xxx坐标系下相对于原点的xyz
    Quaternion   orientation     # # 姿态四元数
    float32   pitch     # # 姿态角(单位弧度，满足右手定则)
    float32   roll     #  
    float32   heading     #  
    Point3D   position_std_dev     # # 位置标准差
    Point3D   orientation_std_dev     # # 姿态标准差
    
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
    MSG: ros_interface/PointENU
    float32   x     #  
    float32   y     #  
    float32   z     #  
    
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
    const resolved = new VIOOdom(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.position !== undefined) {
      resolved.position = PointENU.Resolve(msg.position)
    }
    else {
      resolved.position = new PointENU()
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new Quaternion()
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.position_std_dev !== undefined) {
      resolved.position_std_dev = Point3D.Resolve(msg.position_std_dev)
    }
    else {
      resolved.position_std_dev = new Point3D()
    }

    if (msg.orientation_std_dev !== undefined) {
      resolved.orientation_std_dev = Point3D.Resolve(msg.orientation_std_dev)
    }
    else {
      resolved.orientation_std_dev = new Point3D()
    }

    return resolved;
    }
};

module.exports = VIOOdom;
