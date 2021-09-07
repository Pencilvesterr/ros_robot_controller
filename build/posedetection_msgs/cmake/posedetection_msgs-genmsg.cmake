# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "posedetection_msgs: 7 messages, 4 services")

set(MSG_I_FLAGS "-Iposedetection_msgs:/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(posedetection_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" "sensor_msgs/Image:posedetection_msgs/Feature0D:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" "posedetection_msgs/ObjectDetection:sensor_msgs/Image:posedetection_msgs/Object6DPose:geometry_msgs/Pose:sensor_msgs/CameraInfo:sensor_msgs/RegionOfInterest:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" ""
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" "sensor_msgs/Image:posedetection_msgs/Curve1D:sensor_msgs/CameraInfo:sensor_msgs/RegionOfInterest:posedetection_msgs/Feature1D:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:posedetection_msgs/Object6DPose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" "posedetection_msgs/Curve1D:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion:posedetection_msgs/Object6DPose:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" "posedetection_msgs/Curve1D:sensor_msgs/Image:posedetection_msgs/Feature1D:std_msgs/Header"
)

get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" NAME_WE)
add_custom_target(_posedetection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "posedetection_msgs" "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" "sensor_msgs/CameraInfo:sensor_msgs/Image:posedetection_msgs/Feature0D:sensor_msgs/RegionOfInterest:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)

### Generating Services
_generate_srv_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_cpp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
)

### Generating Module File
_generate_module_cpp(posedetection_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(posedetection_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(posedetection_msgs_generate_messages posedetection_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_cpp _posedetection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(posedetection_msgs_gencpp)
add_dependencies(posedetection_msgs_gencpp posedetection_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS posedetection_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)

### Generating Services
_generate_srv_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_eus(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
)

### Generating Module File
_generate_module_eus(posedetection_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(posedetection_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(posedetection_msgs_generate_messages posedetection_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_eus _posedetection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(posedetection_msgs_geneus)
add_dependencies(posedetection_msgs_geneus posedetection_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS posedetection_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)

### Generating Services
_generate_srv_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_lisp(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
)

### Generating Module File
_generate_module_lisp(posedetection_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(posedetection_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(posedetection_msgs_generate_messages posedetection_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_lisp _posedetection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(posedetection_msgs_genlisp)
add_dependencies(posedetection_msgs_genlisp posedetection_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS posedetection_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)

### Generating Services
_generate_srv_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_nodejs(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
)

### Generating Module File
_generate_module_nodejs(posedetection_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(posedetection_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(posedetection_msgs_generate_messages posedetection_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_nodejs _posedetection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(posedetection_msgs_gennodejs)
add_dependencies(posedetection_msgs_gennodejs posedetection_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS posedetection_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_msg_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)

### Generating Services
_generate_srv_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)
_generate_srv_py(posedetection_msgs
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv"
  "${MSG_I_FLAGS}"
  "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
)

### Generating Module File
_generate_module_py(posedetection_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(posedetection_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(posedetection_msgs_generate_messages posedetection_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature0DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Detect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Object6DPose.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Curve1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/TargetObj.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature1D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/Feature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/srv/Feature1DDetect.srv" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_dependencies/jsk_common_msgs/posedetection_msgs/msg/ImageFeature0D.msg" NAME_WE)
add_dependencies(posedetection_msgs_generate_messages_py _posedetection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(posedetection_msgs_genpy)
add_dependencies(posedetection_msgs_genpy posedetection_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS posedetection_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/posedetection_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(posedetection_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(posedetection_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(posedetection_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/posedetection_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(posedetection_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(posedetection_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(posedetection_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/posedetection_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(posedetection_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(posedetection_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(posedetection_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/posedetection_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(posedetection_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(posedetection_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(posedetection_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/posedetection_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(posedetection_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(posedetection_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(posedetection_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
