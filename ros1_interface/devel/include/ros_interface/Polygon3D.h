// Generated by gencpp from file ros_interface/Polygon3D.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_POLYGON3D_H
#define ROS_INTERFACE_MESSAGE_POLYGON3D_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <ros_interface/Point3D.h>

namespace ros_interface
{
template <class ContainerAllocator>
struct Polygon3D_
{
  typedef Polygon3D_<ContainerAllocator> Type;

  Polygon3D_()
    : coordinate_system(0)
    , points()  {
    }
  Polygon3D_(const ContainerAllocator& _alloc)
    : coordinate_system(0)
    , points(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _coordinate_system_type;
  _coordinate_system_type coordinate_system;

   typedef std::vector< ::ros_interface::Point3D_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::ros_interface::Point3D_<ContainerAllocator> >> _points_type;
  _points_type points;





  typedef boost::shared_ptr< ::ros_interface::Polygon3D_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::Polygon3D_<ContainerAllocator> const> ConstPtr;

}; // struct Polygon3D_

typedef ::ros_interface::Polygon3D_<std::allocator<void> > Polygon3D;

typedef boost::shared_ptr< ::ros_interface::Polygon3D > Polygon3DPtr;
typedef boost::shared_ptr< ::ros_interface::Polygon3D const> Polygon3DConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::Polygon3D_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::Polygon3D_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::Polygon3D_<ContainerAllocator1> & lhs, const ::ros_interface::Polygon3D_<ContainerAllocator2> & rhs)
{
  return lhs.coordinate_system == rhs.coordinate_system &&
    lhs.points == rhs.points;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::Polygon3D_<ContainerAllocator1> & lhs, const ::ros_interface::Polygon3D_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Polygon3D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Polygon3D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Polygon3D_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Polygon3D_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Polygon3D_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Polygon3D_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::Polygon3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "badbfc2b6a0c2dc8f8c20c4bfe03c2ab";
  }

  static const char* value(const ::ros_interface::Polygon3D_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbadbfc2b6a0c2dc8ULL;
  static const uint64_t static_value2 = 0xf8c20c4bfe03c2abULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::Polygon3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/Polygon3D";
  }

  static const char* value(const ::ros_interface::Polygon3D_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::Polygon3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32   coordinate_system     # 坐标系\n"
"Point3D[] points # 三维点集\n"
"\n"
"================================================================================\n"
"MSG: ros_interface/Point3D\n"
"float32   x     #  \n"
"float32   y     #  \n"
"float32   z     #  \n"
;
  }

  static const char* value(const ::ros_interface::Polygon3D_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::Polygon3D_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.coordinate_system);
      stream.next(m.points);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Polygon3D_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::Polygon3D_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::Polygon3D_<ContainerAllocator>& v)
  {
    s << indent << "coordinate_system: ";
    Printer<int32_t>::stream(s, indent + "  ", v.coordinate_system);
    s << indent << "points[]" << std::endl;
    for (size_t i = 0; i < v.points.size(); ++i)
    {
      s << indent << "  points[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "    ", v.points[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_POLYGON3D_H
