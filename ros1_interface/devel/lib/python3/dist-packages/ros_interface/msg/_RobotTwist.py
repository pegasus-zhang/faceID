# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ros_interface/RobotTwist.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import ros_interface.msg

class RobotTwist(genpy.Message):
  _md5sum = "7938edcb0110b16827b9b0f7a4e4695d"
  _type = "ros_interface/RobotTwist"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """Vector3   linear     # 线速度（x方向 y方向 z方向）
Vector3   angular     # 角速度（x方向 y方向 z方向）
string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了

================================================================================
MSG: ros_interface/Vector3
float32   x     #  
float32   y     #  
float32   z     #  
"""
  __slots__ = ['linear','angular','action_name']
  _slot_types = ['ros_interface/Vector3','ros_interface/Vector3','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       linear,angular,action_name

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(RobotTwist, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.linear is None:
        self.linear = ros_interface.msg.Vector3()
      if self.angular is None:
        self.angular = ros_interface.msg.Vector3()
      if self.action_name is None:
        self.action_name = ''
    else:
      self.linear = ros_interface.msg.Vector3()
      self.angular = ros_interface.msg.Vector3()
      self.action_name = ''

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
      buff.write(_get_struct_6f().pack(_x.linear.x, _x.linear.y, _x.linear.z, _x.angular.x, _x.angular.y, _x.angular.z))
      _x = self.action_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
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
      if self.linear is None:
        self.linear = ros_interface.msg.Vector3()
      if self.angular is None:
        self.angular = ros_interface.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 24
      (_x.linear.x, _x.linear.y, _x.linear.z, _x.angular.x, _x.angular.y, _x.angular.z,) = _get_struct_6f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.action_name = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.action_name = str[start:end]
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
      buff.write(_get_struct_6f().pack(_x.linear.x, _x.linear.y, _x.linear.z, _x.angular.x, _x.angular.y, _x.angular.z))
      _x = self.action_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
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
      if self.linear is None:
        self.linear = ros_interface.msg.Vector3()
      if self.angular is None:
        self.angular = ros_interface.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 24
      (_x.linear.x, _x.linear.y, _x.linear.z, _x.angular.x, _x.angular.y, _x.angular.z,) = _get_struct_6f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.action_name = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.action_name = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_6f = None
def _get_struct_6f():
    global _struct_6f
    if _struct_6f is None:
        _struct_6f = struct.Struct("<6f")
    return _struct_6f
