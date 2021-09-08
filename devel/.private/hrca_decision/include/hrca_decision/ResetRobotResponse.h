// Generated by gencpp from file hrca_decision/ResetRobotResponse.msg
// DO NOT EDIT!


#ifndef HRCA_DECISION_MESSAGE_RESETROBOTRESPONSE_H
#define HRCA_DECISION_MESSAGE_RESETROBOTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace hrca_decision
{
template <class ContainerAllocator>
struct ResetRobotResponse_
{
  typedef ResetRobotResponse_<ContainerAllocator> Type;

  ResetRobotResponse_()
    : success(false)  {
    }
  ResetRobotResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ResetRobotResponse_

typedef ::hrca_decision::ResetRobotResponse_<std::allocator<void> > ResetRobotResponse;

typedef boost::shared_ptr< ::hrca_decision::ResetRobotResponse > ResetRobotResponsePtr;
typedef boost::shared_ptr< ::hrca_decision::ResetRobotResponse const> ResetRobotResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hrca_decision::ResetRobotResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hrca_decision::ResetRobotResponse_<ContainerAllocator1> & lhs, const ::hrca_decision::ResetRobotResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hrca_decision::ResetRobotResponse_<ContainerAllocator1> & lhs, const ::hrca_decision::ResetRobotResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hrca_decision

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::hrca_decision::ResetRobotResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hrca_decision/ResetRobotResponse";
  }

  static const char* value(const ::hrca_decision::ResetRobotResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
"\n"
;
  }

  static const char* value(const ::hrca_decision::ResetRobotResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ResetRobotResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hrca_decision::ResetRobotResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hrca_decision::ResetRobotResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HRCA_DECISION_MESSAGE_RESETROBOTRESPONSE_H
