#! /usr/bin/env python2.7
import rospy
import actionlib
from hrca_action.panda_arm import PandaArm 
from hrca_action.utilities import create_pose, create_pose_stamped
from hrca_msgs.msg import RobotTaskAction, RobotTaskFeedback, RobotTaskResult, RobotTaskGoal
from hrca_msgs.srv import GetRobotPose, get_object_angle, get_object_angleResponse
from hrca_action.utilities import *
import geometry_msgs.msg
from geometry_msgs.msg import PoseArray, Pose, PoseStamped
# import pyttsx3
from gtts import gTTS
import numpy as np
import time

import os
import smach
import smach_ros
from smach import CBState
#from smach_ros import MonitorStateS
from std_msgs.msg import Empty
from scipy.spatial.transform import Rotation




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
        # pose_goal = commander.get_current_pose().pose
        pose_goal = PoseStamped()
        pose_goal.pose.position.z = cart_pos[2] + 0.15
        pose_goal.pose.position.x = cart_pos[0] + float(x_offset)
        pose_goal.pose.position.y = cart_pos[1] + float(y_offset)
        # r = Rotation.from_quat([pose_goal.pose.orientation.x, pose_goal.pose.orientation.y, pose_goal.pose.orientation.z, pose_goal.pose.orientation.w])
        # r_matrix = np.matmul(np.array(list(r.as_dcm())), rot_around_z(rot_angle))
        # r_rotated = Rotation.from_dcm(r_matrix)

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
        
        # pose_pub = PoseArray()
        # pose_goal_pub = copy.deepcopy(pose_goal)
        # x_axis_pose = Pose(pose_goal_pub.position, pose_goal_pub.orientation)
        # x_axis_pose.position.z = cart_pos[2] + 0.02
        # pose_pub.poses.append(x_axis_pose)
        # pose_pub.header.frame_id = 'panda_link0'
        # rate = rospy.Rate(10)
        # while not rospy.is_shutdown():
        #     pub.publish(pose_pub)
        #     rate.sleep()
        # raw_input("Ready?")

        return pose_goal, object_orient
        
    else:
        print(resp.error)
        return None

def rot_around_z(angle):
    angle_in_deg = angle*math.pi/180
    return np.array([[math.cos(angle_in_deg), -math.sin(angle_in_deg), 0], [math.sin(angle_in_deg), math.cos(angle_in_deg), 0], [0, 0, 1]])



