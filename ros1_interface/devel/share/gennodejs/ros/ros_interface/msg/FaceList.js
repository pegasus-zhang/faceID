// Auto-generated. Do not edit!

// (in-package ros_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Face = require('./Face.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FaceList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.face = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('face')) {
        this.face = initObj.face
      }
      else {
        this.face = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FaceList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [face]
    // Serialize the length for message field [face]
    bufferOffset = _serializer.uint32(obj.face.length, buffer, bufferOffset);
    obj.face.forEach((val) => {
      bufferOffset = Face.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FaceList
    let len;
    let data = new FaceList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [face]
    // Deserialize array length for message field [face]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.face = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.face[i] = Face.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.face.forEach((val) => {
      length += Face.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interface/FaceList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95adfebc50f00fb22ca152865b53b267';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header   header     #  
    Face[]  face   #感知的所有人体信息
    
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
    MSG: ros_interface/Face
    Header   header     #  
    uint32   id     # #面容ID
    string   name     # #面容名称
    int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤
    int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户
    float32   confidence     # #人脸检测置信度
    BBox2D   face_box     # # 人脸图像框
    BBox2D   body_box     # # 人体图像框
    Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
    sensor_msgs/Image image
    
    ================================================================================
    MSG: ros_interface/BBox2D
    int16   xmin     # # 图像框左上角的x坐标
    int16   ymin     # # 图像框左上角的y坐标
    int16   xmax     # # 图像框右下角的x坐标
    int16   ymax     # # 图像框右下角的y坐标
    
    ================================================================================
    MSG: ros_interface/Point3D
    float32   x     #  
    float32   y     #  
    float32   z     #  
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FaceList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.face !== undefined) {
      resolved.face = new Array(msg.face.length);
      for (let i = 0; i < resolved.face.length; ++i) {
        resolved.face[i] = Face.Resolve(msg.face[i]);
      }
    }
    else {
      resolved.face = []
    }

    return resolved;
    }
};

module.exports = FaceList;
