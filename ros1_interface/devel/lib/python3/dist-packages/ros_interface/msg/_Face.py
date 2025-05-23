# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ros_interface/Face.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import ros_interface.msg
import sensor_msgs.msg
import std_msgs.msg

class Face(genpy.Message):
  _md5sum = "0d64c2d16db71623f9aa8dc2f423d616"
  _type = "ros_interface/Face"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header   header     #  
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
"""
  __slots__ = ['header','id','name','emotion_type','type','confidence','face_box','body_box','center_point_abs','image']
  _slot_types = ['std_msgs/Header','uint32','string','int32','int32','float32','ros_interface/BBox2D','ros_interface/BBox2D','ros_interface/Point3D','sensor_msgs/Image']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,id,name,emotion_type,type,confidence,face_box,body_box,center_point_abs,image

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Face, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.id is None:
        self.id = 0
      if self.name is None:
        self.name = ''
      if self.emotion_type is None:
        self.emotion_type = 0
      if self.type is None:
        self.type = 0
      if self.confidence is None:
        self.confidence = 0.
      if self.face_box is None:
        self.face_box = ros_interface.msg.BBox2D()
      if self.body_box is None:
        self.body_box = ros_interface.msg.BBox2D()
      if self.center_point_abs is None:
        self.center_point_abs = ros_interface.msg.Point3D()
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
    else:
      self.header = std_msgs.msg.Header()
      self.id = 0
      self.name = ''
      self.emotion_type = 0
      self.type = 0
      self.confidence = 0.
      self.face_box = ros_interface.msg.BBox2D()
      self.body_box = ros_interface.msg.BBox2D()
      self.center_point_abs = ros_interface.msg.Point3D()
      self.image = sensor_msgs.msg.Image()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.id
      buff.write(_get_struct_I().pack(_x))
      _x = self.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2if8h3f3I().pack(_x.emotion_type, _x.type, _x.confidence, _x.face_box.xmin, _x.face_box.ymin, _x.face_box.xmax, _x.face_box.ymax, _x.body_box.xmin, _x.body_box.ymin, _x.body_box.xmax, _x.body_box.ymax, _x.center_point_abs.x, _x.center_point_abs.y, _x.center_point_abs.z, _x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs))
      _x = self.image.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.image.height, _x.image.width))
      _x = self.image.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.image.is_bigendian, _x.image.step))
      _x = self.image.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.Struct('<I%sB'%length).pack(length, *_x))
      else:
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.face_box is None:
        self.face_box = ros_interface.msg.BBox2D()
      if self.body_box is None:
        self.body_box = ros_interface.msg.BBox2D()
      if self.center_point_abs is None:
        self.center_point_abs = ros_interface.msg.Point3D()
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (self.id,) = _get_struct_I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.name = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.name = str[start:end]
      _x = self
      start = end
      end += 52
      (_x.emotion_type, _x.type, _x.confidence, _x.face_box.xmin, _x.face_box.ymin, _x.face_box.xmax, _x.face_box.ymax, _x.body_box.xmin, _x.body_box.ymin, _x.body_box.xmax, _x.body_box.ymax, _x.center_point_abs.x, _x.center_point_abs.y, _x.center_point_abs.z, _x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs,) = _get_struct_2if8h3f3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.image.height, _x.image.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.encoding = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.image.is_bigendian, _x.image.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.image.data = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.id
      buff.write(_get_struct_I().pack(_x))
      _x = self.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2if8h3f3I().pack(_x.emotion_type, _x.type, _x.confidence, _x.face_box.xmin, _x.face_box.ymin, _x.face_box.xmax, _x.face_box.ymax, _x.body_box.xmin, _x.body_box.ymin, _x.body_box.xmax, _x.body_box.ymax, _x.center_point_abs.x, _x.center_point_abs.y, _x.center_point_abs.z, _x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs))
      _x = self.image.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.image.height, _x.image.width))
      _x = self.image.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.image.is_bigendian, _x.image.step))
      _x = self.image.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.Struct('<I%sB'%length).pack(length, *_x))
      else:
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.face_box is None:
        self.face_box = ros_interface.msg.BBox2D()
      if self.body_box is None:
        self.body_box = ros_interface.msg.BBox2D()
      if self.center_point_abs is None:
        self.center_point_abs = ros_interface.msg.Point3D()
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (self.id,) = _get_struct_I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.name = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.name = str[start:end]
      _x = self
      start = end
      end += 52
      (_x.emotion_type, _x.type, _x.confidence, _x.face_box.xmin, _x.face_box.ymin, _x.face_box.xmax, _x.face_box.ymax, _x.body_box.xmin, _x.body_box.ymin, _x.body_box.xmax, _x.body_box.ymax, _x.center_point_abs.x, _x.center_point_abs.y, _x.center_point_abs.z, _x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs,) = _get_struct_2if8h3f3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.image.height, _x.image.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.encoding = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.image.is_bigendian, _x.image.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.image.data = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_2if8h3f3I = None
def _get_struct_2if8h3f3I():
    global _struct_2if8h3f3I
    if _struct_2if8h3f3I is None:
        _struct_2if8h3f3I = struct.Struct("<2if8h3f3I")
    return _struct_2if8h3f3I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_BI = None
def _get_struct_BI():
    global _struct_BI
    if _struct_BI is None:
        _struct_BI = struct.Struct("<BI")
    return _struct_BI