if __name__ == '__main__':
    rospy.init_node("panda_arm_client_py")
    
    ### TEXT TO SPEECH 
    language = 'en'

    ### from test_panda_arm_action_server.py
    panda_arm = PandaArm(simulation=True)

    recovery_client()
    panda_arm.move_to_home()

    # ITEM DICTIONARY
    item_size = {
        "SPAM": (0.1, 0.055, 0.06), # x, y, z
        "BEEF": (0.08, 0.063, 0.072),
        "RITZ": (0.15, 0.055, 0.19),
        "MUESLI": (0.18, 0.04, 0.115),
        "VAPO": (0.11, 0.035, 0.06),
        "VITA": (0.2, 0.07, 0.095),
        "SUGAR": (0.11, 0.04, 0.15), 
        "COCO":(0.10, 0.035), # height, radius 
        "CAN": (0.09, 0.038)
    }

    # SCANNING POSITIONS
    scan_pose1 = create_pose_stamped(create_pose(0.15, 0.40, 0.40, -1, 0, 0, 0), "panda_link0") 
    scan_pose2 = create_pose_stamped(create_pose(-0.15, 0.40, 0.40, -1, 0, 0, 0), "panda_link0") 
    scan_pose_middle = create_pose_stamped(create_pose(0, 0.4, 0.40, -1, 0, 0, 0), "panda_link0") 

    # DEMO
    place1 = create_pose_stamped(create_pose(0.65403, -0.1, 0.03, -1, 0, 0, 0), "panda_link0") 
    place2 = create_pose_stamped(create_pose(0.65403, 0, 0.03, -1, 0, 0, 0), "panda_link0") 
    place3 = create_pose_stamped(create_pose(0.65403, 0.1, 0.03, -1, 0, 0, 0), "panda_link0") 
    place4 = create_pose_stamped(create_pose(0.51576, 0, 0.03, -1, 0, 0, 0), "panda_link0")
    place5 = create_pose_stamped(create_pose(0.51576, -0.1, 0.03, -1, 0, 0, 0), "panda_link0")

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

        # packing objects
        spam_size = (0.1, 0.055, 0.06) # take away 2 cm from the z because table is higher than should be 
        spam_rotation = (0, 0, 0)

        beef_size = (0.08, 0.063, 0.072)
        beef_rotation = (0, 0, 0)

        ritz_size = (0.15, 0.055, 0.19)
        ritz_rotation = (0, 0, 0)
        
        muesli_size = (0.18, 0.04, 0.115)
        muesli_rotation = (0, 0, 0)

        vapo_size = (0.11, 0.035, 0.06)
        vapo_rotation = (0, 0, 0)
        
        vita_size = (0.2, 0.07, 0.095)
        vita_rotation = (0, 0, 0)

        sugar_size = (0.11, 0.04, 0.15)
        sugar_rotation = (0, 0, 0)

        coffee_rotation = (0, 0, 0)
        coffee_height = 0.10
        coffee_radius = 0.035

        coco_rotation = (0, 0, 0)
        coco_height = 0.07 # take away 2 cm because of panda base 
        coco_radius = 0.027

        can_rotation = (0, 0, 0)
        can_height = 0.09 # take away 2 cm because of panda base 
        can_radius = 0.038

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
        
        # LOOK FOR OBJECT
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
        recovery_client()
        panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
        result = call_server("move_to_pose", scan_pose1, scan_pose1, "")
        # result = call_server("move_to_pose", scan_pose2, scan_pose2, "")
        # time.sleep(3)
        # result = call_server("move_to_pose", scan_pose_middle, scan_pose_middle, "")
        # time.sleep(3)

        # INITIALISE PUBLISHER
        pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
        
        # # DEFINE PACKING OBJECTS 
        # beef
        # [pose_goal_beef, object_orient_beef] = get_EE_pose_wrt_obj("BEEF", pub)
        # beef_pose = create_pose_stamped(create_pose(pose_goal_beef.pose.position.x, pose_goal_beef.pose.position.y, 0.036, object_orient_beef[0], object_orient_beef[1], object_orient_beef[2], object_orient_beef[3]), "panda_link0") 
        # beef_pick = create_pose_stamped(create_pose(pose_goal_beef.pose.position.x, pose_goal_beef.pose.position.y, 0.05, pose_goal_beef.pose.orientation.x, pose_goal_beef.pose.orientation.y, pose_goal_beef.pose.orientation.z, pose_goal_beef.pose.orientation.w), "panda_link0") 

        # # spam
        # [pose_goal_spam, object_orient_spam] = get_EE_pose_wrt_obj("SPAM", pub)
        # spam_pose = create_pose_stamped(create_pose(pose_goal_spam.pose.position.x, pose_goal_spam.pose.position.y, 0.031, object_orient_spam[0], object_orient_spam[1], object_orient_spam[2], object_orient_spam[3]), "panda_link0") 
        # spam_pick = spam_pose
        # spam_pick.pose.position.z = 0.035 
        # spam_pick.pose.orientation.x = pose_goal_spam.pose.orientation.x
        # spam_pick.pose.orientation.y = pose_goal_spam.pose.orientation.y
        # spam_pick.pose.orientation.z = pose_goal_spam.pose.orientation.z
        # spam_pick.pose.orientation.w = pose_goal_spam.pose.orientation.w
        
        # # coco
        # [pose_goal_coco, object_orient_coco] = get_EE_pose_wrt_obj("COCO", pub)
        # coco_pose = create_pose_stamped(create_pose(pose_goal_coco.pose.position.x, pose_goal_coco.pose.position.y, 0.035, object_orient_coco[0], object_orient_coco[1], object_orient_coco[2], object_orient_coco[3]), "panda_link0") 
        # coco_pick = create_pose_stamped(create_pose(pose_goal_coco.pose.position.x, pose_goal_coco.pose.position.y, 0.05, pose_goal_coco.pose.orientation.x, pose_goal_coco.pose.orientation.y, pose_goal_coco.pose.orientation.z, pose_goal_coco.pose.orientation.w), "panda_link0") 

        # # soup  
        # [pose_goal_soup, object_orient_soup] = get_EE_pose_wrt_obj("SOUP", pub)
        # soup_pose = create_pose_stamped(create_pose(pose_goal_soup.pose.position.x, pose_goal_soup.pose.position.y, 0.045, object_orient_soup[0], object_orient_soup[1], object_orient_soup[2], object_orient_soup[3]), "panda_link0") 
        # soup_pick = create_pose_stamped(create_pose(pose_goal_soup.pose.position.x, pose_goal_soup.pose.position.y, 0.07, pose_goal_soup.pose.orientation.x, pose_goal_soup.pose.orientation.y, pose_goal_soup.pose.orientation.z, pose_goal_soup.pose.orientation.w), "panda_link0") 

        # soup 2
        [pose_goal_soup2, object_orient_soup2] = get_EE_pose_wrt_obj("SOUP2", pub)
        soup2_pose = create_pose_stamped(create_pose(pose_goal_soup2.pose.position.x, pose_goal_soup2.pose.position.y, 0.045, object_orient_soup2[0], object_orient_soup2[1], object_orient_soup2[2], object_orient_soup2[3]), "panda_link0") 
        soup2_pick = create_pose_stamped(create_pose(pose_goal_soup2.pose.position.x, pose_goal_soup2.pose.position.y, 0.07, pose_goal_soup2.pose.orientation.x, pose_goal_soup2.pose.orientation.y, pose_goal_soup2.pose.orientation.z, pose_goal_soup2.pose.orientation.w), "panda_link0") 

        # soup 3
        [pose_goal_soup3, object_orient_soup3] = get_EE_pose_wrt_obj("SOUP3", pub)
        soup3_pose = create_pose_stamped(create_pose(pose_goal_soup3.pose.position.x, pose_goal_soup3.pose.position.y, 0.045, object_orient_soup3[0], object_orient_soup3[1], object_orient_soup3[2], object_orient_soup3[3]), "panda_link0") 
        soup3_pick = create_pose_stamped(create_pose(pose_goal_soup3.pose.position.x, pose_goal_soup3.pose.position.y, 0.07, pose_goal_soup3.pose.orientation.x, pose_goal_soup3.pose.orientation.y, pose_goal_soup3.pose.orientation.z, pose_goal_soup3.pose.orientation.w), "panda_link0") 
        
        # corn
        [pose_goal_corn, object_orient_corn] = get_EE_pose_wrt_obj("CORN", pub)
        corn_pose = create_pose_stamped(create_pose(pose_goal_corn.pose.position.x, pose_goal_corn.pose.position.y, 0.045, object_orient_corn[0], object_orient_corn[1], object_orient_corn[2], object_orient_corn[3]), "panda_link0") 
        corn_pick = create_pose_stamped(create_pose(pose_goal_corn.pose.position.x, pose_goal_corn.pose.position.y, 0.07, pose_goal_corn.pose.orientation.x, pose_goal_corn.pose.orientation.y, pose_goal_corn.pose.orientation.z, pose_goal_corn.pose.orientation.w), "panda_link0") 
        
        # # apple
        # [pose_goal_apple, object_orient_apple] = get_EE_pose_wrt_obj("APPLE", pub)
        # apple_pose = create_pose_stamped(create_pose(pose_goal_apple.pose.position.x, pose_goal_apple.pose.position.y, 0.045, object_orient_apple[0], object_orient_apple[1], object_orient_apple[2], object_orient_apple[3]), "panda_link0") 
        # apple_pick = create_pose_stamped(create_pose(pose_goal_apple.pose.position.x, pose_goal_apple.pose.position.y, 0.07, pose_goal_apple.pose.orientation.x, pose_goal_apple.pose.orientation.y, pose_goal_apple.pose.orientation.z, pose_goal_apple.pose.orientation.w), "panda_link0") 
        
        # # beans
        # [pose_goal_beans, object_orient_beans] = get_EE_pose_wrt_obj("BEANS", pub)
        # beans_pose = create_pose_stamped(create_pose(pose_goal_beans.pose.position.x, pose_goal_beans.pose.position.y, 0.045, object_orient_beans[0], object_orient_beans[1], object_orient_beans[2], object_orient_beans[3]), "panda_link0") 
        # beans_pick = create_pose_stamped(create_pose(pose_goal_beans.pose.position.x, pose_goal_beans.pose.position.y, 0.07, pose_goal_beans.pose.orientation.x, pose_goal_beans.pose.orientation.y, pose_goal_beans.pose.orientation.z, pose_goal_beans.pose.orientation.w), "panda_link0") 
        
        # # tomato
        [pose_goal_tomato, object_orient_tomato] = get_EE_pose_wrt_obj("TOMATO", pub)
        tomato_pose = create_pose_stamped(create_pose(pose_goal_tomato.pose.position.x, pose_goal_tomato.pose.position.y, 0.045, object_orient_tomato[0], object_orient_tomato[1], object_orient_tomato[2], object_orient_tomato[3]), "panda_link0") 
        tomato_pick = create_pose_stamped(create_pose(pose_goal_tomato.pose.position.x, pose_goal_tomato.pose.position.y, 0.07, pose_goal_tomato.pose.orientation.x, pose_goal_tomato.pose.orientation.y, pose_goal_tomato.pose.orientation.z, pose_goal_tomato.pose.orientation.w), "panda_link0") 
        
        # # ritz
        # [pose_goal_ritz, object_orient_ritz] = get_EE_pose_wrt_obj("RITZ", pub)
        # ritz_pose = create_pose_stamped(create_pose(pose_goal_ritz.pose.position.x, pose_goal_ritz.pose.position.y, 0.085, object_orient_ritz[0], object_orient_ritz[1], object_orient_ritz[2], object_orient_ritz[3]), "panda_link0") 
        # ritz_pick = create_pose_stamped(create_pose(pose_goal_ritz.pose.position.x, pose_goal_ritz.pose.position.y, 0.18, pose_goal_ritz.pose.orientation.x, pose_goal_ritz.pose.orientation.y, pose_goal_ritz.pose.orientation.z, pose_goal_ritz.pose.orientation.w), "panda_link0") 

        # # vapo
        # [pose_goal_vapo, object_orient_vapo] = get_EE_pose_wrt_obj("VAPO", pub)
        # vapo_pose = create_pose_stamped(create_pose(pose_goal_vapo.pose.position.x, pose_goal_vapo.pose.position.y, 0.03, object_orient_vapo[0], object_orient_vapo[1], object_orient_vapo[2], object_orient_vapo[3]), "panda_link0") 
        # vapo_pick = create_pose_stamped(create_pose(pose_goal_vapo.pose.position.x, pose_goal_vapo.pose.position.y, 0.04, pose_goal_vapo.pose.orientation.x, pose_goal_vapo.pose.orientation.y, pose_goal_vapo.pose.orientation.z, pose_goal_vapo.pose.orientation.w), "panda_link0") 

        # # muesli
        # [pose_goal_muesli, object_orient_muesli] = get_EE_pose_wrt_obj("MUESLI", pub)
        # muesli_pose = create_pose_stamped(create_pose(pose_goal_muesli.pose.position.x, pose_goal_muesli.pose.position.y, 0.0575, object_orient_muesli[0], object_orient_muesli[1], object_orient_muesli[2], object_orient_muesli[3]), "panda_link0") 
        # muesli_pick = create_pose_stamped(create_pose(pose_goal_muesli.pose.position.x, pose_goal_muesli.pose.position.y, 0.105, pose_goal_muesli.pose.orientation.x, pose_goal_muesli.pose.orientation.y, pose_goal_muesli.pose.orientation.z, pose_goal_muesli.pose.orientation.w), "panda_link0") 

        # # vita
        # [pose_goal_vita, object_orient_vita] = get_EE_pose_wrt_obj("VITA", pub)
        # vita_pose = create_pose_stamped(create_pose(pose_goal_vita.pose.position.x, pose_goal_vita.pose.position.y, 0.0475, object_orient_vita[0], object_orient_vita[1], object_orient_vita[2], object_orient_vita[3]), "panda_link0") 
        # vita_pick = create_pose_stamped(create_pose(pose_goal_vita.pose.position.x, pose_goal_vita.pose.position.y, 0.085, pose_goal_vita.pose.orientation.x, pose_goal_vita.pose.orientation.y, pose_goal_vita.pose.orientation.z, pose_goal_vita.pose.orientation.w), "panda_link0") 

        # # sugar 
        # [pose_goal_sugar, object_orient_sugar] = get_EE_pose_wrt_obj("SUGAR", pub)
        # sugar_pose = create_pose_stamped(create_pose(pose_goal_sugar.pose.position.x, pose_goal_sugar.pose.position.y, 0.075, object_orient_sugar[0], object_orient_sugar[1], object_orient_sugar[2], object_orient_sugar[3]), "panda_link0") 
        # sugar_pick = create_pose_stamped(create_pose(pose_goal_sugar.pose.position.x, pose_goal_sugar.pose.position.y, 0.14, pose_goal_sugar.pose.orientation.x, pose_goal_sugar.pose.orientation.y, pose_goal_sugar.pose.orientation.z, pose_goal_sugar.pose.orientation.w), "panda_link0") 

        # ADD COLLISION OBJECTS
        # moh.add_box_object("beef", pose=beef_pose, size=beef_size, rotation=beef_rotation, frame="panda_link0")
        # moh.add_box_object("spam", pose=spam_pose, size=spam_size, rotation=spam_rotation, frame="panda_link0")
        # moh.add_cylinder_object("coco", pose=coco_pose, height=coco_height, radius=coco_radius, rotation=coco_rotation, frame="panda_link0")
        # moh.add_cylinder_object("soup", pose=soup_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")

        moh.add_cylinder_object("soup2", pose=soup2_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")
        moh.add_cylinder_object("soup3", pose=soup3_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")
        moh.add_cylinder_object("corn", pose=corn_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")
        # moh.add_cylinder_object("apple", pose=apple_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")
        # moh.add_cylinder_object("beans", pose=beans_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")
        moh.add_cylinder_object("tomato", pose=tomato_pose, height=can_height, radius=can_radius, rotation=can_rotation, frame="panda_link0")
        
        # moh.add_box_object("ritz", pose=ritz_pose, size=ritz_size, rotation=ritz_rotation, frame="panda_link0")
        # moh.add_box_object("vita", pose=vita_pose, size=vita_size, rotation=vita_rotation, frame="panda_link0")
        # moh.add_box_object("muesli", pose=muesli_pose, size=muesli_size, rotation=muesli_rotation, frame="panda_link0")
        # moh.add_box_object("sugar", pose=sugar_pose, size=sugar_size, rotation=sugar_rotation, frame="panda_link0")
        # moh.add_box_object("vapo", pose=vapo_pose, size=vapo_size, rotation=vapo_rotation, frame="panda_link0")

        # PICK AND PLACE OBJECTS 
        os.system("mpg321 --gain 20 start.mp3")
        os.system("mpg321 --gain 20 first.mp3")
        
        recovery_client()
        # result = call_server("pick_and_place", beef_pick, beef_place, "beef")
        # moh.remove_world_object("beef")

        os.system("mpg321 --gain 20 second.mp3")
        
        # result = call_server("pick_and_place", spam_pick, spam_place, "spam")
        # moh.remove_world_object("spam")

        os.system("mpg321 --gain 20 third.mp3")

        # result = call_server("pick_and_place", coco_pick, coco_place, "coco")
        # moh.remove_world_object("coco")
        # result = call_server("pick_and_place", soup_pick, soup_place, "soup")
        # moh.remove_world_object("soup")        

        result = call_server("pick_and_place", soup2_pick, place1, "soup2")
        moh.remove_world_object("soup2")   
        result = call_server("pick_and_place", soup3_pick, place2, "soup3")
        moh.remove_world_object("soup3")   
        result = call_server("pick_and_place", corn_pick, place3, "corn")
        moh.remove_world_object("corn")  
        # result = call_server("pick_and_place", apple_pick, apple_place, "apple")
        # moh.remove_world_object("apple") 
        # result = call_server("pick_and_place", beans_pick, beans_place, "beans")
        # moh.remove_world_object("beans")
        result = call_server("pick_and_place", tomato_pick, place4, "tomato")
        moh.remove_world_object("tomato")

        # result = call_server("pick_and_place", ritz_pick, ritz_place, "ritz")
        # moh.remove_world_object("ritz")   
        # result = call_server("pick_and_place", sugar_pick, sugar_place, "sugar")
        # moh.remove_world_object("sugar")   
        # result = call_server("pick_and_place", muesli_pick, muesli_place, "muesli")
        # moh.remove_world_object("muesli")  

        # os.system("mpg321 --gain 20 fifth.mp3")

        # result = call_server("pick_and_place", vita_pick, vita_place, "vita")
        # moh.remove_world_object("vita") 

        os.system("mpg321 --gain 20 finished.mp3")
        # result = call_server("pick_and_place", vapo_pick, vapo_place, "vapo")
        # moh.remove_world_object("vapo")



        # call pick and place action 
        # line1Obj = gTTS(line1, language, slow=False)
        # line1Obj.save("line1.mp3")
        # os.system("mpg123 line1.mp3")

        panda_arm.move_to_home()
        

        print result
    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e