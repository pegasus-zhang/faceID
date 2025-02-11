// Generated by gencpp from file perception_msgs/PercReq.msg
// DO NOT EDIT!


#ifndef PERCEPTION_MSGS_MESSAGE_PERCREQ_H
#define PERCEPTION_MSGS_MESSAGE_PERCREQ_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace perception_msgs
{
template <class ContainerAllocator>
struct PercReq_
{
  typedef PercReq_<ContainerAllocator> Type;

  PercReq_()
    : req_id(0)
    , perc_kind(0)
    , danger_info()  {
    }
  PercReq_(const ContainerAllocator& _alloc)
    : req_id(0)
    , perc_kind(0)
    , danger_info(_alloc)  {
  (void)_alloc;
    }



   typedef uint64_t _req_id_type;
  _req_id_type req_id;

   typedef uint32_t _perc_kind_type;
  _perc_kind_type perc_kind;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _danger_info_type;
  _danger_info_type danger_info;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(PERC_AUTO_CHARGING)
  #undef PERC_AUTO_CHARGING
#endif
#if defined(_WIN32) && defined(PERC_CHECK_ENV)
  #undef PERC_CHECK_ENV
#endif
#if defined(_WIN32) && defined(PERC_AUTO_MAPPING)
  #undef PERC_AUTO_MAPPING
#endif
#if defined(_WIN32) && defined(PERC_FOLLOW)
  #undef PERC_FOLLOW
#endif
#if defined(_WIN32) && defined(PERC_STRANGER_WELCOME)
  #undef PERC_STRANGER_WELCOME
#endif
#if defined(_WIN32) && defined(PERC_OWNER_WELCOME)
  #undef PERC_OWNER_WELCOME
#endif
#if defined(_WIN32) && defined(PERC_BEHAVIOR_INTERACTION)
  #undef PERC_BEHAVIOR_INTERACTION
#endif
#if defined(_WIN32) && defined(PERC_HANDSHAKE)
  #undef PERC_HANDSHAKE
#endif
#if defined(_WIN32) && defined(PERC_STANDBY_ACCOMPANY)
  #undef PERC_STANDBY_ACCOMPANY
#endif
#if defined(_WIN32) && defined(PERC_HAPPY_ACCOMPANY)
  #undef PERC_HAPPY_ACCOMPANY
#endif
#if defined(_WIN32) && defined(PERC_WORK_ACCOMPANY)
  #undef PERC_WORK_ACCOMPANY
#endif
#if defined(_WIN32) && defined(PERC_POSITIVE_ACCOMPANY)
  #undef PERC_POSITIVE_ACCOMPANY
#endif
#if defined(_WIN32) && defined(PERC_NEGATIVE_ACCOMPANY)
  #undef PERC_NEGATIVE_ACCOMPANY
#endif
#if defined(_WIN32) && defined(PERC_CHILD_WATCH)
  #undef PERC_CHILD_WATCH
#endif
#if defined(_WIN32) && defined(PERC_OLDER_WATCH)
  #undef PERC_OLDER_WATCH
#endif
#if defined(_WIN32) && defined(PERC_DANGER_REMINDER)
  #undef PERC_DANGER_REMINDER
#endif
#if defined(_WIN32) && defined(PERC_EVENT_REMINDER)
  #undef PERC_EVENT_REMINDER
#endif
#if defined(_WIN32) && defined(PERC_CATWALK_START)
  #undef PERC_CATWALK_START
#endif
#if defined(_WIN32) && defined(PERC_CATWALK_ACT)
  #undef PERC_CATWALK_ACT
#endif
#if defined(_WIN32) && defined(PERC_CATWALK_SHOW)
  #undef PERC_CATWALK_SHOW
#endif
#if defined(_WIN32) && defined(PERC_CATWALK_BACK)
  #undef PERC_CATWALK_BACK
#endif
#if defined(_WIN32) && defined(PERC_FREE_TIME)
  #undef PERC_FREE_TIME
#endif
#if defined(_WIN32) && defined(PERC_SOCIALIZE)
  #undef PERC_SOCIALIZE
#endif
#if defined(_WIN32) && defined(PERC_DANGER_INFO)
  #undef PERC_DANGER_INFO
#endif
#if defined(_WIN32) && defined(PERC_HAND_OK)
  #undef PERC_HAND_OK
#endif
#if defined(_WIN32) && defined(PERC_HAND_V)
  #undef PERC_HAND_V
#endif
#if defined(_WIN32) && defined(PERC_HAND_SHAKE)
  #undef PERC_HAND_SHAKE
#endif
#if defined(_WIN32) && defined(PERC_HAND_COME)
  #undef PERC_HAND_COME
#endif
#if defined(_WIN32) && defined(PERC_HAND_WAVE)
  #undef PERC_HAND_WAVE
#endif
#if defined(_WIN32) && defined(PERC_CANCEL)
  #undef PERC_CANCEL
#endif

  enum {
    PERC_AUTO_CHARGING = 20u,
    PERC_CHECK_ENV = 21u,
    PERC_AUTO_MAPPING = 22u,
    PERC_FOLLOW = 30u,
    PERC_STRANGER_WELCOME = 31u,
    PERC_OWNER_WELCOME = 32u,
    PERC_BEHAVIOR_INTERACTION = 33u,
    PERC_HANDSHAKE = 34u,
    PERC_STANDBY_ACCOMPANY = 35u,
    PERC_HAPPY_ACCOMPANY = 36u,
    PERC_WORK_ACCOMPANY = 37u,
    PERC_POSITIVE_ACCOMPANY = 38u,
    PERC_NEGATIVE_ACCOMPANY = 39u,
    PERC_CHILD_WATCH = 40u,
    PERC_OLDER_WATCH = 41u,
    PERC_DANGER_REMINDER = 42u,
    PERC_EVENT_REMINDER = 43u,
    PERC_CATWALK_START = 44u,
    PERC_CATWALK_ACT = 45u,
    PERC_CATWALK_SHOW = 46u,
    PERC_CATWALK_BACK = 47u,
    PERC_FREE_TIME = 50u,
    PERC_SOCIALIZE = 51u,
    PERC_DANGER_INFO = 60u,
    PERC_HAND_OK = 70u,
    PERC_HAND_V = 71u,
    PERC_HAND_SHAKE = 72u,
    PERC_HAND_COME = 73u,
    PERC_HAND_WAVE = 74u,
    PERC_CANCEL = 100u,
  };


  typedef boost::shared_ptr< ::perception_msgs::PercReq_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::perception_msgs::PercReq_<ContainerAllocator> const> ConstPtr;

}; // struct PercReq_

typedef ::perception_msgs::PercReq_<std::allocator<void> > PercReq;

typedef boost::shared_ptr< ::perception_msgs::PercReq > PercReqPtr;
typedef boost::shared_ptr< ::perception_msgs::PercReq const> PercReqConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::perception_msgs::PercReq_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::perception_msgs::PercReq_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::perception_msgs::PercReq_<ContainerAllocator1> & lhs, const ::perception_msgs::PercReq_<ContainerAllocator2> & rhs)
{
  return lhs.req_id == rhs.req_id &&
    lhs.perc_kind == rhs.perc_kind &&
    lhs.danger_info == rhs.danger_info;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::perception_msgs::PercReq_<ContainerAllocator1> & lhs, const ::perception_msgs::PercReq_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace perception_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::perception_msgs::PercReq_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::perception_msgs::PercReq_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::perception_msgs::PercReq_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::perception_msgs::PercReq_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::perception_msgs::PercReq_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::perception_msgs::PercReq_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::perception_msgs::PercReq_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2b66ac864838d8385327b5e39c1efa29";
  }

  static const char* value(const ::perception_msgs::PercReq_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2b66ac864838d838ULL;
  static const uint64_t static_value2 = 0x5327b5e39c1efa29ULL;
};

