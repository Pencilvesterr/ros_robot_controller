// Generated by gencpp from file hrca_decision/ResetRobotRequest.msg
// DO NOT EDIT!


#ifndef HRCA_DECISION_MESSAGE_RESETROBOTREQUEST_H
#define HRCA_DECISION_MESSAGE_RESETROBOTREQUEST_H


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
struct ResetRobotRequest_
{
  typedef ResetRobotRequest_<ContainerAllocator> Type;

  ResetRobotRequest_()
    {
    }
  ResetRobotRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ResetRobotRequest_

typedef ::hrca_decision::ResetRobotRequest_<std::allocator<void> > ResetRobotRequest;

typedef boost::shared_ptr< ::hrca_decision::ResetRobotRequest > ResetRobotRequestPtr;
typedef boost::shared_ptr< ::hrca_decision::ResetRobotRequest const> ResetRobotRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hrca_decision::ResetRobotRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace hrca_decision

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::hrca_decision::ResetRobotRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hrca_decision/ResetRobotRequest";
  }

  static const char* value(const ::hrca_decision::ResetRobotRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::hrca_decision::ResetRobotRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ResetRobotRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hrca_decision::ResetRobotRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::hrca_decision::ResetRobotRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // HRCA_DECISION_MESSAGE_RESETROBOTREQUEST_H
