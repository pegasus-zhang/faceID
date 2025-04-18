# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ros_interface/QuadbotCmd.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import ros_interface.msg
import std_msgs.msg

class QuadbotCmd(genpy.Message):
  _md5sum = "b913b00e78766226918c3d24c7939f9a"
  _type = "ros_interface/QuadbotCmd"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header   header     #  
uint64   action_id     # #动作执行id
int32   quadbot_kind     # #简单指令（坐下...）；复杂指令（走直线/走圆弧）
string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了
Twist   twist     #  
ComplexCommand   complex_cmd     # #规划端不使用这个指令

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
MSG: ros_interface/Twist
Vector3   linear     # 线速度（x方向 y方向 z方向）
Vector3   angular     # 角速度（x方向 y方向 z方向）

================================================================================
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  

================================================================================
MSG: ros_interface/ComplexCommand
uint8   type_id     #  
uint8   unit_id     #  
float32   data_a     #  
float32   data_b     #  
"""
  __slots__ = ['header','action_id','quadbot_kind','action_name','twist','complex_cmd']
  _slot_types = ['std_msgs/Header','uint64','int32','string','ros_interface/Twist','ros_interface/ComplexCommand']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,action_id,quadbot_kind,action_name,twist,complex_cmd

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(QuadbotCmd, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.action_id is None:
        self.action_id = 0
      if self.quadbot_kind is None:
        self.quadbot_kind = 0
      if self.action_name is None:
        self.action_name = ''
      if self.twist is None:
        self.twist = ros_interface.msg.Twist()
      if self.complex_cmd is None:
        self.complex_cmd = ros_interface.msg.ComplexCommand()
    else:
      self.header = std_msgs.msg.Header()
      self.action_id = 0
      self.quadbot_kind = 0
      self.action_name = ''
      self.twist = ros_interface.msg.Twist()
      self.complex_cmd = ros_interface.msg.ComplexCommand()

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
      buff.write(_get_struct_Qi().pack(_x.action_id, _x.quadbot_kind))
      _x = self.action_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_6f2B2f().pack(_x.twist.linear.x, _x.twist.linear.y, _x.twist.linear.z, _x.twist.angular.x, _x.twist.angular.y, _x.twist.angular.z, _x.complex_cmd.type_id, _x.complex_cmd.unit_id, _x.complex_cmd.data_a, _x.complex_cmd.data_b))
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
      if self.twist is None:
        self.twist = ros_interface.msg.Twist()
      if self.complex_cmd is None:
        self.complex_cmd = ros_interface.msg.ComplexCommand()
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
      end += 12
      (_x.action_id, _x.quadbot_kind,) = _get_struct_Qi().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.action_name = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.action_name = str[start:end]
      _x = self
      start = end
      end += 34
      (_x.twist.linear.x, _x.twist.linear.y, _x.twist.linear.z, _x.twist.angular.x, _x.twist.angular.y, _x.twist.angular.z, _x.complex_cmd.type_id, _x.complex_cmd.unit_id, _x.complex_cmd.data_a, _x.complex_cmd.data_b,) = _get_struct_6f2B2f().unpack(str[start:end])
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
      buff.write(_get_struct_Qi().pack(_x.action_id, _x.quadbot_kind))
      _x = self.action_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_6f2B2f().pack(_x.twist.linear.x, _x.twist.linear.y, _x.twist.linear.z, _x.twist.angular.x, _x.twist.angular.y, _x.twist.angular.z, _x.complex_cmd.type_id, _x.complex_cmd.unit_id, _x.complex_cmd.data_a, _x.complex_cmd.data_b))
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
      if self.twist is None:
        self.twist = ros_interface.msg.Twist()
      if self.complex_cmd is None:
        self.complex_cmd = ros_interface.msg.ComplexCommand()
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
      end += 12
      (_x.action_id, _x.quadbot_kind,) = _get_struct_Qi().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.action_name = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.action_name = str[start:end]
      _x = self
      start = end
      end += 34
      (_x.twist.linear.x, _x.twist.linear.y, _x.twist.linear.z, _x.twist.angular.x, _x.twist.angular.y, _x.twist.angular.z, _x.complex_cmd.type_id, _x.complex_cmd.unit_id, _x.complex_cmd.data_a, _x.complex_cmd.data_b,) = _get_struct_6f2B2f().unpack(str[start:end])
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
_struct_6f2B2f = None
def _get_struct_6f2B2f():
    global _struct_6f2B2f
    if _struct_6f2B2f is None:
        _struct_6f2B2f = struct.Struct("<6f2B2f")
    return _struct_6f2B2f
_struct_Qi = None
def _get_struct_Qi():
    global _struct_Qi
    if _struct_Qi is None:
        _struct_Qi = struct.Struct("<Qi")
    return _struct_Qi
