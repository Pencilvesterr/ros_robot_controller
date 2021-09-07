# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robohub_object_tracking: 2 messages, 0 services")

set(MSG_I_FLAGS "-Irobohub_object_tracking:/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robohub_object_tracking_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" NAME_WE)
add_custom_target(_robohub_object_tracking_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robohub_object_tracking" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" NAME_WE)
add_custom_target(_robohub_object_tracking_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robohub_object_tracking" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" "robohub_object_tracking/TrackedObjectPose:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point:geometry_msgs/PoseStamped:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robohub_object_tracking
)
_generate_msg_cpp(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robohub_object_tracking
)

### Generating Services

### Generating Module File
_generate_module_cpp(robohub_object_tracking
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robohub_object_tracking
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robohub_object_tracking_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robohub_object_tracking_generate_messages robohub_object_tracking_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_cpp _robohub_object_tracking_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_cpp _robohub_object_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robohub_object_tracking_gencpp)
add_dependencies(robohub_object_tracking_gencpp robohub_object_tracking_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robohub_object_tracking_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robohub_object_tracking
)
_generate_msg_eus(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robohub_object_tracking
)

### Generating Services

### Generating Module File
_generate_module_eus(robohub_object_tracking
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robohub_object_tracking
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robohub_object_tracking_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robohub_object_tracking_generate_messages robohub_object_tracking_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_eus _robohub_object_tracking_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_eus _robohub_object_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robohub_object_tracking_geneus)
add_dependencies(robohub_object_tracking_geneus robohub_object_tracking_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robohub_object_tracking_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robohub_object_tracking
)
_generate_msg_lisp(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robohub_object_tracking
)

### Generating Services

### Generating Module File
_generate_module_lisp(robohub_object_tracking
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robohub_object_tracking
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robohub_object_tracking_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robohub_object_tracking_generate_messages robohub_object_tracking_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_lisp _robohub_object_tracking_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_lisp _robohub_object_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robohub_object_tracking_genlisp)
add_dependencies(robohub_object_tracking_genlisp robohub_object_tracking_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robohub_object_tracking_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robohub_object_tracking
)
_generate_msg_nodejs(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robohub_object_tracking
)

### Generating Services

### Generating Module File
_generate_module_nodejs(robohub_object_tracking
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robohub_object_tracking
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robohub_object_tracking_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robohub_object_tracking_generate_messages robohub_object_tracking_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_nodejs _robohub_object_tracking_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_nodejs _robohub_object_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robohub_object_tracking_gennodejs)
add_dependencies(robohub_object_tracking_gennodejs robohub_object_tracking_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robohub_object_tracking_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking
)
_generate_msg_py(robohub_object_tracking
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking
)

### Generating Services

### Generating Module File
_generate_module_py(robohub_object_tracking
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robohub_object_tracking_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robohub_object_tracking_generate_messages robohub_object_tracking_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPose.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_py _robohub_object_tracking_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/robohub_object_tracking/robohub_object_tracking/msg/TrackedObjectPoseList.msg" NAME_WE)
add_dependencies(robohub_object_tracking_generate_messages_py _robohub_object_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robohub_object_tracking_genpy)
add_dependencies(robohub_object_tracking_genpy robohub_object_tracking_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robohub_object_tracking_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robohub_object_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robohub_object_tracking
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robohub_object_tracking_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(robohub_object_tracking_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robohub_object_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robohub_object_tracking
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robohub_object_tracking_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(robohub_object_tracking_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robohub_object_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robohub_object_tracking
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robohub_object_tracking_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(robohub_object_tracking_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robohub_object_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robohub_object_tracking
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robohub_object_tracking_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(robohub_object_tracking_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robohub_object_tracking/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robohub_object_tracking_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(robohub_object_tracking_generate_messages_py geometry_msgs_generate_messages_py)
endif()
