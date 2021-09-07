# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hrca_msgs: 7 messages, 1 services")

set(MSG_I_FLAGS "-Ihrca_msgs:/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hrca_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" "actionlib_msgs/GoalID:hrca_msgs/RobotTaskGoal:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" "actionlib_msgs/GoalID:hrca_msgs/RobotTaskGoal:hrca_msgs/RobotTaskActionResult:hrca_msgs/RobotTaskFeedback:actionlib_msgs/GoalStatus:hrca_msgs/RobotTaskActionFeedback:hrca_msgs/RobotTaskActionGoal:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:hrca_msgs/RobotTaskResult:geometry_msgs/Point"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:hrca_msgs/RobotTaskResult:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" NAME_WE)
add_custom_target(_hrca_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_msgs" "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:hrca_msgs/RobotTaskFeedback:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)

### Generating Services
_generate_srv_cpp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
)

### Generating Module File
_generate_module_cpp(hrca_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hrca_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hrca_msgs_generate_messages hrca_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_cpp _hrca_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_msgs_gencpp)
add_dependencies(hrca_msgs_gencpp hrca_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)
_generate_msg_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)

### Generating Services
_generate_srv_eus(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
)

### Generating Module File
_generate_module_eus(hrca_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hrca_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hrca_msgs_generate_messages hrca_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_eus _hrca_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_msgs_geneus)
add_dependencies(hrca_msgs_geneus hrca_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)
_generate_msg_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)

### Generating Services
_generate_srv_lisp(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
)

### Generating Module File
_generate_module_lisp(hrca_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hrca_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hrca_msgs_generate_messages hrca_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_lisp _hrca_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_msgs_genlisp)
add_dependencies(hrca_msgs_genlisp hrca_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)
_generate_msg_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)

### Generating Services
_generate_srv_nodejs(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
)

### Generating Module File
_generate_module_nodejs(hrca_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hrca_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hrca_msgs_generate_messages hrca_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_nodejs _hrca_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_msgs_gennodejs)
add_dependencies(hrca_msgs_gennodejs hrca_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)
_generate_msg_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)

### Generating Services
_generate_srv_py(hrca_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
)

### Generating Module File
_generate_module_py(hrca_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hrca_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hrca_msgs_generate_messages hrca_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskGoal.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskAction.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionResult.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_msgs/srv/GetRobotPose.srv" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/devel/.private/hrca_msgs/share/hrca_msgs/msg/RobotTaskActionFeedback.msg" NAME_WE)
add_dependencies(hrca_msgs_generate_messages_py _hrca_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_msgs_genpy)
add_dependencies(hrca_msgs_genpy hrca_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hrca_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(hrca_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(hrca_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hrca_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(hrca_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(hrca_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hrca_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(hrca_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(hrca_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hrca_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(hrca_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(hrca_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hrca_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(hrca_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(hrca_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
