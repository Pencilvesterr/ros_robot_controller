# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/opt/ros/melodic/include/libfranka".split(';') if "${prefix}/include;/opt/ros/melodic/include/libfranka" != "" else []
PROJECT_CATKIN_DEPENDS = "controller_interface;dynamic_reconfigure;franka_hw;geometry_msgs;franka_core_msgs;hardware_interface;message_runtime;pluginlib;realtime_tools;roscpp".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lfranka_ros_controllers;/opt/ros/melodic/lib/libfranka.so.0.8.0".split(';') if "-lfranka_ros_controllers;/opt/ros/melodic/lib/libfranka.so.0.8.0" != "" else []
PROJECT_NAME = "franka_ros_controllers"
PROJECT_SPACE_DIR = "/home/morgan/projects/cws_ws/install_isolated"
PROJECT_VERSION = "0.7.1"
