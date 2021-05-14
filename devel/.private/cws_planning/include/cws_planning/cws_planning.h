// Generated by gencpp from file cws_planning/cws_planning.msg
// DO NOT EDIT!


#ifndef CWS_PLANNING_MESSAGE_CWS_PLANNING_H
#define CWS_PLANNING_MESSAGE_CWS_PLANNING_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace cws_planning
{
template <class ContainerAllocator>
struct cws_planning_
{
  typedef cws_planning_<ContainerAllocator> Type;

  cws_planning_()
    : hello(0)  {
    }
  cws_planning_(const ContainerAllocator& _alloc)
    : hello(0)  {
  (void)_alloc;
    }



   typedef int32_t _hello_type;
  _hello_type hello;





  typedef boost::shared_ptr< ::cws_planning::cws_planning_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cws_planning::cws_planning_<ContainerAllocator> const> ConstPtr;

}; // struct cws_planning_

typedef ::cws_planning::cws_planning_<std::allocator<void> > cws_planning;

typedef boost::shared_ptr< ::cws_planning::cws_planning > cws_planningPtr;
typedef boost::shared_ptr< ::cws_planning::cws_planning const> cws_planningConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cws_planning::cws_planning_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cws_planning::cws_planning_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cws_planning::cws_planning_<ContainerAllocator1> & lhs, const ::cws_planning::cws_planning_<ContainerAllocator2> & rhs)
{
  return lhs.hello == rhs.hello;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cws_planning::cws_planning_<ContainerAllocator1> & lhs, const ::cws_planning::cws_planning_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cws_planning

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cws_planning::cws_planning_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cws_planning::cws_planning_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cws_planning::cws_planning_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cws_planning::cws_planning_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cws_planning::cws_planning_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cws_planning::cws_planning_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cws_planning::cws_planning_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9d9ca1866b512db488ffb6bed585ed1b";
  }

  static const char* value(const ::cws_planning::cws_planning_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9d9ca1866b512db4ULL;
  static const uint64_t static_value2 = 0x88ffb6bed585ed1bULL;
};

template<class ContainerAllocator>
struct DataType< ::cws_planning::cws_planning_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cws_planning/cws_planning";
  }

  static const char* value(const ::cws_planning::cws_planning_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cws_planning::cws_planning_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This is needed just to make rosbridge happy, else it wont find TrafficLight.msg (idk why???)\n"
"int32 hello\n"
;
  }

  static const char* value(const ::cws_planning::cws_planning_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cws_planning::cws_planning_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.hello);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct cws_planning_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cws_planning::cws_planning_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cws_planning::cws_planning_<ContainerAllocator>& v)
  {
    s << indent << "hello: ";
    Printer<int32_t>::stream(s, indent + "  ", v.hello);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CWS_PLANNING_MESSAGE_CWS_PLANNING_H