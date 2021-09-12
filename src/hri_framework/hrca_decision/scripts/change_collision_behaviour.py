#!/usr/bin/env python

from __future__ import print_function

import sys
import rospy
from franka_control.srv import *

def change_client():
    rospy.wait_for_service('/franka_control/set_full_collision_behavior')
    try:
        my_client = rospy.ServiceProxy('/franka_control/set_full_collision_behavior', SetFullCollisionBehavior)
        lower_torque_thresholds_acceleration = [100, 100, 100, 100, 100, 100, 100]
        upper_torque_thresholds_acceleration = [100, 100, 100, 100, 100, 100, 100]
        lower_torque_thresholds_nominal = [100, 100, 100, 100, 100, 100, 100]
        upper_torque_thresholds_nominal = [100, 100, 100, 100, 100, 100, 100]
        lower_force_thresholds_acceleration = [100, 100, 100, 100, 100, 100]
        upper_force_thresholds_acceleration = [100, 100, 100, 100, 100, 100]
        lower_force_thresholds_nominal = [100, 100, 100, 100, 100, 100]
        upper_force_thresholds_nominal = [100, 100, 100, 100, 100, 100]
        resp1 = my_client(lower_torque_thresholds_acceleration, upper_torque_thresholds_acceleration, lower_torque_thresholds_nominal, upper_torque_thresholds_nominal, lower_force_thresholds_acceleration, upper_force_thresholds_acceleration, lower_force_thresholds_nominal, upper_force_thresholds_nominal)
        return resp1.error
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

if __name__ == "__main__":
    print("%s"%(change_client()))
