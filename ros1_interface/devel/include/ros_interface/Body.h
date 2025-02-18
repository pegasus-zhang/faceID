// Generated by gencpp from file ros_interface/Body.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_BODY_H
#define ROS_INTERFACE_MESSAGE_BODY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ros_interface/Point3D.h>
#include <ros_interface/Point3D.h>
#include <ros_interface/Point3D.h>

namespace ros_interface
{
template <class ContainerAllocator>
struct Body_
{
  typedef Body_<ContainerAllocator> Type;

  Body_()
    : header()
    , id(0)
    , type(0)
    , sub_type(0)
    , confidence(0.0)
    , posture_type(0)
    , center_point_abs()
    , theta(0.0)
    , length(0.0)
    , width(0.0)
    , height(0.0)
    , polygon_point_abs()
    , velocity()  {
    }
  Body_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , id(0)
    , type(0)
    , sub_type(0)
    , confidence(0.0)
    , posture_type(0)
    , center_point_abs(_alloc)
    , theta(0.0)
    , length(0.0)
    , width(0.0)
    , height(0.0)
    , polygon_point_abs(_alloc)
    , velocity(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _id_type;
  _id_type id;

   typedef int32_t _type_type;
  _type_type type;

   typedef int32_t _sub_type_type;
  _sub_type_type sub_type;

   typedef float _confidence_type;
  _confidence_type confidence;

   typedef int32_t _posture_type_type;
  _posture_type_type posture_type;

   typedef  ::ros_interface::Point3D_<ContainerAllocator>  _center_point_abs_type;
  _center_point_abs_type center_point_abs;

   typedef float _theta_type;
  _theta_type theta;

   typedef float _length_type;
  _length_type length;

   typedef float _width_type;
  _width_type width;

   typedef float _height_type;
  _height_type height;

   typedef std::vector< ::ros_interface::Point3D_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::ros_interface::Point3D_<ContainerAllocator> >> _polygon_point_abs_type;
  _polygon_point_abs_type polygon_point_abs;

   typedef  ::ros_interface::Point3D_<ContainerAllocator>  _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::ros_interface::Body_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::Body_<ContainerAllocator> const> ConstPtr;

}; // struct Body_

typedef ::ros_interface::Body_<std::allocator<void> > Body;

typedef boost::shared_ptr< ::ros_interface::Body > BodyPtr;
typedef boost::shared_ptr< ::ros_interface::Body const> BodyConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::Body_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::Body_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::Body_<ContainerAllocator1> & lhs, const ::ros_interface::Body_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.id == rhs.id &&
    lhs.type == rhs.type &&
    lhs.sub_type == rhs.sub_type &&
    lhs.confidence == rhs.confidence &&
    lhs.posture_type == rhs.posture_type &&
    lhs.center_point_abs == rhs.center_point_abs &&
    lhs.theta == rhs.theta &&
    lhs.length == rhs.length &&
    lhs.width == rhs.width &&
    lhs.height == rhs.height &&
    lhs.polygon_point_abs == rhs.polygon_point_abs &&
    lhs.velocity == rhs.velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::Body_<ContainerAllocator1> & lhs, const ::ros_interface::Body_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Body_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Body_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Body_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Body_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Body_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Body_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::Body_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b3816a053eac0ba3ff3d35c3b3a7032d";
  }

  static const char* value(const ::ros_interface::Body_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb3816a053eac0ba3ULL;
  static const uint64_t static_value2 = 0xff3d35c3b3a7032dULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::Body_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/Body";
  }

  static const char* value(const ::ros_interface::Body_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::Body_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header   header     #  \n"
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
"MSG: ros_interface/Point3D\n"
"float32   x     #  \n"
"float32   y     #  \n"
"float32   z     #  \n"
;
  }

  static const char* value(const ::ros_interface::Body_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::Body_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.id);
      stream.next(m.type);
      stream.next(m.sub_type);
      stream.next(m.confidence);
      stream.next(m.posture_type);
      stream.next(m.center_point_abs);
      stream.next(m.theta);
      stream.next(m.length);
      stream.next(m.width);
      stream.next(m.height);
      stream.next(m.polygon_point_abs);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Body_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::Body_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::Body_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "id: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.id);
    s << indent << "type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.type);
    s << indent << "sub_type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.sub_type);
    s << indent << "confidence: ";
    Printer<float>::stream(s, indent + "  ", v.confidence);
    s << indent << "posture_type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.posture_type);
    s << indent << "center_point_abs: ";
    s << std::endl;
    Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "  ", v.center_point_abs);
    s << indent << "theta: ";
    Printer<float>::stream(s, indent + "  ", v.theta);
    s << indent << "length: ";
    Printer<float>::stream(s, indent + "  ", v.length);
    s << indent << "width: ";
    Printer<float>::stream(s, indent + "  ", v.width);
    s << indent << "height: ";
    Printer<float>::stream(s, indent + "  ", v.height);
    s << indent << "polygon_point_abs[]" << std::endl;
    for (size_t i = 0; i < v.polygon_point_abs.size(); ++i)
    {
      s << indent << "  polygon_point_abs[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "    ", v.polygon_point_abs[i]);
    }
    s << indent << "velocity: ";
    s << std::endl;
    Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_BODY_H
