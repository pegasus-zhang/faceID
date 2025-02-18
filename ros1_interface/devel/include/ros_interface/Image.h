// Generated by gencpp from file ros_interface/Image.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_IMAGE_H
#define ROS_INTERFACE_MESSAGE_IMAGE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace ros_interface
{
template <class ContainerAllocator>
struct Image_
{
  typedef Image_<ContainerAllocator> Type;

  Image_()
    : header()
    , height(0)
    , width(0)
    , encoding()
    , is_bigendian(false)
    , step(0)
    , data()  {
    }
  Image_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , height(0)
    , width(0)
    , encoding(_alloc)
    , is_bigendian(false)
    , step(0)
    , data(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _height_type;
  _height_type height;

   typedef uint32_t _width_type;
  _width_type width;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _encoding_type;
  _encoding_type encoding;

   typedef uint8_t _is_bigendian_type;
  _is_bigendian_type is_bigendian;

   typedef uint32_t _step_type;
  _step_type step;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::ros_interface::Image_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::Image_<ContainerAllocator> const> ConstPtr;

}; // struct Image_

typedef ::ros_interface::Image_<std::allocator<void> > Image;

typedef boost::shared_ptr< ::ros_interface::Image > ImagePtr;
typedef boost::shared_ptr< ::ros_interface::Image const> ImageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::Image_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::Image_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::Image_<ContainerAllocator1> & lhs, const ::ros_interface::Image_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.height == rhs.height &&
    lhs.width == rhs.width &&
    lhs.encoding == rhs.encoding &&
    lhs.is_bigendian == rhs.is_bigendian &&
    lhs.step == rhs.step &&
    lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::Image_<ContainerAllocator1> & lhs, const ::ros_interface::Image_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Image_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Image_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Image_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Image_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Image_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Image_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::Image_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d3d4cbcbc4b9ead08e6527196ed4660";
  }

  static const char* value(const ::ros_interface::Image_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d3d4cbcbc4b9eadULL;
  static const uint64_t static_value2 = 0x08e6527196ed4660ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::Image_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/Image";
  }

  static const char* value(const ::ros_interface::Image_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::Image_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header   header     #  \n"
"uint32   height     #  \n"
"uint32   width     #  \n"
"string   encoding     #  \n"
"bool   is_bigendian     # # Is this data bigendian?\n"
"uint32   step     # # Full row length in bytes\n"
"uint8[] data # # actual matrix data, size is (step * rows)\n"
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

  static const char* value(const ::ros_interface::Image_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::Image_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.height);
      stream.next(m.width);
      stream.next(m.encoding);
      stream.next(m.is_bigendian);
      stream.next(m.step);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Image_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::Image_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::Image_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "height: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.height);
    s << indent << "width: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.width);
    s << indent << "encoding: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.encoding);
    s << indent << "is_bigendian: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.is_bigendian);
    s << indent << "step: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.step);
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_IMAGE_H
