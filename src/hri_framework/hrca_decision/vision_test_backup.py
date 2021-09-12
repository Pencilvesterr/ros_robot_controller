#! /usr/bin/env python2.7
# DEPENDENCIES 
from hrca_action.panda_arm import PandaArm 
from hrca_action.utilities import create_pose, create_pose_stamped
from hrca_msgs.msg import RobotTaskAction, RobotTaskFeedback, RobotTaskResult, RobotTaskGoal
from hrca_msgs.srv import GetRobotPose, get_object_angle, get_object_angleResponse
from hrca_action.utilities import *
from geometry_msgs.msg import PoseArray, Pose, PoseStamped
from smach import CBState
from std_msgs.msg import Empty
from scipy.spatial.transform import Rotation
from gtts import gTTS
import numpy as np
import time
import rospy
import actionlib
import geometry_msgs.msg
import os
import smach
import smach_ros



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
    goal.action = action
    goal.pose1 = pose1
    goal.pose2 = pose2
    goal.object_name = obj_name

    client.send_goal(goal, feedback_cb=feedback_cb)

    client.wait_for_result()

    result = client.get_result()

    return result

## TINS

def get_EE_pose_wrt_obj(name, pub):

    object_config =	{
        "SPAM": {"ID": 29, "offset": [0, 0.02]},
        "SOUP": {"ID": 1, "offset": [0, 0]},
        "COCO": {"ID": 2, "offset": [0, 0]},
        "BEEF": {"ID": 3, "offset": [0, 0]},
        "VAPO": {"ID": 4, "offset": [0, 0]},
        "MUESLI": {"ID": 5, "offset": [0, 0]},
        "TOMATO": {"ID": 10, "offset": [0, 0]},
        "BEANS": {"ID": 6, "offset": [0, 0]},
        "CORN": {"ID": 11, "offset": [0, 0]},
        "APPLE": {"ID": 9, "offset": [0, 0]},
        "RITZ": {"ID": 8, "offset": [0, 0]},
        "VITA": {"ID": 7, "offset": [0, 0]},
        "SOUP2": {"ID": 12, "offset": [0, 0]},
        "SOUP3": {"ID": 15, "offset": [0, 0]},
        "SUGAR": {"ID": 14, "offset": [0, 0]},
        "bad_object": {"ID": -1, "offset": [0, 0]}
    }

    rospy.wait_for_service('get_object_angle')

    try:
        get_obj_pos = rospy.ServiceProxy('get_object_angle', get_object_angle)
        print("test: ", object_config[name]["ID"])
        resp = get_obj_pos(object_config[name]["ID"], True)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
    except KeyError:
        print("\"" + name + "\"" " is not in the object list. Maybe add it in?")
        return None

    if resp.success: 
        trans_angle = resp.angle
        rot_angle = (-1*(trans_angle + 90))
        f = lambda x : (x+180) % 360 - 180
        rot_angle_list = np.array([f(rot_angle), f(rot_angle + 180)])
        min_angle_idx = np.argmin(np.abs(rot_angle_list))
        rot_angle = rot_angle_list[min_angle_idx]

        cart_pos = resp.Cartesian_Pos
        cam_pos = resp.Cam_Pos
        x_off = object_config[name]["offset"][0]
        y_off = object_config[name]["offset"][1]
        x_rot_dir = np.matmul(rot_around_z(trans_angle), np.array([[1], [0], [1]]))
        y_rot_dir = np.matmul(rot_around_z(trans_angle), np.array([[0], [1], [1]]))
        x_offset = x_off*x_rot_dir[0] + y_off*y_rot_dir[0]
        y_offset = x_off*x_rot_dir[1] + y_off*y_rot_dir[1]

        pose_goal = PoseStamped()
        pose_goal.pose.position.z = cart_pos[2] + 0.15
        pose_goal.pose.position.x = cart_pos[0] + float(x_offset)
        pose_goal.pose.position.y = cart_pos[1] + float(y_offset)

        rospy.wait_for_service('/panda_arm_server/get_robot_pose')

        try:
            get_obj_pos = rospy.ServiceProxy('/panda_arm_server/get_robot_pose', GetRobotPose)
            pose_resp = get_obj_pos('world')
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

        print(pose_resp)
        r = Rotation.from_quat([pose_resp.pose_stamped.pose.orientation.x, pose_resp.pose_stamped.pose.orientation.y, pose_resp.pose_stamped.pose.orientation.z, pose_resp.pose_stamped.pose.orientation.w])
        r_matrix = np.matmul(np.array(list(r.as_dcm())), rot_around_z(rot_angle))
        r_rotated = Rotation.from_dcm(r_matrix)

        orient = list(r_rotated.as_quat())
        pose_goal.pose.orientation.w = orient[3]
        pose_goal.pose.orientation.z = orient[2]
        pose_goal.pose.orientation.y = orient[1]
        pose_goal.pose.orientation.x = orient[0]

        r_object_matrix = np.matmul(np.eye(3), rot_around_z(rot_angle)) 
        r_object_rotated = Rotation.from_dcm(r_matrix)
        object_orient = list(r_object_rotated.as_quat())

        return pose_goal, object_orient
        
    else:
        print(resp.error)
        return None

