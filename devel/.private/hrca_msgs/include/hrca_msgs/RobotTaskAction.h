// Generated by gencpp from file hrca_msgs/RobotTaskAction.msg
// DO NOT EDIT!


#ifndef HRCA_MSGS_MESSAGE_ROBOTTASKACTION_H
#define HRCA_MSGS_MESSAGE_ROBOTTASKACTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <hrca_msgs/RobotTaskActionGoal.h>
#include <hrca_msgs/RobotTaskActionResult.h>
#include <hrca_msgs/RobotTaskActionFeedback.h>

namespace hrca_msgs
{
template <class ContainerAllocator>
struct RobotTaskAction_
{
  typedef RobotTaskAction_<ContainerAllocator> Type;

  RobotTaskAction_()
    : action_goal()
    , action_result()
    , action_feedback()  {
    }
  RobotTaskAction_(const ContainerAllocator& _alloc)
    : action_goal(_alloc)
    , action_result(_alloc)
    , action_feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::hrca_msgs::RobotTaskActionGoal_<ContainerAllocator>  _action_goal_type;
  _action_goal_type action_goal;

   typedef  ::hrca_msgs::RobotTaskActionResult_<ContainerAllocator>  _action_result_type;
  _action_result_type action_result;

   typedef  ::hrca_msgs::RobotTaskActionFeedback_<ContainerAllocator>  _action_feedback_type;
  _action_feedback_type action_feedback;





  typedef boost::shared_ptr< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> const> ConstPtr;

}; // struct RobotTaskAction_

typedef ::hrca_msgs::RobotTaskAction_<std::allocator<void> > RobotTaskAction;

typedef boost::shared_ptr< ::hrca_msgs::RobotTaskAction > RobotTaskActionPtr;
typedef boost::shared_ptr< ::hrca_msgs::RobotTaskAction const> RobotTaskActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hrca_msgs::RobotTaskAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hrca_msgs::RobotTaskAction_<ContainerAllocator1> & lhs, const ::hrca_msgs::RobotTaskAction_<ContainerAllocator2> & rhs)
{
  return lhs.action_goal == rhs.action_goal &&
    lhs.action_result == rhs.action_result &&
    lhs.action_feedback == rhs.action_feedback;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hrca_msgs::RobotTaskAction_<ContainerAllocator1> & lhs, const ::hrca_msgs::RobotTaskAction_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hrca_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6e3c5adaac8531ba4c5d2e38cfafddcc";
  }

  static const char* value(const ::hrca_msgs::RobotTaskAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6e3c5adaac8531baULL;
  static const uint64_t static_value2 = 0x4c5d2e38cfafddccULL;
};

template<class ContainerAllocator>
struct DataType< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hrca_msgs/RobotTaskAction";
  }

  static const char* value(const ::hrca_msgs::RobotTaskAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"RobotTaskActionGoal action_goal\n"
"RobotTaskActionResult action_result\n"
"RobotTaskActionFeedback action_feedback\n"
"\n"
"================================================================================\n"
"MSG: hrca_msgs/RobotTaskActionGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"RobotTaskGoal goal\n"
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
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: hrca_msgs/RobotTaskGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#goal definition\n"
"string action #'hold', 'pick_and_place', 'move_to_pose', 'move_to_pose_cartesian', 'pick_and_handoff'\n"
"geometry_msgs/PoseStamped pose1\n"
"geometry_msgs/PoseStamped pose2\n"
"string object_name\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseStamped\n"
"# A Pose with reference coordinate frame and timestamp\n"
"Header header\n"
"Pose pose\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: hrca_msgs/RobotTaskActionResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"RobotTaskResult result\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalStatus\n"
"GoalID goal_id\n"
"uint8 status\n"
"uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n"
"uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n"
"uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n"
"                            #   and has since completed its execution (Terminal State)\n"
"uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n"
"uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n"
"                            #    to some failure (Terminal State)\n"
"uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n"
"                            #    because the goal was unattainable or invalid (Terminal State)\n"
"uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n"
"                            #    and has not yet completed execution\n"
"uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n"
"                            #    but the action server has not yet confirmed that the goal is canceled\n"
"uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n"
"                            #    and was successfully cancelled (Terminal State)\n"
"uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n"
"                            #    sent over the wire by an action server\n"
"\n"
"#Allow for the user to associate a string with GoalStatus for debugging\n"
"string text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: hrca_msgs/RobotTaskResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#result definition\n"
"bool success\n"
"\n"
"================================================================================\n"
"MSG: hrca_msgs/RobotTaskActionFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"RobotTaskFeedback feedback\n"
"\n"
"================================================================================\n"
"MSG: hrca_msgs/RobotTaskFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#feedback, for now just return \"status\" e.g. 'running'\n"
"string status #'running'\n"
;
  }

  static const char* value(const ::hrca_msgs::RobotTaskAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.action_goal);
      stream.next(m.action_result);
      stream.next(m.action_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotTaskAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hrca_msgs::RobotTaskAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hrca_msgs::RobotTaskAction_<ContainerAllocator>& v)
  {
    s << indent << "action_goal: ";
    s << std::endl;
    Printer< ::hrca_msgs::RobotTaskActionGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.action_goal);
    s << indent << "action_result: ";
    s << std::endl;
    Printer< ::hrca_msgs::RobotTaskActionResult_<ContainerAllocator> >::stream(s, indent + "  ", v.action_result);
    s << indent << "action_feedback: ";
    s << std::endl;
    Printer< ::hrca_msgs::RobotTaskActionFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.action_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HRCA_MSGS_MESSAGE_ROBOTTASKACTION_H