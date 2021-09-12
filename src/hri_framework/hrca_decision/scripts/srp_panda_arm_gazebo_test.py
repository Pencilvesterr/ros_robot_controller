#! /usr/bin/env python
import rospy
import actionlib
from hrca_action.panda_arm import PandaArm 
from hrca_action.utilities import create_pose, create_pose_stamped
from hrca_msgs.msg import RobotTaskAction, RobotTaskFeedback, RobotTaskResult, RobotTaskGoal
from hrca_msgs.srv import GetRobotPose
from hrca_action.utilities import *
import numpy as np

import smach
import smach_ros
from smach import CBState
#from smach_ros import MonitorStateS

from std_msgs.msg import Empty

def panda_arm_client():
    client = actionlib.SimpleActionClient('panda_arm_server', RobotTaskAction)
    client.wait_for_server()
    
    goal = RobotTaskGoal()
    goal.action = "open_gripper"
    client.send_goal(goal)

    # client.wait_for_result(rospy.Duration.from_sec(5.0))
    client.wait_for_result()
    return client.get_result()

def feedback_cb(msg):
    print msg

def call_server(action, pose1, pose2, obj_name):
    client = actionlib.SimpleActionClient('panda_arm_server', RobotTaskAction)
    # print("waiting for server")
    client.wait_for_server()

    goal = RobotTaskGoal()

    # q_orig = np.array([pose1.pose.orientation.x, pose1.pose.orientation.y, pose1.pose.orientation.z, pose1.pose.orientation.w])
    # q_rotation = np.array([np.cos(np.pi/8), 0,0,np.cos(np.pi/8)])
    # q_new = q_rotation * q_orig

    goal.action = action
    goal.pose1 = pose1
    goal.pose2 = pose2
    goal.object_name = obj_name

    client.send_goal(goal, feedback_cb=feedback_cb)

    client.wait_for_result()

    result = client.get_result()

    return result

if __name__ == '__main__':
    rospy.init_node("panda_arm_client_py")

    ### from test_panda_arm_action_server.py
    panda_arm = PandaArm(simulation=True)
    
    # TEST PICK AND PLACE  
    # pick_goal_first = create_pose_stamped(create_pose(0.470238, -0.061085, 0.0215, -1, 0, 0, 0), "panda_link0")
    # pick_goal_second = create_pose_stamped(create_pose(0.470238, 0.3, 0.15, -1, 0, 0, 0), "panda_link0") 
    # place_goal_first = create_pose_stamped(create_pose(-0.0934, 0.4225, 0.3, -1, 0, 0, 0), "panda_link0")
    # place_goal_first = create_pose_stamped(create_pose(-0.0934, 0.5, 0.15, -1, 0, 0, 0), "panda_link0")
    # place_goal_second = create_pose_stamped(create_pose(0.1, 0.5, 0.15, -1, 0, 0, 0), "panda_link0")

    # ACTUAL PICK AND PLACE POSES 
    place_goal_first = create_pose_stamped(create_pose(0.4929, -0.2383, 0.1876, -1, 0, 0, 0), "panda_link0") # ritz
    place_goal_second = create_pose_stamped(create_pose(0.53652, -0.00922, 0.03635, -1, 0, 0, 0), "panda_link0") # jelly 
    place_goal_third = create_pose_stamped(create_pose(0.49228, 0.21589, 0.07899, -1, 0, 0, 0), "panda_link0") # tomatos
    
    pick_goal_first = create_pose_stamped(create_pose(-0.01459, 0.32885, 0.15612, -1, 0, 0, 0), "panda_link0") # ritz
    pick_goal_second = create_pose_stamped(create_pose(-0.02385, 0.48175, 0.06861, -1, 0, 0, 0), "panda_link0") # jelly
    pick_goal_third = create_pose_stamped(create_pose(-0.0119, 0.62675, 0.04726, -1, 0, 0, 0), "panda_link0") # tomatos

    # MOVEIT COLLISION OBJECT POSES 
    obj_1_pose = create_pose_stamped(create_pose(-0.01459, 0.32885, 0.1025, -1, 0, 0, 0), "panda_link0") # ritz
    obj_2_pose = create_pose_stamped(create_pose(-0.02385, 0.48175, 0.045, -1, 0, 0, 0), "panda_link0") # jelly
    cyl_pose = create_pose_stamped(create_pose(-0.0119, 0.62675, 0.054, -1, 0, 0, 0), "panda_link0") # tomatos

    box_bottom_pose = create_pose_stamped(create_pose(0.595, 0, 0.00125, -1, 0, 0, 0), "panda_link0")
    box_east_pose = create_pose_stamped(create_pose(0.595, 0.3524875, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_west_pose = create_pose_stamped(create_pose(0.595, -0.3524875, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_south_pose = create_pose_stamped(create_pose(0.38125, 0, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_north_pose = create_pose_stamped(create_pose(0.80875, 0, 0.137525, -1, 0, 0, 0), "panda_link0")
    table_pose = create_pose_stamped(create_pose(0, 0, -0.01, -1, 0, 0, 0), "panda_link0")
    
    try:
        # ADD MOVEIT COLLISION OBJECTS 
        moh = MoveitObjectHandler()
        moh.remove_all_objects()

        # table 
        table_size = (1.84, 1.40, 0.02)
        table_rotation = (0, 0, 0)

        # packing objects
        obj_1_size = (0.15, 0.055, 0.205)
        obj_1_rotation = (0, 0, 0)
        obj_2_size = (0.063, 0.028, 0.09)
        obj_2_rotation = (0, 0, 0)
	
        cyl_rotation = (0, 0, 0)
        cyl_height = 0.108
        cyl_radius = 0.035

        # packing box 
        box_bottom_size = (0.43, 0.705, 0.0025)
        box_bottom_rotation = (0, 0, 0)
        box_short_size = (0.0025, 0.43, 0.275) # east and west 
        box_short_rotation = (0, 0, 90)
        box_long_size = (0.0025, 0.705, 0.275) # north and south 
        box_long_rotation = (0, 0, 0)

        # adding to planning scene 
        moh.add_box_object("obj_1", pose=obj_1_pose, size=obj_1_size, rotation=obj_1_rotation, frame="panda_link0")
        moh.add_box_object("obj_2", pose=obj_2_pose, size=obj_2_size, rotation=obj_2_rotation, frame="panda_link0")
        moh.add_cylinder_object("cyl", pose=cyl_pose, height=cyl_height, radius=cyl_radius, rotation=cyl_rotation, frame="panda_link0")
        moh.add_box_object("box_bottom", pose=box_bottom_pose, size=box_bottom_size, rotation=box_bottom_rotation, frame="panda_link0")
        moh.add_box_object("box_east", pose=box_east_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_west", pose=box_west_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_north", pose=box_north_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("box_south", pose=box_south_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("table", pose=table_pose, size=table_size, rotation=table_rotation, frame="panda_link0")
        # call pick and place action 
        result = call_server("pick_and_place", pick_goal_first, place_goal_first, "obj_1")
        result = call_server("pick_and_place", pick_goal_second, place_goal_second, "obj_2")
        result = call_server("pick_and_place", pick_goal_third, place_goal_third, "cyl")
        print result
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e