def rot_around_z(angle):
    angle_in_deg = angle*math.pi/180
    return np.array([[math.cos(angle_in_deg), -math.sin(angle_in_deg), 0], [math.sin(angle_in_deg), math.cos(angle_in_deg), 0], [0, 0, 1]])

def get_object_info(item_dict, pub, item_name, place_pose):
    pick_height = item_dict[item_name][2] - 0.02 # grip at two cm from top of object 
    centre_height = (item_dict[item_name][2]) / 2 # z coord of centre 
    [pose_goal, object_orient] = get_EE_pose_wrt_obj(item_name, pub)
    pose = create_pose_stamped(create_pose(pose_goal.pose.position.x, pose_goal.pose.position.y, centre_height, object_orient[0], object_orient[1], object_orient[2], object_orient[3]), "panda_link0") 
    pick = create_pose_stamped(create_pose(pose_goal.pose.position.x, pose_goal.pose.position.y, pick_height, pose_goal.pose.orientation.x, pose_goal.pose.orientation.y, pose_goal.pose.orientation.z, pose_goal.pose.orientation.w), "panda_link0") 
    
    if (place_pose == "first"):
        place_y = 0.1
    elif (place_pose == "second"):
        place_y = 0
    elif (place_pose == "third"):
        place_y = -0.1

    place = create_pose_stamped(create_pose(0.65403, place_y, pick_height - 0.02, -1, 0, 0, 0), "panda_link0") 
    return (pose, pick, place)

def get_human_obj_info(human_dict, pub, item_name):
    centre_height = (human_dict[item_name][2]) / 2 # z coord of centre 
    [pose_goal, object_orient] = get_EE_pose_wrt_obj(item_name, pub)
    pose = create_pose_stamped(create_pose(pose_goal.pose.position.x, pose_goal.pose.position.y, centre_height, object_orient[0], object_orient[1], object_orient[2], object_orient[3]), "panda_link0") 
    return pose

