// Generated by gencpp from file eye_msgs/EyeCmd.msg
// DO NOT EDIT!


#ifndef EYE_MSGS_MESSAGE_EYECMD_H
#define EYE_MSGS_MESSAGE_EYECMD_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace eye_msgs
{
template <class ContainerAllocator>
struct EyeCmd_
{
  typedef EyeCmd_<ContainerAllocator> Type;

  EyeCmd_()
    : header()
    , action_id(0)
    , eye_kind(0)
    , human_name()  {
    }
  EyeCmd_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , action_id(0)
    , eye_kind(0)
    , human_name(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint64_t _action_id_type;
  _action_id_type action_id;

   typedef uint32_t _eye_kind_type;
  _eye_kind_type eye_kind;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _human_name_type;
  _human_name_type human_name;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(EYE_FACE_RECORD)
  #undef EYE_FACE_RECORD
#endif
#if defined(_WIN32) && defined(EYE_BODY_RECORD)
  #undef EYE_BODY_RECORD
#endif
#if defined(_WIN32) && defined(EYE_WELCOME_DEMO)
  #undef EYE_WELCOME_DEMO
#endif
#if defined(_WIN32) && defined(EYE_LOBBY_DEMO)
  #undef EYE_LOBBY_DEMO
#endif
#if defined(_WIN32) && defined(EYE_CANCEL)
  #undef EYE_CANCEL
#endif

  enum {
    EYE_FACE_RECORD = 5u,
    EYE_BODY_RECORD = 6u,
    EYE_WELCOME_DEMO = 61u,
    EYE_LOBBY_DEMO = 62u,
    EYE_CANCEL = 100u,
  };


  typedef boost::shared_ptr< ::eye_msgs::EyeCmd_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::eye_msgs::EyeCmd_<ContainerAllocator> const> ConstPtr;

}; // struct EyeCmd_

typedef ::eye_msgs::EyeCmd_<std::allocator<void> > EyeCmd;

typedef boost::shared_ptr< ::eye_msgs::EyeCmd > EyeCmdPtr;
typedef boost::shared_ptr< ::eye_msgs::EyeCmd const> EyeCmdConstPtr;

// constants requiring out of line definition

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::eye_msgs::EyeCmd_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::eye_msgs::EyeCmd_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::eye_msgs::EyeCmd_<ContainerAllocator1> & lhs, const ::eye_msgs::EyeCmd_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.action_id == rhs.action_id &&
    lhs.eye_kind == rhs.eye_kind &&
    lhs.human_name == rhs.human_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::eye_msgs::EyeCmd_<ContainerAllocator1> & lhs, const ::eye_msgs::EyeCmd_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace eye_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::eye_msgs::EyeCmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::eye_msgs::EyeCmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::eye_msgs::EyeCmd_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::eye_msgs::EyeCmd_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::eye_msgs::EyeCmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::eye_msgs::EyeCmd_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::eye_msgs::EyeCmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b7afd2407918ee30626ee4948899aad8";
  }

  static const char* value(const ::eye_msgs::EyeCmd_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb7afd2407918ee30ULL;
  static const uint64_t static_value2 = 0x626ee4948899aad8ULL;
};

template<class ContainerAllocator>
struct DataType< ::eye_msgs::EyeCmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eye_msgs/EyeCmd";
  }

  static const char* value(const ::eye_msgs::EyeCmd_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::eye_msgs::EyeCmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"\n"
"#动作执行id,增加含义：时间+序号\n"
"uint64 action_id\n"
"\n"
"# 人脸录入\n"
"uint32 EYE_FACE_RECORD          = 5\n"
"uint32 EYE_BODY_RECORD          = 6        \n"
"\n"
"# 欢迎模式\n"
"uint32 EYE_WELCOME_DEMO         = 61\n"
"# 回大厅找人\n"
"uint32 EYE_LOBBY_DEMO           = 62\n"
"\n"
"# 任务取消\n"
"uint32 EYE_CANCEL               = 100\n"
"\n"
"# 类型\n"
"uint32 eye_kind\n"
"\n"
"# 人的名字\n"
"string human_name\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::eye_msgs::EyeCmd_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::eye_msgs::EyeCmd_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.action_id);
      stream.next(m.eye_kind);
      stream.next(m.human_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EyeCmd_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::eye_msgs::EyeCmd_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::eye_msgs::EyeCmd_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "action_id: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.action_id);
    s << indent << "eye_kind: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.eye_kind);
    s << indent << "human_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.human_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EYE_MSGS_MESSAGE_EYECMD_H
