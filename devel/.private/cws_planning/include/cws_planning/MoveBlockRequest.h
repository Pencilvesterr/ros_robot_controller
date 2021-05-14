// Generated by gencpp from file cws_planning/MoveBlockRequest.msg
// DO NOT EDIT!


#ifndef CWS_PLANNING_MESSAGE_MOVEBLOCKREQUEST_H
#define CWS_PLANNING_MESSAGE_MOVEBLOCKREQUEST_H


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
struct MoveBlockRequest_
{
  typedef MoveBlockRequest_<ContainerAllocator> Type;

  MoveBlockRequest_()
    : block_number(0)
    , block_zone(0)  {
    }
  MoveBlockRequest_(const ContainerAllocator& _alloc)
    : block_number(0)
    , block_zone(0)  {
  (void)_alloc;
    }



   typedef int32_t _block_number_type;
  _block_number_type block_number;

   typedef int32_t _block_zone_type;
  _block_zone_type block_zone;





  typedef boost::shared_ptr< ::cws_planning::MoveBlockRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cws_planning::MoveBlockRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MoveBlockRequest_

typedef ::cws_planning::MoveBlockRequest_<std::allocator<void> > MoveBlockRequest;

typedef boost::shared_ptr< ::cws_planning::MoveBlockRequest > MoveBlockRequestPtr;
typedef boost::shared_ptr< ::cws_planning::MoveBlockRequest const> MoveBlockRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cws_planning::MoveBlockRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cws_planning::MoveBlockRequest_<ContainerAllocator1> & lhs, const ::cws_planning::MoveBlockRequest_<ContainerAllocator2> & rhs)
{
  return lhs.block_number == rhs.block_number &&
    lhs.block_zone == rhs.block_zone;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cws_planning::MoveBlockRequest_<ContainerAllocator1> & lhs, const ::cws_planning::MoveBlockRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cws_planning

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cws_planning::MoveBlockRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cws_planning::MoveBlockRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cws_planning::MoveBlockRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cd5be2e873780dd2607b31a5a728144a";
  }

  static const char* value(const ::cws_planning::MoveBlockRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcd5be2e873780dd2ULL;
  static const uint64_t static_value2 = 0x607b31a5a728144aULL;
};

template<class ContainerAllocator>
struct DataType< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cws_planning/MoveBlockRequest";
  }

  static const char* value(const ::cws_planning::MoveBlockRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"int32 block_number\n"
"int32 block_zone\n"
;
  }

  static const char* value(const ::cws_planning::MoveBlockRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.block_number);
      stream.next(m.block_zone);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveBlockRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cws_planning::MoveBlockRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cws_planning::MoveBlockRequest_<ContainerAllocator>& v)
  {
    s << indent << "block_number: ";
    Printer<int32_t>::stream(s, indent + "  ", v.block_number);
    s << indent << "block_zone: ";
    Printer<int32_t>::stream(s, indent + "  ", v.block_zone);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CWS_PLANNING_MESSAGE_MOVEBLOCKREQUEST_H