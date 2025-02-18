// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BBox2D = require('./BBox2D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Gesture {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.confidence = null;
      this.gesture_type = null;
      this.gesture_box = null;
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
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
      if (initObj.hasOwnProperty('gesture_type')) {
        this.gesture_type = initObj.gesture_type
      }
      else {
        this.gesture_type = 0;
      }
      if (initObj.hasOwnProperty('gesture_box')) {
        this.gesture_box = initObj.gesture_box
      }
      else {
        this.gesture_box = new BBox2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gesture
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    // Serialize message field [gesture_type]
    bufferOffset = _serializer.int32(obj.gesture_type, buffer, bufferOffset);
    // Serialize message field [gesture_box]
    bufferOffset = BBox2D.serialize(obj.gesture_box, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gesture
    let len;
    let data = new Gesture(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gesture_type]
    data.gesture_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [gesture_box]
    data.gesture_box = BBox2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/Gesture';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0281d8a12e33d2fbe20a398379db4076';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    uint8   id     # #手势ID
    float32   confidence     # #置信度
    int32   gesture_type     # #手势类型，GESTURE_TYPE=0//未知模式，GESTURE_TYPE=1//来，手指指向下方，GESTURE_TYPE=2//握手，GESTURE_TYPE=3//招手，打招呼
    BBox2D   gesture_box     # # 手势图像框
    
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
    MSG: ros_interface/BBox2D
    int16   xmin     # # 图像框左上角的x坐标
    int16   ymin     # # 图像框左上角的y坐标
    int16   xmax     # # 图像框右下角的x坐标
    int16   ymax     # # 图像框右下角的y坐标
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gesture(null);
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

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    if (msg.gesture_type !== undefined) {
      resolved.gesture_type = msg.gesture_type;
    }
    else {
      resolved.gesture_type = 0
    }

    if (msg.gesture_box !== undefined) {
      resolved.gesture_box = BBox2D.Resolve(msg.gesture_box)
    }
    else {
      resolved.gesture_box = new BBox2D()
    }

    return resolved;
    }
};

module.exports = Gesture;
