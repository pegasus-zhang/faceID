// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PoseWithCovariance = require('./PoseWithCovariance.js');
let TwistWithCovariance = require('./TwistWithCovariance.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Odometry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.child_frame_id = null;
      this.pose = null;
      this.twist = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('child_frame_id')) {
        this.child_frame_id = initObj.child_frame_id
      }
      else {
        this.child_frame_id = '';
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new PoseWithCovariance();
      }
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = new TwistWithCovariance();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Odometry
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [child_frame_id]
    bufferOffset = _serializer.string(obj.child_frame_id, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = PoseWithCovariance.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [twist]
    bufferOffset = TwistWithCovariance.serialize(obj.twist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Odometry
    let len;
    let data = new Odometry(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [child_frame_id]
    data.child_frame_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = PoseWithCovariance.deserialize(buffer, bufferOffset);
    // Deserialize message field [twist]
    data.twist = TwistWithCovariance.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.child_frame_id);
    length += PoseWithCovariance.getMessageSize(object.pose);
    length += TwistWithCovariance.getMessageSize(object.twist);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Odometry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22d96cb55252fc83b8a389e3f3a97fc7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    string   child_frame_id     #  
    PoseWithCovariance   pose     #  
    TwistWithCovariance   twist     #  
    
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
    MSG: ros_interface/PoseWithCovariance
    float32[] covariance #  
    
    ================================================================================
    MSG: ros_interface/TwistWithCovariance
    float32[] covariance #  
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Odometry(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.child_frame_id !== undefined) {
      resolved.child_frame_id = msg.child_frame_id;
    }
    else {
      resolved.child_frame_id = ''
    }

    if (msg.pose !== undefined) {
      resolved.pose = PoseWithCovariance.Resolve(msg.pose)
    }
    else {
      resolved.pose = new PoseWithCovariance()
    }

    if (msg.twist !== undefined) {
      resolved.twist = TwistWithCovariance.Resolve(msg.twist)
    }
    else {
      resolved.twist = new TwistWithCovariance()
    }

    return resolved;
    }
};

module.exports = Odometry;
