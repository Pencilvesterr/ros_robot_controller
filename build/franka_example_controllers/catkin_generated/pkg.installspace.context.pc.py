# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/home/hrigroup2/git/libfranka/include".split(';') if "${prefix}/include;/home/hrigroup2/git/libfranka/include" != "" else []
PROJECT_CATKIN_DEPENDS = "controller_interface;dynamic_reconfigure;eigen_conversions;franka_hw;geometry_msgs;hardware_interface;tf;tf_conversions;message_runtime;pluginlib;realtime_tools;roscpp".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lfranka_example_controllers;/home/hrigroup2/git/libfranka/build/libfranka.so.0.7.1".split(';') if "-lfranka_example_controllers;/home/hrigroup2/git/libfranka/build/libfranka.so.0.7.1" != "" else []
PROJECT_NAME = "franka_example_controllers"
PROJECT_SPACE_DIR = "/home/hrigroup2/projects/ros_cws_planner/install"
PROJECT_VERSION = "0.7.0"
