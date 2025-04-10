# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from eye_msgs/EyeState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class EyeState(genpy.Message):
  _md5sum = "41f7fe8eaece5c7faa443d0f00d98c30"
  _type = "eye_msgs/EyeState"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """std_msgs/Header header

# ActionState
uint8 ACTION_IDLE = 0
uint8 ACTION_RUNNING = 1
uint8 ACTION_DONE = 2

# ActionResult
uint8 ACTION_NONE = 0
uint8 ACTION_SUCCESS = 1
uint8 ACTION_FAIL = 2

# ErrCode
uint16 ACTION_ERR_NONE = 0
uint16 ACTION_ERR_NOWORK = 1

# 当前执行的id
uint64 action_id

# 人脸录入
uint32 EYE_FACE_RECORD          = 5
uint32 EYE_BODY_RECORD          = 6 
# 欢迎模式
uint32 EYE_WELCOME_DEMO         = 61
# 回大厅找人
uint32 EYE_LOBBY_DEMO           = 62

# 任务取消（不需要请求）
uint32 EYE_CANCEL               = 100

# 类型
uint32 eye_kind
# 执行状态：空闲/正在执行/执行完成
uint8 exe_state
# 执行结果：无效/成功/失败
uint8 exe_result

# 错误码
uint16 err_code
# 错误消息
string err_info
# 剩余执行时间
uint64 wait_for_millisec

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
"""
  # Pseudo-constants
  ACTION_IDLE = 0
  ACTION_RUNNING = 1
  ACTION_DONE = 2
  ACTION_NONE = 0
  ACTION_SUCCESS = 1
  ACTION_FAIL = 2
  ACTION_ERR_NONE = 0
  ACTION_ERR_NOWORK = 1
  EYE_FACE_RECORD = 5
  EYE_BODY_RECORD = 6
  EYE_WELCOME_DEMO = 61
  EYE_LOBBY_DEMO = 62
  EYE_CANCEL = 100

  __slots__ = ['header','action_id','eye_kind','exe_state','exe_result','err_code','err_info','wait_for_millisec']
  _slot_types = ['std_msgs/Header','uint64','uint32','uint8','uint8','uint16','string','uint64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,action_id,eye_kind,exe_state,exe_result,err_code,err_info,wait_for_millisec

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(EyeState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.action_id is None:
        self.action_id = 0
      if self.eye_kind is None:
        self.eye_kind = 0
      if self.exe_state is None:
        self.exe_state = 0
      if self.exe_result is None:
        self.exe_result = 0
      if self.err_code is None:
        self.err_code = 0
      if self.err_info is None:
        self.err_info = ''
      if self.wait_for_millisec is None:
        self.wait_for_millisec = 0
    else:
      self.header = std_msgs.msg.Header()
      self.action_id = 0
      self.eye_kind = 0
      self.exe_state = 0
      self.exe_result = 0
      self.err_code = 0
      self.err_info = ''
      self.wait_for_millisec = 0

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
      buff.write(_get_struct_QI2BH().pack(_x.action_id, _x.eye_kind, _x.exe_state, _x.exe_result, _x.err_code))
      _x = self.err_info
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.wait_for_millisec
      buff.write(_get_struct_Q().pack(_x))
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
      end += 16
      (_x.action_id, _x.eye_kind, _x.exe_state, _x.exe_result, _x.err_code,) = _get_struct_QI2BH().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.err_info = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.err_info = str[start:end]
      start = end
      end += 8
      (self.wait_for_millisec,) = _get_struct_Q().unpack(str[start:end])
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
      buff.write(_get_struct_QI2BH().pack(_x.action_id, _x.eye_kind, _x.exe_state, _x.exe_result, _x.err_code))
      _x = self.err_info
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.wait_for_millisec
      buff.write(_get_struct_Q().pack(_x))
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
      end += 16
      (_x.action_id, _x.eye_kind, _x.exe_state, _x.exe_result, _x.err_code,) = _get_struct_QI2BH().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.err_info = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.err_info = str[start:end]
      start = end
      end += 8
      (self.wait_for_millisec,) = _get_struct_Q().unpack(str[start:end])
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
_struct_Q = None
def _get_struct_Q():
    global _struct_Q
    if _struct_Q is None:
        _struct_Q = struct.Struct("<Q")
    return _struct_Q
_struct_QI2BH = None
def _get_struct_QI2BH():
    global _struct_QI2BH
    if _struct_QI2BH is None:
        _struct_QI2BH = struct.Struct("<QI2BH")
    return _struct_QI2BH
