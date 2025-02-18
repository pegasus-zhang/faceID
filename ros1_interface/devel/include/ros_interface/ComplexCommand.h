// Generated by gencpp from file ros_interface/ComplexCommand.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_COMPLEXCOMMAND_H
#define ROS_INTERFACE_MESSAGE_COMPLEXCOMMAND_H


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
struct ComplexCommand_
{
  typedef ComplexCommand_<ContainerAllocator> Type;

  ComplexCommand_()
    : type_id(0)
    , unit_id(0)
    , data_a(0.0)
    , data_b(0.0)  {
    }
  ComplexCommand_(const ContainerAllocator& _alloc)
    : type_id(0)
    , unit_id(0)
    , data_a(0.0)
    , data_b(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _type_id_type;
  _type_id_type type_id;

   typedef uint8_t _unit_id_type;
  _unit_id_type unit_id;

   typedef float _data_a_type;
  _data_a_type data_a;

   typedef float _data_b_type;
  _data_b_type data_b;





  typedef boost::shared_ptr< ::ros_interface::ComplexCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::ComplexCommand_<ContainerAllocator> const> ConstPtr;

}; // struct ComplexCommand_

typedef ::ros_interface::ComplexCommand_<std::allocator<void> > ComplexCommand;

typedef boost::shared_ptr< ::ros_interface::ComplexCommand > ComplexCommandPtr;
typedef boost::shared_ptr< ::ros_interface::ComplexCommand const> ComplexCommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::ComplexCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::ComplexCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::ComplexCommand_<ContainerAllocator1> & lhs, const ::ros_interface::ComplexCommand_<ContainerAllocator2> & rhs)
{
  return lhs.type_id == rhs.type_id &&
    lhs.unit_id == rhs.unit_id &&
    lhs.data_a == rhs.data_a &&
    lhs.data_b == rhs.data_b;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::ComplexCommand_<ContainerAllocator1> & lhs, const ::ros_interface::ComplexCommand_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::ComplexCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::ComplexCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::ComplexCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::ComplexCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::ComplexCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::ComplexCommand_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::ComplexCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "06403e95fe785afd6352f59c7b849afb";
  }

  static const char* value(const ::ros_interface::ComplexCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x06403e95fe785afdULL;
  static const uint64_t static_value2 = 0x6352f59c7b849afbULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::ComplexCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/ComplexCommand";
  }

  static const char* value(const ::ros_interface::ComplexCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::ComplexCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8   type_id     #  \n"
"uint8   unit_id     #  \n"
"float32   data_a     #  \n"
"float32   data_b     #  \n"
;
  }

  static const char* value(const ::ros_interface::ComplexCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::ComplexCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.type_id);
      stream.next(m.unit_id);
      stream.next(m.data_a);
      stream.next(m.data_b);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ComplexCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::ComplexCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::ComplexCommand_<ContainerAllocator>& v)
  {
    s << indent << "type_id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.type_id);
    s << indent << "unit_id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.unit_id);
    s << indent << "data_a: ";
    Printer<float>::stream(s, indent + "  ", v.data_a);
    s << indent << "data_b: ";
    Printer<float>::stream(s, indent + "  ", v.data_b);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_COMPLEXCOMMAND_H
