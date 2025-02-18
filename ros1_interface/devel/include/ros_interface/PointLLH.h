// Generated by gencpp from file ros_interface/PointLLH.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_POINTLLH_H
#define ROS_INTERFACE_MESSAGE_POINTLLH_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ros_interface
{
template <class ContainerAllocator>
struct PointLLH_
{
  typedef PointLLH_<ContainerAllocator> Type;

  PointLLH_()
    : lon(0.0)
    , lat(0.0)
    , height(0.0)  {
    }
  PointLLH_(const ContainerAllocator& _alloc)
    : lon(0.0)
    , lat(0.0)
    , height(0.0)  {
  (void)_alloc;
    }



   typedef float _lon_type;
  _lon_type lon;

   typedef float _lat_type;
  _lat_type lat;

   typedef float _height_type;
  _height_type height;





  typedef boost::shared_ptr< ::ros_interface::PointLLH_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::PointLLH_<ContainerAllocator> const> ConstPtr;

}; // struct PointLLH_

typedef ::ros_interface::PointLLH_<std::allocator<void> > PointLLH;

typedef boost::shared_ptr< ::ros_interface::PointLLH > PointLLHPtr;
typedef boost::shared_ptr< ::ros_interface::PointLLH const> PointLLHConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::PointLLH_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::PointLLH_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::PointLLH_<ContainerAllocator1> & lhs, const ::ros_interface::PointLLH_<ContainerAllocator2> & rhs)
{
  return lhs.lon == rhs.lon &&
    lhs.lat == rhs.lat &&
    lhs.height == rhs.height;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::PointLLH_<ContainerAllocator1> & lhs, const ::ros_interface::PointLLH_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::PointLLH_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::PointLLH_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::PointLLH_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::PointLLH_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::PointLLH_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::PointLLH_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::PointLLH_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c3958392cb26a0a2103a249fb404dc1d";
  }

  static const char* value(const ::ros_interface::PointLLH_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc3958392cb26a0a2ULL;
  static const uint64_t static_value2 = 0x103a249fb404dc1dULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::PointLLH_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/PointLLH";
  }

  static const char* value(const ::ros_interface::PointLLH_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::PointLLH_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32   lon     # # Longitude in degrees, ranging from -180 to 180.\n"
"float32   lat     # # Latitude in degrees, ranging from -90 to 90.\n"
"float32   height     # # WGS-84 ellipsoid height in meters.\n"
;
  }

  static const char* value(const ::ros_interface::PointLLH_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::PointLLH_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.lon);
      stream.next(m.lat);
      stream.next(m.height);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PointLLH_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::PointLLH_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::PointLLH_<ContainerAllocator>& v)
  {
    s << indent << "lon: ";
    Printer<float>::stream(s, indent + "  ", v.lon);
    s << indent << "lat: ";
    Printer<float>::stream(s, indent + "  ", v.lat);
    s << indent << "height: ";
    Printer<float>::stream(s, indent + "  ", v.height);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_POINTLLH_H