if __name__ == '__main__':
    rospy.init_node("panda_arm_client_py")
    
    # TEXT TO SPEECH 
    language = 'en'

    ### from test_panda_arm_action_server.py
    panda_arm = PandaArm(simulation=True)

    # READY POSITION
    recovery_client()
    panda_arm.move_to_home()

    # ITEM DICTIONARY
    item_size = {
        "SPAM": (0.1, 0.055, 0.063), # x, y, z
        "BEEF": (0.08, 0.063, 0.072),
        "RITZ": (0.15, 0.055, 0.19),
        "MUESLI": (0.18, 0.04, 0.115),
        "VAPO": (0.11, 0.035, 0.06),
        "VITA": (0.2, 0.07, 0.095),
        "SUGAR": (0.11, 0.04, 0.15), 
        "COCO":(0.088, 0.0265), # height, radius 
        "CAN": (0.09, 0.038)
    }

    human_obj_dict = {
        "VAPO": (0.11, 0.035, 0.06)
    }

    # SCANNING POSITIONS
    scan_pose1 = create_pose_stamped(create_pose(0.15, 0.40, 0.40, -1, 0, 0, 0), "panda_link0") 
    scan_pose2 = create_pose_stamped(create_pose(-0.15, 0.40, 0.40, -1, 0, 0, 0), "panda_link0") 
    scan_pose_middle = create_pose_stamped(create_pose(0, 0.4, 0.40, -1, 0, 0, 0), "panda_link0") 

    # DEMO
    # place1 = create_pose_stamped(create_pose(0.65403, -0.1, 0.03, -1, 0, 0, 0), "panda_link0") 
    row1_x = 0.65403
    row1_left =  0.1
    row1_mid = 0
    row1_right = -0.1
    # place2 = create_pose_stamped(create_pose(0.65403, 0, 0.03, -1, 0, 0, 0), "panda_link0") 
    # place3 = create_pose_stamped(create_pose(0.65403, 0.1, 0.03, -1, 0, 0, 0), "panda_link0") 
    # place4 = create_pose_stamped(create_pose(0.51576, 0, 0.03, -1, 0, 0, 0), "panda_link0")
    # place5 = create_pose_stamped(create_pose(0.51576, -0.1, 0.03, -1, 0, 0, 0), "panda_link0")

    box_bottom_pose = create_pose_stamped(create_pose(0.595 - 0.02, 0, 0.00125, -1, 0, 0, 0), "panda_link0")
    box_east_pose = create_pose_stamped(create_pose(0.595 - 0.02, 0.225 - 0.5*0.0025, 0.105 + 0.0025, -1, 0, 0, 0), "panda_link0")
    box_west_pose = create_pose_stamped(create_pose(0.595 - 0.02, -0.225 + 0.5*0.0025, 0.105 + 0.0025, -1, 0, 0, 0), "panda_link0")
    box_south_pose = create_pose_stamped(create_pose(0.41 + 0.5*0.0025 - 0.02, 0, 0.105 + 0.0025, -1, 0, 0, 0), "panda_link0")
    box_north_pose = create_pose_stamped(create_pose(0.78 - 0.5*0.0025 - 0.02, 0, 0.105 + 0.0025, -1, 0, 0, 0), "panda_link0")
    table_pose = create_pose_stamped(create_pose(0, 0, -0.01, -1, 0, 0, 0), "panda_link0")
    
    try:
        # ADD MOVEIT COLLISION OBJECTS - to move to outside boxes so generated only once 
        moh = MoveitObjectHandler()
        moh.remove_all_objects()

        # table 
        table_size = (1.84, 1.40, 0.02)
        table_rotation = (0, 0, 0)

        # packing box 
        box_bottom_size = (0.37, 0.45, 0.0025)
        box_bottom_rotation = (0, 0, 0)
        box_short_size = (0.0025, 0.365, 0.21) # east and west 
        box_short_rotation = (0, 0, 90)
        box_long_size = (0.0025, 0.45, 0.21) # north and south 
        box_long_rotation = (0, 0, 0)

        # SET PLANNING SCENE
        moh.add_box_object("box_bottom", pose=box_bottom_pose, size=box_bottom_size, rotation=box_bottom_rotation, frame="panda_link0")
        moh.add_box_object("box_east", pose=box_east_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_west", pose=box_west_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_north", pose=box_north_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("box_south", pose=box_south_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("table", pose=table_pose, size=table_size, rotation=table_rotation, frame="panda_link0")
        
        # tts = gTTS('Hi, my name is Franky. I will be helping you pack your boxes today.')
        # tts.save('intro.mp3')
        # tts = gTTS('I will start packing')
        # tts.save('start.mp3')
        # tts = gTTS('I am moving to scanning pose')
        # tts.save('scan.mp3')
        # tts = gTTS('I am about to pack my first object')
        # tts.save('first.mp3')
        # tts = gTTS('Now, I will pack my second object')
        # tts.save('second.mp3')
        # tts = gTTS('Next, I will pack my third object')
        # tts.save('third.mp3')
        # tts = gTTS('I am about to pick up my second last object')
        # tts.save('fourth.mp3')
        # tts = gTTS('I will now pick up my final object')
        # tts.save('fifth.mp3')
        # tts = gTTS('I have packed all my objects')
        # tts.save('finished.mp3')
        
        # os.system("mpg321 --gain 30 scan.mp3")
        os.system("mpg321 --gain 20 intro.mp3")
        os.system("mpg321 --gain 20 scan.mp3")

        # SCAN FOR OBJECTS 
        recovery_client()
        panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
        result = call_server("move_to_pose", scan_pose1, scan_pose1, "")
        # result = call_server("move_to_pose", scan_pose2, scan_pose2, "")
        # time.sleep(3)
        # result = call_server("move_to_pose", scan_pose_middle, scan_pose_middle, "")
        # time.sleep(3)

        # INITIALISE PUBLISHER
        pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
        
        # DEFINE PACKING OBJECTS 
        [beef_pose, beef_pick, beef_place] = get_object_info(item_size, pub, "BEEF", "first")
        [spam_pose, spam_pick, spam_place] = get_object_info(item_size, pub, "SPAM", "second")

        
        [pose_goal_coco, object_orient_coco] = get_EE_pose_wrt_obj("COCO", pub)
        coco_pose = create_pose_stamped(create_pose(pose_goal_coco.pose.position.x, pose_goal_coco.pose.position.y, 0.035, object_orient_coco[0], object_orient_coco[1], object_orient_coco[2], object_orient_coco[3]), "panda_link0") 
        coco_pick = create_pose_stamped(create_pose(pose_goal_coco.pose.position.x, pose_goal_coco.pose.position.y, 0.05, pose_goal_coco.pose.orientation.x, pose_goal_coco.pose.orientation.y, pose_goal_coco.pose.orientation.z, pose_goal_coco.pose.orientation.w), "panda_link0") 
        coco_place = create_pose_stamped(create_pose(0.65403, -0.1, 0.05, -1, 0, 0, 0), "panda_link0") 
        
        # ADD COLLISION OBJECTS
        moh.add_box_object("beef", pose=beef_pose, size=item_size["BEEF"], rotation=(0,0,0), frame="panda_link0")
        moh.add_box_object("spam", pose=spam_pose, size=item_size["SPAM"], rotation=(0,0,0), frame="panda_link0")
        moh.add_cylinder_object("coco", pose=coco_pose, height=item_size["COCO"][0], radius=item_size["COCO"][1], rotation=(0,0,0), frame="panda_link0")
        
        # PICK AND PLACE OBJECTS 
        os.system("mpg321 --gain 20 start.mp3")
        os.system("mpg321 --gain 20 first.mp3")
        
        recovery_client()

        result = call_server("pick_and_place", beef_pick, beef_place, "beef")
        moh.remove_world_object("beef")

        os.system("mpg321 --gain 20 second.mp3")
        
        result = call_server("pick_and_place", spam_pick, spam_place, "spam")
        moh.remove_world_object("spam")

        os.system("mpg321 --gain 20 third.mp3")

        result = call_server("pick_and_place", coco_pick, coco_place, "coco")
        moh.remove_world_object("coco")

        os.system("mpg321 --gain 20 finished.mp3")
        panda_arm.move_to_home()

        print result
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e