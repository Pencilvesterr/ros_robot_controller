# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hrca_decision: 2 messages, 3 services")

set(MSG_I_FLAGS "-Ihrca_decision:/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hrca_decision_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" NAME_WE)
add_custom_target(_hrca_decision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_decision" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" NAME_WE)
add_custom_target(_hrca_decision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_decision" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" NAME_WE)
add_custom_target(_hrca_decision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_decision" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" NAME_WE)
add_custom_target(_hrca_decision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_decision" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" NAME_WE)
add_custom_target(_hrca_decision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hrca_decision" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
)
_generate_msg_cpp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
)

### Generating Services
_generate_srv_cpp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
)
_generate_srv_cpp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
)
_generate_srv_cpp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
)

### Generating Module File
_generate_module_cpp(hrca_decision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hrca_decision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hrca_decision_generate_messages hrca_decision_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_cpp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_cpp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_cpp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_cpp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_cpp _hrca_decision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_decision_gencpp)
add_dependencies(hrca_decision_gencpp hrca_decision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_decision_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
)
_generate_msg_eus(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
)

### Generating Services
_generate_srv_eus(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
)
_generate_srv_eus(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
)
_generate_srv_eus(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
)

### Generating Module File
_generate_module_eus(hrca_decision
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hrca_decision_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hrca_decision_generate_messages hrca_decision_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_eus _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_eus _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_eus _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_eus _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_eus _hrca_decision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_decision_geneus)
add_dependencies(hrca_decision_geneus hrca_decision_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_decision_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
)
_generate_msg_lisp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
)

### Generating Services
_generate_srv_lisp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
)
_generate_srv_lisp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
)
_generate_srv_lisp(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
)

### Generating Module File
_generate_module_lisp(hrca_decision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hrca_decision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hrca_decision_generate_messages hrca_decision_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_lisp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_lisp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_lisp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_lisp _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_lisp _hrca_decision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_decision_genlisp)
add_dependencies(hrca_decision_genlisp hrca_decision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_decision_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
)
_generate_msg_nodejs(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
)

### Generating Services
_generate_srv_nodejs(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
)
_generate_srv_nodejs(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
)
_generate_srv_nodejs(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
)

### Generating Module File
_generate_module_nodejs(hrca_decision
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hrca_decision_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hrca_decision_generate_messages hrca_decision_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_nodejs _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_nodejs _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_nodejs _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_nodejs _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_nodejs _hrca_decision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_decision_gennodejs)
add_dependencies(hrca_decision_gennodejs hrca_decision_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_decision_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
)
_generate_msg_py(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
)

### Generating Services
_generate_srv_py(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
)
_generate_srv_py(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
)
_generate_srv_py(hrca_decision
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
)

### Generating Module File
_generate_module_py(hrca_decision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hrca_decision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hrca_decision_generate_messages hrca_decision_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/cws_planning.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_py _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/msg/TrafficLight.msg" NAME_WE)
add_dependencies(hrca_decision_generate_messages_py _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_py _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/ResetRobot.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_py _hrca_decision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/srv/MoveBlock.srv" NAME_WE)
add_dependencies(hrca_decision_generate_messages_py _hrca_decision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hrca_decision_genpy)
add_dependencies(hrca_decision_genpy hrca_decision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hrca_decision_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hrca_decision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hrca_decision_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hrca_decision
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hrca_decision_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hrca_decision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hrca_decision_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hrca_decision
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hrca_decision_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hrca_decision/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hrca_decision_generate_messages_py std_msgs_generate_messages_py)
endif()
