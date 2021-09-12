#! /usr/bin/env python
import rospy
import actionlib
from hrca_action.panda_arm import PandaArm 
from hrca_action.utilities import create_pose, create_pose_stamped
from hrca_msgs.msg import RobotTaskAction, RobotTaskFeedback, RobotTaskResult, RobotTaskGoal
from hrca_msgs.srv import GetRobotPose, get_object_angle, get_object_angleResponse

from hrca_action.utilities import *
# from gtts import gTTS
import numpy as np

# import os
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

# dictionary for boxes 
def box1():
    # Pick and place poses 
    print("hi")
    pick_goal_first = create_pose_stamped(create_pose(-0.00072, 0.34528, 0.175, -1, 0, 0, 0), "panda_link0") # ritz
    place_goal_first = create_pose_stamped(create_pose(0.4929, -0.2383, 0.19, -1, 0, 0, 0), "panda_link0") # ritz
    
    # MoveIt collision poses 
    obj_1_pose = create_pose_stamped(create_pose(-0.00072, 0.34528, 0.1025, -1, 0, 0, 0), "panda_link0") # ritz

    box_bottom_pose = create_pose_stamped(create_pose(0.595, 0, 0.00125, -1, 0, 0, 0), "panda_link0")
    box_east_pose = create_pose_stamped(create_pose(0.595, 0.3524875, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_west_pose = create_pose_stamped(create_pose(0.595, -0.3524875, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_south_pose = create_pose_stamped(create_pose(0.38125, 0, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_north_pose = create_pose_stamped(create_pose(0.80875, 0, 0.137525, -1, 0, 0, 0), "panda_link0")
    table_pose = create_pose_stamped(create_pose(0, 0, -0.01, -1, 0, 0, 0), "panda_link0")

    try:
        # ADD MOVEIT COLLISION OBJECTS 
        moh = MoveitObjectHandler()
        # moh.remove_all_objects() # so that doesn't clear objects from the other node 

        # Add table 
        table_size = (1.84, 1.40, 0.02)
        table_rotation = (0, 0, 0)

        # Add packing objects
        obj_1_size = (0.15, 0.055, 0.205)
        obj_1_rotation = (0, 0, 0)
        
        # Add packing box 
        box_bottom_size = (0.43, 0.705, 0.0025)
        box_bottom_rotation = (0, 0, 0)
        box_short_size = (0.0025, 0.43, 0.275) # east and west 
        box_short_rotation = (0, 0, 90)
        box_long_size = (0.0025, 0.705, 0.275) # north and south 
        box_long_rotation = (0, 0, 0)

        # Adding to planning scene 
        # moh.add_box_object("obj_1", pose=obj_1_pose, size=obj_1_size, rotation=obj_1_rotation, frame="panda_link0") # adding objects from the other node 
        moh.get_object_positions(["obj_1"])
        moh.add_box_object("box_bottom", pose=box_bottom_pose, size=box_bottom_size, rotation=box_bottom_rotation, frame="panda_link0")
        moh.add_box_object("box_east", pose=box_east_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_west", pose=box_west_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_north", pose=box_north_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("box_south", pose=box_south_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("table", pose=table_pose, size=table_size, rotation=table_rotation, frame="panda_link0")
        
        # call pick and place action 
        # line1Obj = gTTS(line1, language, slow=Fafrom gp_trajectory_controllers.srv import *se)
        # line1Obj.save("line1.mp3")
        # os.system("mpg123 line1.mp3")

        result = call_server("pick_and_place", pick_goal_first, place_goal_first, "obj_1")
        
        # line2Obj = gTTS(line2, language, slow=False)
        # line2Obj.save("line2.mp3")
        # os.system("mpg123 line2.mp3")
        
        print result
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e

def box2():
    # Pick and place poses 
    pick_goal_second = create_pose_stamped(create_pose(-0.02009, 0.5247, 0.185, -1, 0, 0, 0), "panda_link0") # can soup
    place_goal_second = create_pose_stamped(create_pose(0.49228, 0.21589, 0.07899, -1, 0, 0, 0), "panda_link0") # can soup
    
    # MoveIt collision poses 
    cyl_1_pose = create_pose_stamped(create_pose(-0.02009, 0.5247, 0.162, -1, 0, 0, 0), "panda_link0") # can soup

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

        # Add table 
        table_size = (1.84, 1.40, 0.02)
        table_rotation = (0, 0, 0)

        # Add packing objects
        cyl_rotation = (0, 0, 0)
        cyl_height = 0.108
        cyl_radius = 0.035

        # Add packing box 
        box_bottom_size = (0.43, 0.705, 0.0025)
        box_bottom_rotation = (0, 0, 0)
        box_short_size = (0.0025, 0.43, 0.275) # east and west 
        box_short_rotation = (0, 0, 90)
        box_long_size = (0.0025, 0.705, 0.275) # north and south 
        box_long_rotation = (0, 0, 0)

        # Adding to planning scene 
        moh.add_cylinder_object("cyl_1", pose=cyl_1_pose, height=cyl_height, radius=cyl_radius, rotation=cyl_rotation, frame="panda_link0")
        moh.add_box_object("box_bottom", pose=box_bottom_pose, size=box_bottom_size, rotation=box_bottom_rotation, frame="panda_link0")
        moh.add_box_object("box_east", pose=box_east_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_west", pose=box_west_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_north", pose=box_north_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("box_south", pose=box_south_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("table", pose=table_pose, size=table_size, rotation=table_rotation, frame="panda_link0")
        
        # call pick and place action 
        # line1Obj = gTTS(line1, language, slow=False)
        # line1Obj.save("line1.mp3")
        # os.system("mpg123 line1.mp3")

        result = call_server("pick_and_place", pick_goal_second, place_goal_second, "cyl_1")
        
        # line2Obj = gTTS(line2, language, slow=False)
        # line2Obj.save("line2.mp3")
        # os.system("mpg123 line2.mp3")

        print result
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e

def boxTest():

    # Scan for objects 
    rospy.wait_for_service('get_object_angle')

    try:
        get_obj_pos = rospy.ServiceProxy('get_object_angle', get_object_angle)
        resp = get_obj_pos(1, True)
        print(resp)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

    obj_pos = resp.Cartesian_Pos


    # Pick and place poses 
    print("hi")
    pick_goal_first = create_pose_stamped(create_pose(obj_pos[0], obj_pos[1], obj_pos[2], -1, 0, 0, 0), "panda_link0") # coffee jar 
    #pick_goal_first = create_pose_stamped(create_pose(0.37964330755683273, 0.005206982593977491, 0.08576965513945521, -1, 0, 0, 0), "panda_link0")
    place_goal_first = create_pose_stamped(create_pose(0.37964330755683273, 0.005206982593977491, 0.08576965513945521 + 0.2, -1, 0, 0, 0), "panda_link0") # coffee jar 
    
    # MoveIt collision poses 
    cyl_1_pose = create_pose_stamped(create_pose(obj_pos[0], obj_pos[1], obj_pos[2] - 0.06, -1, 0, 0, 0), "panda_link0") # coffee jar 

    box_bottom_pose = create_pose_stamped(create_pose(0.595, 0, 0.00125, -1, 0, 0, 0), "panda_link0")
    box_east_pose = create_pose_stamped(create_pose(0.595, 0.3524875, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_west_pose = create_pose_stamped(create_pose(0.595, -0.3524875, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_south_pose = create_pose_stamped(create_pose(0.38125, 0, 0.137525, -1, 0, 0, 0), "panda_link0")
    box_north_pose = create_pose_stamped(create_pose(0.80875, 0, 0.137525, -1, 0, 0, 0), "panda_link0")
    table_pose = create_pose_stamped(create_pose(0, 0, -0.01, -1, 0, 0, 0), "panda_link0")

    try:
        # ADD MOVEIT COLLISION OBJECTS 
        moh = MoveitObjectHandler()
        moh.remove_all_objects() # so that doesn't clear objects from the other node 

        # Add table 
        table_size = (1.84, 1.40, 0.02)
        table_rotation = (0, 0, 0)

        # Add packing objects
        cyl_rotation = (0, 0, 0)
        cyl_height = 0.108
        cyl_radius = 0.035
        
        # Add packing box 
        box_bottom_size = (0.43, 0.705, 0.0025)
        box_bottom_rotation = (0, 0, 0)
        box_short_size = (0.0025, 0.43, 0.275) # east and west 
        box_short_rotation = (0, 0, 90)
        box_long_size = (0.0025, 0.705, 0.275) # north and south 
        box_long_rotation = (0, 0, 0)

        # Adding to planning scene 
        # moh.add_box_object("obj_1", pose=obj_1_pose, size=obj_1_size, rotation=obj_1_rotation, frame="panda_link0") # adding objects from the other node 
        moh.add_cylinder_object("cyl_1", pose=cyl_1_pose, height=cyl_height, radius=cyl_radius, rotation=cyl_rotation, frame="panda_link0")
        # moh.add_box_object("box_bottom", pose=box_bottom_pose, size=box_bottom_size, rotation=box_bottom_rotation, frame="panda_link0")
        # moh.add_box_object("box_east", pose=box_east_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        # moh.add_box_object("box_west", pose=box_west_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        # moh.add_box_object("box_north", pose=box_north_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        # moh.add_box_object("box_south", pose=box_south_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("table", pose=table_pose, size=table_size, rotation=table_rotation, frame="panda_link0")
        
        # call pick and place action 
        # line1Obj = gTTS(line1, language, slow=Fafrom gp_trajectory_controllers.srv import *se)
        # line1Obj.save("line1.mp3")
        # os.system("mpg123 line1.mp3")

        result = call_server("pick_and_place", pick_goal_first, place_goal_first, "cyl_1")
        
        # line2Obj = gTTS(line2, language, slow=False)
        # line2Obj.save("line2.mp3")
        # os.system("mpg123 line2.mp3")
        
        print result
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e


def endExperiment():
    return 0


if __name__ == '__main__':
    rospy.init_node("panda_arm_client_py")
    # from test_panda_arm_action_server.py
    panda_arm = PandaArm(simulation=True)
    
    try:
        ### TESTING VISION 
        # Scan for objects 
        rospy.wait_for_service('get_object_angle')

        try:
            get_obj_pos = rospy.ServiceProxy('get_object_angle', get_object_angle)
            resp = get_obj_pos(1, True)
            print(resp)
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

        # Dictionary for box choice 
        pick_box = {
        1: box1,
        2: box2,
        3: boxTest
        }
        # While loop for experiment 
        q = 1 # start experiment 
        num_box_packed = 0
        while (q == 1):
            # ask for box number 
            boxChoice = input("Please enter box number (1 - 10 or 0 to end): ")
            
            if boxChoice != 0:
                pick_box[boxChoice]()
                panda_arm.move_to_home()
                num_box_packed += 1
            elif boxChoice == 0 or num_box_packed == 4:
                print("Ending experiment")
                q = 0
            
        print 'done'
     
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e