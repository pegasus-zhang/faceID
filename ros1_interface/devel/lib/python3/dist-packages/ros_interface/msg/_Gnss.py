# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ros_interface/Gnss.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import ros_interface.msg
import std_msgs.msg

class Gnss(genpy.Message):
  _md5sum = "24b33ab56e90d13bfcf615123e61b968"
  _type = "ros_interface/Gnss"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header   header     #  
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
"""
  __slots__ = ['header','is_valid','latitude','longitude','elevation','utm_position','attitude','sd_position','sd_velocity','sd_attitude','second','sat_use_num','sat_in_view_num','solution_status','position_type','linear_velocity']
  _slot_types = ['std_msgs/Header','bool','float32','float32','float32','ros_interface/Point3D','ros_interface/Point3D','ros_interface/Point3D','ros_interface/Point3D','ros_interface/Point3D','float32','int32','int32','uint16','uint16','ros_interface/Point3D']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,is_valid,latitude,longitude,elevation,utm_position,attitude,sd_position,sd_velocity,sd_attitude,second,sat_use_num,sat_in_view_num,solution_status,position_type,linear_velocity

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Gnss, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.is_valid is None:
        self.is_valid = False
      if self.latitude is None:
        self.latitude = 0.
      if self.longitude is None:
        self.longitude = 0.
      if self.elevation is None:
        self.elevation = 0.
      if self.utm_position is None:
        self.utm_position = ros_interface.msg.Point3D()
      if self.attitude is None:
        self.attitude = ros_interface.msg.Point3D()
      if self.sd_position is None:
        self.sd_position = ros_interface.msg.Point3D()
      if self.sd_velocity is None:
        self.sd_velocity = ros_interface.msg.Point3D()
      if self.sd_attitude is None:
        self.sd_attitude = ros_interface.msg.Point3D()
      if self.second is None:
        self.second = 0.
      if self.sat_use_num is None:
        self.sat_use_num = 0
      if self.sat_in_view_num is None:
        self.sat_in_view_num = 0
      if self.solution_status is None:
        self.solution_status = 0
      if self.position_type is None:
        self.position_type = 0
      if self.linear_velocity is None:
        self.linear_velocity = ros_interface.msg.Point3D()
    else:
      self.header = std_msgs.msg.Header()
      self.is_valid = False
      self.latitude = 0.
      self.longitude = 0.
      self.elevation = 0.
      self.utm_position = ros_interface.msg.Point3D()
      self.attitude = ros_interface.msg.Point3D()
      self.sd_position = ros_interface.msg.Point3D()
      self.sd_velocity = ros_interface.msg.Point3D()
      self.sd_attitude = ros_interface.msg.Point3D()
      self.second = 0.
      self.sat_use_num = 0
      self.sat_in_view_num = 0
      self.solution_status = 0
      self.position_type = 0
      self.linear_velocity = ros_interface.msg.Point3D()

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
      _x = self
      buff.write(_get_struct_B19f2i2H3f().pack(_x.is_valid, _x.latitude, _x.longitude, _x.elevation, _x.utm_position.x, _x.utm_position.y, _x.utm_position.z, _x.attitude.x, _x.attitude.y, _x.attitude.z, _x.sd_position.x, _x.sd_position.y, _x.sd_position.z, _x.sd_velocity.x, _x.sd_velocity.y, _x.sd_velocity.z, _x.sd_attitude.x, _x.sd_attitude.y, _x.sd_attitude.z, _x.second, _x.sat_use_num, _x.sat_in_view_num, _x.solution_status, _x.position_type, _x.linear_velocity.x, _x.linear_velocity.y, _x.linear_velocity.z))
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
      if self.utm_position is None:
        self.utm_position = ros_interface.msg.Point3D()
      if self.attitude is None:
        self.attitude = ros_interface.msg.Point3D()
      if self.sd_position is None:
        self.sd_position = ros_interface.msg.Point3D()
      if self.sd_velocity is None:
        self.sd_velocity = ros_interface.msg.Point3D()
      if self.sd_attitude is None:
        self.sd_attitude = ros_interface.msg.Point3D()
      if self.linear_velocity is None:
        self.linear_velocity = ros_interface.msg.Point3D()
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
      _x = self
      start = end
      end += 101
      (_x.is_valid, _x.latitude, _x.longitude, _x.elevation, _x.utm_position.x, _x.utm_position.y, _x.utm_position.z, _x.attitude.x, _x.attitude.y, _x.attitude.z, _x.sd_position.x, _x.sd_position.y, _x.sd_position.z, _x.sd_velocity.x, _x.sd_velocity.y, _x.sd_velocity.z, _x.sd_attitude.x, _x.sd_attitude.y, _x.sd_attitude.z, _x.second, _x.sat_use_num, _x.sat_in_view_num, _x.solution_status, _x.position_type, _x.linear_velocity.x, _x.linear_velocity.y, _x.linear_velocity.z,) = _get_struct_B19f2i2H3f().unpack(str[start:end])
      self.is_valid = bool(self.is_valid)
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
      _x = self
      buff.write(_get_struct_B19f2i2H3f().pack(_x.is_valid, _x.latitude, _x.longitude, _x.elevation, _x.utm_position.x, _x.utm_position.y, _x.utm_position.z, _x.attitude.x, _x.attitude.y, _x.attitude.z, _x.sd_position.x, _x.sd_position.y, _x.sd_position.z, _x.sd_velocity.x, _x.sd_velocity.y, _x.sd_velocity.z, _x.sd_attitude.x, _x.sd_attitude.y, _x.sd_attitude.z, _x.second, _x.sat_use_num, _x.sat_in_view_num, _x.solution_status, _x.position_type, _x.linear_velocity.x, _x.linear_velocity.y, _x.linear_velocity.z))
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
      if self.utm_position is None:
        self.utm_position = ros_interface.msg.Point3D()
      if self.attitude is None:
        self.attitude = ros_interface.msg.Point3D()
      if self.sd_position is None:
        self.sd_position = ros_interface.msg.Point3D()
      if self.sd_velocity is None:
        self.sd_velocity = ros_interface.msg.Point3D()
      if self.sd_attitude is None:
        self.sd_attitude = ros_interface.msg.Point3D()
      if self.linear_velocity is None:
        self.linear_velocity = ros_interface.msg.Point3D()
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
      _x = self
      start = end
      end += 101
      (_x.is_valid, _x.latitude, _x.longitude, _x.elevation, _x.utm_position.x, _x.utm_position.y, _x.utm_position.z, _x.attitude.x, _x.attitude.y, _x.attitude.z, _x.sd_position.x, _x.sd_position.y, _x.sd_position.z, _x.sd_velocity.x, _x.sd_velocity.y, _x.sd_velocity.z, _x.sd_attitude.x, _x.sd_attitude.y, _x.sd_attitude.z, _x.second, _x.sat_use_num, _x.sat_in_view_num, _x.solution_status, _x.position_type, _x.linear_velocity.x, _x.linear_velocity.y, _x.linear_velocity.z,) = _get_struct_B19f2i2H3f().unpack(str[start:end])
      self.is_valid = bool(self.is_valid)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_B19f2i2H3f = None
def _get_struct_B19f2i2H3f():
    global _struct_B19f2i2H3f
    if _struct_B19f2i2H3f is None:
        _struct_B19f2i2H3f = struct.Struct("<B19f2i2H3f")
    return _struct_B19f2i2H3f
