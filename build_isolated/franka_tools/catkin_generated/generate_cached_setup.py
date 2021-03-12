# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/melodic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/melodic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/morgan/projects/cws_ws/devel_isolated/franka_moveit;/home/morgan/projects/cws_ws/devel_isolated/panda_moveit_config;/home/morgan/projects/cws_ws/devel_isolated/panda_hardware_interface;/home/morgan/projects/cws_ws/devel_isolated/orocos_kinematics_dynamics;/home/morgan/projects/cws_ws/devel_isolated/franka_visualization;/home/morgan/projects/cws_ws/devel_isolated/franka_ros_interface;/home/morgan/projects/cws_ws/devel_isolated/franka_ros_controllers;/home/morgan/projects/cws_ws/devel_isolated/franka_ros;/home/morgan/projects/cws_ws/devel_isolated/franka_panda_description;/home/morgan/projects/cws_ws/devel_isolated/franka_interface;/home/morgan/projects/cws_ws/devel_isolated/franka_example_controllers;/home/morgan/projects/cws_ws/devel_isolated/franka_control;/home/morgan/projects/cws_ws/devel_isolated/franka_hw;/home/morgan/projects/cws_ws/devel_isolated/franka_core_msgs;/home/morgan/projects/cws_ws/devel_isolated/franka_msgs;/home/morgan/projects/cws_ws/devel_isolated/franka_gripper;/home/morgan/projects/cws_ws/devel_isolated/franka_description;/home/morgan/projects/cws_ws/devel_isolated/cws_planning;/home/morgan/projects/cws_ws/devel;/opt/ros/melodic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/morgan/projects/cws_ws/devel_isolated/franka_tools/env.sh')

output_filename = '/home/morgan/projects/cws_ws/build_isolated/franka_tools/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
