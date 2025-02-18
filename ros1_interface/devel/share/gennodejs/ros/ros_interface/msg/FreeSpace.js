// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let OccGrid = require('./OccGrid.js');
let Point3D = require('./Point3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FreeSpace {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.freegrids = null;
      this.freespace_region = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('freegrids')) {
        this.freegrids = initObj.freegrids
      }
      else {
        this.freegrids = [];
      }
      if (initObj.hasOwnProperty('freespace_region')) {
        this.freespace_region = initObj.freespace_region
      }
      else {
        this.freespace_region = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FreeSpace
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [freegrids]
    // Serialize the length for message field [freegrids]
    bufferOffset = _serializer.uint32(obj.freegrids.length, buffer, bufferOffset);
    obj.freegrids.forEach((val) => {
      bufferOffset = OccGrid.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [freespace_region]
    // Serialize the length for message field [freespace_region]
    bufferOffset = _serializer.uint32(obj.freespace_region.length, buffer, bufferOffset);
    obj.freespace_region.forEach((val) => {
      bufferOffset = Point3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FreeSpace
    let len;
    let data = new FreeSpace(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [freegrids]
    // Deserialize array length for message field [freegrids]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.freegrids = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.freegrids[i] = OccGrid.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [freespace_region]
    // Deserialize array length for message field [freespace_region]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.freespace_region = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.freespace_region[i] = Point3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 28 * object.freegrids.length;
    length += 12 * object.freespace_region.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/FreeSpace';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '15506d871fb0214f52a0519b30282177';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
    OccGrid[] freegrids # //网格横向编号
    #Polygon3D[] freegrids
    Point3D[] freespace_region # //网格大小，单位：米
    
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
    MSG: ros_interface/OccGrid
    int32   type     # //网格类型，TYPE=0//未知，TYPE=1//可行驶，TYPE=2//不可行驶
    int32   index_x     # //网格横向编号
    int32   index_y     # //网格纵向编号
    int32   index_z     # //网格垂直方向编号
    float32   grid_size_x     # //网格横向大小，单位：米
    float32   grid_size_y     # //网格纵向大小，单位：米
    float32   grid_size_z     # //网格垂直方向大小，单位：米
    
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
    const resolved = new FreeSpace(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.freegrids !== undefined) {
      resolved.freegrids = new Array(msg.freegrids.length);
      for (let i = 0; i < resolved.freegrids.length; ++i) {
        resolved.freegrids[i] = OccGrid.Resolve(msg.freegrids[i]);
      }
    }
    else {
      resolved.freegrids = []
    }

    if (msg.freespace_region !== undefined) {
      resolved.freespace_region = new Array(msg.freespace_region.length);
      for (let i = 0; i < resolved.freespace_region.length; ++i) {
        resolved.freespace_region[i] = Point3D.Resolve(msg.freespace_region[i]);
      }
    }
    else {
      resolved.freespace_region = []
    }

    return resolved;
    }
};

module.exports = FreeSpace;
