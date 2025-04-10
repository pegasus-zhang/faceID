// Generated by gencpp from file ros_interface/VIOOdom.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_VIOODOM_H
#define ROS_INTERFACE_MESSAGE_VIOODOM_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ros_interface/PointENU.h>
#include <ros_interface/Quaternion.h>
#include <ros_interface/Point3D.h>
#include <ros_interface/Point3D.h>

namespace ros_interface
{
template <class ContainerAllocator>
struct VIOOdom_
{
  typedef VIOOdom_<ContainerAllocator> Type;

  VIOOdom_()
    : header()
    , position()
    , orientation()
    , pitch(0.0)
    , roll(0.0)
    , heading(0.0)
    , position_std_dev()
    , orientation_std_dev()  {
    }
  VIOOdom_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , position(_alloc)
    , orientation(_alloc)
    , pitch(0.0)
    , roll(0.0)
    , heading(0.0)
    , position_std_dev(_alloc)
    , orientation_std_dev(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::ros_interface::PointENU_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef  ::ros_interface::Quaternion_<ContainerAllocator>  _orientation_type;
  _orientation_type orientation;

   typedef float _pitch_type;
  _pitch_type pitch;

   typedef float _roll_type;
  _roll_type roll;

   typedef float _heading_type;
  _heading_type heading;

   typedef  ::ros_interface::Point3D_<ContainerAllocator>  _position_std_dev_type;
  _position_std_dev_type position_std_dev;

   typedef  ::ros_interface::Point3D_<ContainerAllocator>  _orientation_std_dev_type;
  _orientation_std_dev_type orientation_std_dev;





  typedef boost::shared_ptr< ::ros_interface::VIOOdom_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::VIOOdom_<ContainerAllocator> const> ConstPtr;

}; // struct VIOOdom_

typedef ::ros_interface::VIOOdom_<std::allocator<void> > VIOOdom;

typedef boost::shared_ptr< ::ros_interface::VIOOdom > VIOOdomPtr;
typedef boost::shared_ptr< ::ros_interface::VIOOdom const> VIOOdomConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::VIOOdom_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::VIOOdom_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::VIOOdom_<ContainerAllocator1> & lhs, const ::ros_interface::VIOOdom_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.position == rhs.position &&
    lhs.orientation == rhs.orientation &&
    lhs.pitch == rhs.pitch &&
    lhs.roll == rhs.roll &&
    lhs.heading == rhs.heading &&
    lhs.position_std_dev == rhs.position_std_dev &&
    lhs.orientation_std_dev == rhs.orientation_std_dev;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::VIOOdom_<ContainerAllocator1> & lhs, const ::ros_interface::VIOOdom_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::VIOOdom_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::VIOOdom_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::VIOOdom_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::VIOOdom_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::VIOOdom_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::VIOOdom_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::VIOOdom_<ContainerAllocator> >
{
  static const char* value()
  {
    return "26bbbc0f0fc437f554ced320e72f76c4";
  }

  static const char* value(const ::ros_interface::VIOOdom_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x26bbbc0f0fc437f5ULL;
  static const uint64_t static_value2 = 0x54ced320e72f76c4ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::VIOOdom_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/VIOOdom";
  }

  static const char* value(const ::ros_interface::VIOOdom_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::VIOOdom_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header   header     #  \n"
"PointENU   position     # # xxx坐标系下相对于原点的xyz\n"
"Quaternion   orientation     # # 姿态四元数\n"
"float32   pitch     # # 姿态角(单位弧度，满足右手定则)\n"
"float32   roll     #  \n"
"float32   heading     #  \n"
"Point3D   position_std_dev     # # 位置标准差\n"
"Point3D   orientation_std_dev     # # 姿态标准差\n"
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
"MSG: ros_interface/PointENU\n"
"float32   x     #  \n"
"float32   y     #  \n"
"float32   z     #  \n"
"\n"
"================================================================================\n"
"MSG: ros_interface/Quaternion\n"
"float32   qx     #  \n"
"float32   qy     #  \n"
"float32   qz     #  \n"
"float32   qw     #  \n"
"\n"
"================================================================================\n"
"MSG: ros_interface/Point3D\n"
"float32   x     #  \n"
"float32   y     #  \n"
"float32   z     #  \n"
;
  }

  static const char* value(const ::ros_interface::VIOOdom_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::VIOOdom_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.position);
      stream.next(m.orientation);
      stream.next(m.pitch);
      stream.next(m.roll);
      stream.next(m.heading);
      stream.next(m.position_std_dev);
      stream.next(m.orientation_std_dev);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VIOOdom_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::VIOOdom_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::VIOOdom_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::ros_interface::PointENU_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "orientation: ";
    s << std::endl;
    Printer< ::ros_interface::Quaternion_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation);
    s << indent << "pitch: ";
    Printer<float>::stream(s, indent + "  ", v.pitch);
    s << indent << "roll: ";
    Printer<float>::stream(s, indent + "  ", v.roll);
    s << indent << "heading: ";
    Printer<float>::stream(s, indent + "  ", v.heading);
    s << indent << "position_std_dev: ";
    s << std::endl;
    Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "  ", v.position_std_dev);
    s << indent << "orientation_std_dev: ";
    s << std::endl;
    Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation_std_dev);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_VIOODOM_H
