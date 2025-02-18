// Generated by gencpp from file ros_interface/Face.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACE_MESSAGE_FACE_H
#define ROS_INTERFACE_MESSAGE_FACE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ros_interface/BBox2D.h>
#include <ros_interface/BBox2D.h>
#include <ros_interface/Point3D.h>
#include <sensor_msgs/Image.h>

namespace ros_interface
{
template <class ContainerAllocator>
struct Face_
{
  typedef Face_<ContainerAllocator> Type;

  Face_()
    : header()
    , id(0)
    , name()
    , emotion_type(0)
    , type(0)
    , confidence(0.0)
    , face_box()
    , body_box()
    , center_point_abs()
    , image()  {
    }
  Face_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , id(0)
    , name(_alloc)
    , emotion_type(0)
    , type(0)
    , confidence(0.0)
    , face_box(_alloc)
    , body_box(_alloc)
    , center_point_abs(_alloc)
    , image(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _id_type;
  _id_type id;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _name_type;
  _name_type name;

   typedef int32_t _emotion_type_type;
  _emotion_type_type emotion_type;

   typedef int32_t _type_type;
  _type_type type;

   typedef float _confidence_type;
  _confidence_type confidence;

   typedef  ::ros_interface::BBox2D_<ContainerAllocator>  _face_box_type;
  _face_box_type face_box;

   typedef  ::ros_interface::BBox2D_<ContainerAllocator>  _body_box_type;
  _body_box_type body_box;

   typedef  ::ros_interface::Point3D_<ContainerAllocator>  _center_point_abs_type;
  _center_point_abs_type center_point_abs;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _image_type;
  _image_type image;





  typedef boost::shared_ptr< ::ros_interface::Face_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interface::Face_<ContainerAllocator> const> ConstPtr;

}; // struct Face_

typedef ::ros_interface::Face_<std::allocator<void> > Face;

typedef boost::shared_ptr< ::ros_interface::Face > FacePtr;
typedef boost::shared_ptr< ::ros_interface::Face const> FaceConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interface::Face_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interface::Face_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interface::Face_<ContainerAllocator1> & lhs, const ::ros_interface::Face_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.id == rhs.id &&
    lhs.name == rhs.name &&
    lhs.emotion_type == rhs.emotion_type &&
    lhs.type == rhs.type &&
    lhs.confidence == rhs.confidence &&
    lhs.face_box == rhs.face_box &&
    lhs.body_box == rhs.body_box &&
    lhs.center_point_abs == rhs.center_point_abs &&
    lhs.image == rhs.image;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interface::Face_<ContainerAllocator1> & lhs, const ::ros_interface::Face_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Face_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interface::Face_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Face_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interface::Face_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Face_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interface::Face_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interface::Face_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0d64c2d16db71623f9aa8dc2f423d616";
  }

  static const char* value(const ::ros_interface::Face_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0d64c2d16db71623ULL;
  static const uint64_t static_value2 = 0xf9aa8dc2f423d616ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interface::Face_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interface/Face";
  }

  static const char* value(const ::ros_interface::Face_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interface::Face_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header   header     #  \n"
"uint32   id     # #面容ID\n"
"string   name     # #面容名称\n"
"int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤\n"
"int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户\n"
"float32   confidence     # #人脸检测置信度\n"
"BBox2D   face_box     # # 人脸图像框\n"
"BBox2D   body_box     # # 人体图像框\n"
"Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置\n"
"sensor_msgs/Image image\n"
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
"MSG: ros_interface/BBox2D\n"
"int16   xmin     # # 图像框左上角的x坐标\n"
"int16   ymin     # # 图像框左上角的y坐标\n"
"int16   xmax     # # 图像框右下角的x坐标\n"
"int16   ymax     # # 图像框右下角的y坐标\n"
"\n"
"================================================================================\n"
"MSG: ros_interface/Point3D\n"
"float32   x     #  \n"
"float32   y     #  \n"
"float32   z     #  \n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/Image\n"
"# This message contains an uncompressed image\n"
"# (0, 0) is at top-left corner of image\n"
"#\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"                     # If the frame_id here and the frame_id of the CameraInfo\n"
"                     # message associated with the image conflict\n"
"                     # the behavior is undefined\n"
"\n"
"uint32 height         # image height, that is, number of rows\n"
"uint32 width          # image width, that is, number of columns\n"
"\n"
"# The legal values for encoding are in file src/image_encodings.cpp\n"
"# If you want to standardize a new string format, join\n"
"# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n"
"\n"
"string encoding       # Encoding of pixels -- channel meaning, ordering, size\n"
"                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n"
"\n"
"uint8 is_bigendian    # is this data bigendian?\n"
"uint32 step           # Full row length in bytes\n"
"uint8[] data          # actual matrix data, size is (step * rows)\n"
;
  }

  static const char* value(const ::ros_interface::Face_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interface::Face_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.id);
      stream.next(m.name);
      stream.next(m.emotion_type);
      stream.next(m.type);
      stream.next(m.confidence);
      stream.next(m.face_box);
      stream.next(m.body_box);
      stream.next(m.center_point_abs);
      stream.next(m.image);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Face_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interface::Face_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interface::Face_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "id: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.id);
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.name);
    s << indent << "emotion_type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.emotion_type);
    s << indent << "type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.type);
    s << indent << "confidence: ";
    Printer<float>::stream(s, indent + "  ", v.confidence);
    s << indent << "face_box: ";
    s << std::endl;
    Printer< ::ros_interface::BBox2D_<ContainerAllocator> >::stream(s, indent + "  ", v.face_box);
    s << indent << "body_box: ";
    s << std::endl;
    Printer< ::ros_interface::BBox2D_<ContainerAllocator> >::stream(s, indent + "  ", v.body_box);
    s << indent << "center_point_abs: ";
    s << std::endl;
    Printer< ::ros_interface::Point3D_<ContainerAllocator> >::stream(s, indent + "  ", v.center_point_abs);
    s << indent << "image: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.image);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACE_MESSAGE_FACE_H
