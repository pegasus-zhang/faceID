// Generated by gencpp from file ros_interface/BodyList.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_BODYLIST_H
#define ROS_INTERFACE_MESSAGE_BODYLIST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ros_interface/Body.h>

namespace ros_interface
{
template <class ContainerAllocator>
struct BodyList_
{
  typedef BodyList_<ContainerAllocator> Type;

  BodyList_()
    : header()
    , body()  {
    }
  BodyList_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , body(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::ros_interface::Body_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::ros_interface::Body_<ContainerAllocator> >> _body_type;
  _body_type body;





  typedef boost::shared_ptr< ::ros_interface::BodyList_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::BodyList_<ContainerAllocator> const> ConstPtr;

}; // struct BodyList_

typedef ::ros_interface::BodyList_<std::allocator<void> > BodyList;

typedef boost::shared_ptr< ::ros_interface::BodyList > BodyListPtr;
typedef boost::shared_ptr< ::ros_interface::BodyList const> BodyListConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::BodyList_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::BodyList_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::BodyList_<ContainerAllocator1> & lhs, const ::ros_interface::BodyList_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.body == rhs.body;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::BodyList_<ContainerAllocator1> & lhs, const ::ros_interface::BodyList_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::BodyList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::BodyList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::BodyList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::BodyList_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::BodyList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::BodyList_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::BodyList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "22fef3e180a31acf726a36da08fe1ec9";
  }

  static const char* value(const ::ros_interface::BodyList_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x22fef3e180a31acfULL;
  static const uint64_t static_value2 = 0x726a36da08fe1ec9ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::BodyList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/BodyList";
  }

  static const char* value(const ::ros_interface::BodyList_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::BodyList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header   header     #  \n"
"Body[]  body   #感知的所有人体信息\n"
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
"\n"
"================================================================================\n"
"MSG: ros_interface/Body\n"
"Header   header     #  \n"
"uint32   id     # #人体ID\n"
"int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定用户，TYPE=3//其他用户 \n"
"int32   sub_type     # #人物子类别，SUB_TYPE=0//未识别，SUB_TYPE=1//成年人，SUB_TYPE=2//儿童，SUB_TYPE=3//老人\n"
"float32   confidence     # #置信度\n"
"int32   posture_type     # #人体姿态类型，POSTURE_TYPE=0//未知姿态，POSTURE_TYPE=1//站，POSTURE_TYPE=2//坐，POSTURE_TYPE=3//躺\n"
"Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置\n"
"float32   theta     # #在世界坐标系下人体的朝向\n"
"float32   length     # #人体长度\n"
"float32   width     # #人体宽度\n"
"float32   height     # #人体高度\n"
"Point3D[] polygon_point_abs # # 世界坐标系下人体3D框点坐标\n"
"Point3D   velocity     # #在世界坐标系下的人体速度\n"
"\n"
"================================================================================\n"
"MSG: ros_interface/Point3D\n"
"float32   x     #  \n"
"float32   y     #  \n"
"float32   z     #  \n"
;
  }

  static const char* value(const ::ros_interface::BodyList_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::BodyList_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.body);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BodyList_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::BodyList_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::BodyList_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "body[]" << std::endl;
    for (size_t i = 0; i < v.body.size(); ++i)
    {
      s << indent << "  body[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ros_interface::Body_<ContainerAllocator> >::stream(s, indent + "    ", v.body[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_BODYLIST_H