template<class ContainerAllocator>
struct DataType< ::perception_msgs::PercReq_<ContainerAllocator> >
{
  static const char* value()
  {
    return "perception_msgs/PercReq";
  }

  static const char* value(const ::perception_msgs::PercReq_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::perception_msgs::PercReq_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"# 动作执行id,增加含义：时间+序号 \n"
"uint64 req_id\n"
"\n"
"# Perceive Kind\n"
"\n"
"# 自动充电\n"
"uint32 PERC_AUTO_CHARGING        = 20\n"
"# 环境查看\n"
"uint32 PERC_CHECK_ENV            = 21\n"
"# 自动建图\n"
"uint32 PERC_AUTO_MAPPING         = 22\n"
"\n"
"# 跟随模式\n"
"uint32 PERC_FOLLOW               = 30\n"
"# 陌生人迎接\n"
"uint32 PERC_STRANGER_WELCOME     = 31\n"
"# 主人迎接\n"
"uint32 PERC_OWNER_WELCOME        = 32\n"
"# 行为互动\n"
"uint32 PERC_BEHAVIOR_INTERACTION = 33\n"
"# 握手动作\n"
"uint32 PERC_HANDSHAKE            = 34\n"
"\n"
"# 待机陪伴\n"
"uint32 PERC_STANDBY_ACCOMPANY    = 35\n"
"# 娱乐陪伴\n"
"uint32 PERC_HAPPY_ACCOMPANY      = 36\n"
"# 工作陪伴\n"
"uint32 PERC_WORK_ACCOMPANY       = 37\n"
"# 积极陪伴\n"
"uint32 PERC_POSITIVE_ACCOMPANY   = 38\n"
"# 消极陪伴\n"
"uint32 PERC_NEGATIVE_ACCOMPANY   = 39\n"
"\n"
"# 小孩看护\n"
"uint32 PERC_CHILD_WATCH          = 40\n"
"# 老人看护\n"
"uint32 PERC_OLDER_WATCH          = 41\n"
"# 危险提醒\n"
"uint32 PERC_DANGER_REMINDER      = 42\n"
"# 事件提醒\n"
"uint32 PERC_EVENT_REMINDER       = 43\n"
"# 开始走秀（语言下方，不需要感知）\n"
"uint32 PERC_CATWALK_START        = 44\n"
"# 走秀互动\n"
"uint32 PERC_CATWALK_ACT          = 45\n"
"# 走秀展示\n"
"uint32 PERC_CATWALK_SHOW         = 46\n"
"# 走秀返回\n"
"uint32 PERC_CATWALK_BACK         = 47\n"
"\n"
"# 自由活动\n"
"uint32 PERC_FREE_TIME            = 50\n"
"# 社交模式\n"
"uint32 PERC_SOCIALIZE            = 51\n"
"\n"
"# 上报危险信息（不需要请求）\n"
"uint32 PERC_DANGER_INFO          = 60\n"
"\n"
"uint32 PERC_HAND_OK              = 70\n"
"uint32 PERC_HAND_V               = 71\n"
"uint32 PERC_HAND_SHAKE           = 72\n"
"uint32 PERC_HAND_COME            = 73\n"
"uint32 PERC_HAND_WAVE            = 74\n"
"\n"
"# 任务取消（不需要请求）\n"
"uint32 PERC_CANCEL               = 100\n"
"\n"
"# 感知类型\n"
"uint32 perc_kind\n"
"\n"
"# 危险信息\n"
"string danger_info\n"
;
  }

  static const char* value(const ::perception_msgs::PercReq_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::perception_msgs::PercReq_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.req_id);
      stream.next(m.perc_kind);
      stream.next(m.danger_info);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PercReq_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::perception_msgs::PercReq_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::perception_msgs::PercReq_<ContainerAllocator>& v)
  {
    s << indent << "req_id: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.req_id);
    s << indent << "perc_kind: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.perc_kind);
    s << indent << "danger_info: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.danger_info);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PERCEPTION_MSGS_MESSAGE_PERCREQ_H
