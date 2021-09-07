// Generated by gencpp from file jsk_gui_msgs/MagneticField.msg
// DO NOT EDIT!


#ifndef JSK_GUI_MSGS_MESSAGE_MAGNETICFIELD_H
#define JSK_GUI_MSGS_MESSAGE_MAGNETICFIELD_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Vector3.h>

namespace jsk_gui_msgs
{
template <class ContainerAllocator>
struct MagneticField_
{
  typedef MagneticField_<ContainerAllocator> Type;

  MagneticField_()
    : magneticfield()  {
    }
  MagneticField_(const ContainerAllocator& _alloc)
    : magneticfield(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _magneticfield_type;
  _magneticfield_type magneticfield;





  typedef boost::shared_ptr< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> const> ConstPtr;

}; // struct MagneticField_

typedef ::jsk_gui_msgs::MagneticField_<std::allocator<void> > MagneticField;

typedef boost::shared_ptr< ::jsk_gui_msgs::MagneticField > MagneticFieldPtr;
typedef boost::shared_ptr< ::jsk_gui_msgs::MagneticField const> MagneticFieldConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::jsk_gui_msgs::MagneticField_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::jsk_gui_msgs::MagneticField_<ContainerAllocator1> & lhs, const ::jsk_gui_msgs::MagneticField_<ContainerAllocator2> & rhs)
{
  return lhs.magneticfield == rhs.magneticfield;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::jsk_gui_msgs::MagneticField_<ContainerAllocator1> & lhs, const ::jsk_gui_msgs::MagneticField_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace jsk_gui_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a924df7c82a527d1b76508ed8354604b";
  }

  static const char* value(const ::jsk_gui_msgs::MagneticField_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa924df7c82a527d1ULL;
  static const uint64_t static_value2 = 0xb76508ed8354604bULL;
};

template<class ContainerAllocator>
struct DataType< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
{
  static const char* value()
  {
    return "jsk_gui_msgs/MagneticField";
  }

  static const char* value(const ::jsk_gui_msgs::MagneticField_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Vector3 magneticfield\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::jsk_gui_msgs::MagneticField_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.magneticfield);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MagneticField_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::jsk_gui_msgs::MagneticField_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::jsk_gui_msgs::MagneticField_<ContainerAllocator>& v)
  {
    s << indent << "magneticfield: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.magneticfield);
  }
};

} // namespace message_operations
} // namespace ros

#endif // JSK_GUI_MSGS_MESSAGE_MAGNETICFIELD_H
