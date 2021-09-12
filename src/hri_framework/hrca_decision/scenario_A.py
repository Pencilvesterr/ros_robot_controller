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
import subprocess

########################################################################################################################################################
#                                                                 SCENARIO A - NO ERROR                                                                #
########################################################################################################################################################  

PREFIX_PATH = "/home/hrigroup2/"
devnull = open('/dev/null', 'w')

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
        "COCO4": {"ID": 15, "offset": [0, 0]},
        "CORN": {"ID": 11, "offset": [0, 0]},
        "CORN2": {"ID": 12, "offset": [0, 0]},
        "SPAM": {"ID": 29, "offset": [0, 0.02]},
        "SPAM2": {"ID": 10, "offset": [0, 0.02]},
        "SPAM3": {"ID": 16, "offset": [0, 0.02]},
        "SPAM4": {"ID": 18, "offset": [0, 0.02]},
        "SPAM5": {"ID": 19, "offset": [0, 0.02]},
        "SPAM6": {"ID": 20, "offset": [0, 0.02]},
        "COCO": {"ID": 2, "offset": [0, 0]},
        "BEEF": {"ID": 3, "offset": [0, 0]},
        "BEEF2": {"ID": 3, "offset": [0, 0]},
        "VAPO": {"ID": 4, "offset": [0, 0]},
        "VAPO2": {"ID": 4, "offset": [0, 0]},
        "MUESLI": {"ID": 17, "offset": [0, 0]},
        "MUESLI2": {"ID": 17, "offset": [0, 0]},
        "RITZ": {"ID": 8, "offset": [0, 0]},
        "VITA": {"ID": 7, "offset": [0, 0]},
        "SUGAR": {"ID": 14, "offset": [0, 0]},
        "MAC": {"ID": 6, "offset": [0, 0]},
        "COCO2": {"ID": 9, "offset": [0, 0]},
        "COCO3": {"ID": 21, "offset": [0, 0]},
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

def get_object_info(item_dict, pub, item_name, place_pose, place_x, stack = "no_stack"):
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
    elif (place_pose == "highfirst"):
        place_y = 0.15
    elif (place_pose == "highsecond"):
        place_y = 0
    elif (place_pose == "highthird"):
        place_y = -0.1
    elif (place_pose == "highfourth"):
        place_y = -0.15
    elif (place_pose == "mistake"):
        place_y = 0.33

    if (stack == "no_stack"):
        place_height = pick_height - 0.02
    elif (stack == "stack"):
        place_height = 3*pick_height

    place = create_pose_stamped(create_pose(place_x, place_y, place_height, -1, 0, 0, 0), "panda_link0") 
    return (pose, pick, place)

def get_human_obj_info(human_dict, pub, item_name):
    centre_height = (human_dict[item_name][2]) / 2 # z coord of centre 
    [pose_goal, object_orient] = get_EE_pose_wrt_obj(item_name, pub)
    pose = create_pose_stamped(create_pose(pose_goal.pose.position.x, pose_goal.pose.position.y, centre_height, object_orient[0], object_orient[1], object_orient[2], object_orient[3]), "panda_link0") 
    return pose

# ERROR CONTINGENCY 
def error_catch(result):
    if result == False:     
        # safety delay 
        time.sleep(5)
        recovery_client()
        panda_arm.open_gripper() 
        panda_arm.move_to_home()
        p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
        time.sleep(0.5)
        p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "unplanned_error.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
        while p2.poll() is None:
            time.sleep(0.1)
        
        panda_arm.move_to_joint_positions([0.12809021813062493, -1.1867980979355053, -0.7125858780459354, -2.1369990339769145, -0.7091960798395155, 1.120845781087867, 0.35238409302740903])
        raw_input("Press Enter to continue")
        panda_arm.move_to_home()

# PARTICIPANT DEMONSTRATION 
def test():
    
    # DEMO PLACES
    row1_x = 0.45403
    row1_left =  0.1
    row1_mid = 0
    row1_right = -0.1

    os.system("mpg321 --gain 20 " + PREFIX_PATH + "scanning.mp3")

    # SCAN FOR OBJECTS 
    recovery_client()
    change_collision_behaviour_client()
    panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
    result = call_server("move_to_pose", scan_pose1, scan_pose1, "")

    # INITIALISE PUBLISHER
    pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
    
    # DEFINE PACKING OBJECTS 
    [beef2_pose, beef2_pick, beef2_place] = get_object_info(item_size, pub, "BEEF2", "second", row1_x)
    
    # ADD COLLISION OBJECTS
    moh.add_box_object("beef2", pose=beef2_pose, size=item_size["BEEF2"], rotation=(0,0,0), frame="panda_link0")
    
    # PICK AND PLACE OBJECTS 
    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "demo.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    
    while p2.poll() is None:
        time.sleep(0.1)
    
    recovery_client()

    result = call_server("pick_and_place", beef2_pick, beef2_place, "beef2")
    moh.remove_world_object("beef2")

    panda_arm.move_to_home()

    print result

# FIRST BOX 
def box1():
    
    # DEMO PLACES
    row1_x = 0.45403
    row1_left =  0.1
    row1_mid = 0
    row1_right = -0.1

    os.system("mpg321 --gain 20" + PREFIX_PATH + "scanning.mp3")

    # SCAN FOR OBJECTS 
    recovery_client()
    change_collision_behaviour_client()
    panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
    result = call_server("move_to_pose", scan_pose1, scan_pose1, "")

    # INITIALISE PUBLISHER
    pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
    
    # DEFINE PACKING OBJECTS 
    [beef_pose, beef_pick, beef_place] = get_object_info(item_size, pub, "BEEF", "first", row1_x)
    [spam_pose, spam_pick, spam_place] = get_object_info(item_size, pub, "SPAM", "second", row1_x)
    
    [pose_goal_coco, object_orient_coco] = get_EE_pose_wrt_obj("COCO", pub)
    coco_pose = create_pose_stamped(create_pose(pose_goal_coco.pose.position.x, pose_goal_coco.pose.position.y, 0.035, object_orient_coco[0], object_orient_coco[1], object_orient_coco[2], object_orient_coco[3]), "panda_link0") 
    coco_pick = create_pose_stamped(create_pose(pose_goal_coco.pose.position.x, pose_goal_coco.pose.position.y, 0.05, pose_goal_coco.pose.orientation.x, pose_goal_coco.pose.orientation.y, pose_goal_coco.pose.orientation.z, pose_goal_coco.pose.orientation.w), "panda_link0") 
    coco_place = create_pose_stamped(create_pose(row1_x, -0.1, 0.04, -1, 0, 0, 0), "panda_link0") 

    [vapo_pose, vapo_pick, vapo_place] = get_object_info(item_size, pub, "VAPO", "second", row1_x, "stack")
    
    # ADD COLLISION OBJECTS
    moh.add_box_object("beef", pose=beef_pose, size=item_size["BEEF"], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("spam", pose=spam_pose, size=item_size["SPAM"], rotation=(0,0,0), frame="panda_link0")
    moh.add_cylinder_object("coco", pose=coco_pose, height=item_size["COCO"][0], radius=item_size["COCO"][1], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("vapo", pose=vapo_pose, size=item_size["VAPO"], rotation=(0,0,0), frame="panda_link0")
    
    # PICK AND PLACE OBJECTS 
    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "first_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
    time.sleep(0.1)
    
    recovery_client()

    result = call_server("pick_and_place", beef_pick, beef_place, "beef")
    moh.remove_world_object("beef")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "second_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
    time.sleep(0.1)
    
    result = call_server("pick_and_place", spam_pick, spam_place, "spam")
    moh.remove_world_object("spam")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "third_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", coco_pick, coco_place, "coco")
    moh.remove_world_object("coco")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "last_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", vapo_pick, vapo_place, "vapo")
    moh.remove_world_object("vapo")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "finish.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    panda_arm.move_to_home()

    print result

# SECOND BOX 
def box2():
    # DEMO PLACES
    row1_x = 0.50403
    row1_left =  0.1
    row1_mid = 0
    row1_right = -0.1

    # os.system("mpg321 --gain 30 scan.mp3")
    os.system("mpg321 --gain 20 intro.mp3")
    os.system("mpg321 --gain 20 scan.mp3")

    # SCAN FOR OBJECTS 
    os.system("mpg321 --gain 20 " + PREFIX_PATH + "scanning.mp3")
    recovery_client()
    panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
    result = call_server("move_to_pose", scan_pose1, scan_pose1, "")

    # INITIALISE PUBLISHER
    pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
    
    # DEFINE PACKING OBJECTS 
    
    [spam5_pose, spam5_pick, spam5_place] = get_object_info(item_size, pub, "SPAM5", "third", row1_x)
    # [ritz_pose, ritz_pick, ritz_place] = get_object_info(item_size, pub, "RITZ", "highfirst", row1_x)

    [muesli_pose, muesli_pick, muesli_place] = get_object_info(item_size, pub, "MUESLI", "highfirst", row1_x)

    [spam6_pose, spam6_pick, spam6_place] = get_object_info(item_size, pub, "SPAM6", "third", row1_x, "stack")

    # [pose_goal_beans2, object_orient_beans2] = get_EE_pose_wrt_obj("BEANS2", pub)
    # beans2_pose = create_pose_stamped(create_pose(pose_goal_beans2.pose.position.x, pose_goal_beans2.pose.position.y, 0.05, object_orient_beans2[0], object_orient_beans2[1], object_orient_beans2[2], object_orient_beans2[3]), "panda_link0") 
    # beans2_pick = create_pose_stamped(create_pose(pose_goal_beans2.pose.position.x, pose_goal_beans2.pose.position.y, 0.07, pose_goal_beans2.pose.orientation.x, pose_goal_beans2.pose.orientation.y, pose_goal_beans2.pose.orientation.z, pose_goal_beans2.pose.orientation.w), "panda_link0") 
    # beans2_place = create_pose_stamped(create_pose(row1_x, 0, 0.05, -1, 0, 0, 0), "panda_link0") 

    [pose_goal_coco3, object_orient_coco3] = get_EE_pose_wrt_obj("COCO3", pub)
    coco3_pose = create_pose_stamped(create_pose(pose_goal_coco3.pose.position.x, pose_goal_coco3.pose.position.y, 0.035, object_orient_coco3[0], object_orient_coco3[1], object_orient_coco3[2], object_orient_coco3[3]), "panda_link0") 
    coco3_pick = create_pose_stamped(create_pose(pose_goal_coco3.pose.position.x, pose_goal_coco3.pose.position.y, 0.05, pose_goal_coco3.pose.orientation.x, pose_goal_coco3.pose.orientation.y, pose_goal_coco3.pose.orientation.z, pose_goal_coco3.pose.orientation.w), "panda_link0") 
    coco3_place = create_pose_stamped(create_pose(row1_x, 0, 0.04, -1, 0, 0, 0), "panda_link0") 
    
    # ADD COLLISION OBJECTS
    moh.add_cylinder_object("coco3", pose=coco3_pose, height=item_size["COCO3"][0], radius=item_size["COCO3"][1], rotation=(0,0,0), frame="panda_link0")
    # moh.add_cylinder_object("beans2", pose=beans2_pose, height=item_size["BEANS2"][0], radius=item_size["BEANS2"][1], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("spam5", pose=spam5_pose, size=item_size["SPAM5"], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("spam6", pose=spam6_pose, size=item_size["SPAM6"], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("muesli", pose=muesli_pose, size=item_size["MUESLI"], rotation=(0,0,0), frame="panda_link0")
    
    
    # PICK AND PLACE OBJECTS     
    recovery_client()

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "first_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)
    
    # result = call_server("pick_and_place", beans2_pick, beans2_place, "beans2")
    # moh.remove_world_object("beans2")

    result = call_server("pick_and_place", coco3_pick, coco3_place, "coco3")
    moh.remove_world_object("coco3")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "second_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)
    
    result = call_server("pick_and_place", spam5_pick, spam5_place, "spam5")
    moh.remove_world_object("spam5")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "third_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", spam6_pick, spam6_place, "spam6")
    moh.remove_world_object("spam6")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "last_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", muesli_pick, muesli_place, "muesli")
    moh.remove_world_object("muesli")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "finish.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    panda_arm.move_to_home()

    print result

# THIRD BOX 
def box3():
    
    # DEMO PLACES
    row1_x = 0.45403
    row1_left =  0.1
    row1_mid = 0
    row1_right = -0.1

    # os.system("mpg321 --gain 30 scan.mp3")
    os.system("mpg321 --gain 20 intro.mp3")
    os.system("mpg321 --gain 20 scan.mp3")

    # SCAN FOR OBJECTS 
    os.system("mpg321 --gain 20 " + PREFIX_PATH + "scanning.mp3")
    recovery_client()
    panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
    result = call_server("move_to_pose", scan_pose1, scan_pose1, "")

    # INITIALISE PUBLISHER
    pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
    
    # DEFINE PACKING OBJECTS 
    [spam2_pose, spam2_pick, spam2_place] = get_object_info(item_size, pub, "SPAM2", "first", row1_x)
    
    # [pose_goal_beans, object_orient_beans] = get_EE_pose_wrt_obj("BEANS", pub)
    # beans_pose = create_pose_stamped(create_pose(pose_goal_beans.pose.position.x, pose_goal_beans.pose.position.y, 0.05, object_orient_beans[0], object_orient_beans[1], object_orient_beans[2], object_orient_beans[3]), "panda_link0") 
    # beans_pick = create_pose_stamped(create_pose(pose_goal_beans.pose.position.x, pose_goal_beans.pose.position.y, 0.07, pose_goal_beans.pose.orientation.x, pose_goal_beans.pose.orientation.y, pose_goal_beans.pose.orientation.z, pose_goal_beans.pose.orientation.w), "panda_link0") 
    # beans_place = create_pose_stamped(create_pose(row1_x, 0, 0.05, -1, 0, 0, 0), "panda_link0") 

    [pose_goal_coco2, object_orient_coco2] = get_EE_pose_wrt_obj("COCO2", pub)
    coco2_pose = create_pose_stamped(create_pose(pose_goal_coco2.pose.position.x, pose_goal_coco2.pose.position.y, 0.035, object_orient_coco2[0], object_orient_coco2[1], object_orient_coco2[2], object_orient_coco2[3]), "panda_link0") 
    coco2_pick = create_pose_stamped(create_pose(pose_goal_coco2.pose.position.x, pose_goal_coco2.pose.position.y, 0.05, pose_goal_coco2.pose.orientation.x, pose_goal_coco2.pose.orientation.y, pose_goal_coco2.pose.orientation.z, pose_goal_coco2.pose.orientation.w), "panda_link0") 
    coco2_place = create_pose_stamped(create_pose(row1_x, 0, 0.04, -1, 0, 0, 0), "panda_link0")

    # [pose_goal_root, object_orient_root] = get_EE_pose_wrt_obj("ROOT", pub)
    # root_pose = create_pose_stamped(create_pose(pose_goal_root.pose.position.x, pose_goal_root.pose.position.y, 0.065, object_orient_root[0], object_orient_root[1], object_orient_root[2], object_orient_root[3]), "panda_link0") 
    # root_pick = create_pose_stamped(create_pose(pose_goal_root.pose.position.x, pose_goal_root.pose.position.y, 0.1, pose_goal_root.pose.orientation.x, pose_goal_root.pose.orientation.y, pose_goal_root.pose.orientation.z, pose_goal_root.pose.orientation.w), "panda_link0") 
    # root_place = create_pose_stamped(create_pose(row1_x, -0.1, 0.09, -1, 0, 0, 0), "panda_link0") 

    [pose_goal_coco4, object_orient_coco4] = get_EE_pose_wrt_obj("COCO4", pub)
    coco4_pose = create_pose_stamped(create_pose(pose_goal_coco4.pose.position.x, pose_goal_coco4.pose.position.y, 0.035, object_orient_coco4[0], object_orient_coco4[1], object_orient_coco4[2], object_orient_coco4[3]), "panda_link0") 
    coco4_pick = create_pose_stamped(create_pose(pose_goal_coco4.pose.position.x, pose_goal_coco4.pose.position.y, 0.05, pose_goal_coco4.pose.orientation.x, pose_goal_coco4.pose.orientation.y, pose_goal_coco4.pose.orientation.z, pose_goal_coco4.pose.orientation.w), "panda_link0") 
    coco4_place = create_pose_stamped(create_pose(row1_x, -0.1, 0.04, -1, 0, 0, 0), "panda_link0") 

    [pose_goal_corn, object_orient_corn] = get_EE_pose_wrt_obj("CORN", pub)
    corn_pose = create_pose_stamped(create_pose(pose_goal_corn.pose.position.x, pose_goal_corn.pose.position.y, 0.035, object_orient_corn[0], object_orient_corn[1], object_orient_corn[2], object_orient_corn[3]), "panda_link0") 
    corn_pick = create_pose_stamped(create_pose(pose_goal_corn.pose.position.x, pose_goal_corn.pose.position.y, 0.04, pose_goal_corn.pose.orientation.x, pose_goal_corn.pose.orientation.y, pose_goal_corn.pose.orientation.z, pose_goal_corn.pose.orientation.w), "panda_link0") 
    corn_place = create_pose_stamped(create_pose(row1_x, 0, 0.11, -1, 0, 0, 0), "panda_link0") 
    
    # ADD COLLISION OBJECTS
    moh.add_box_object("spam2", pose=spam2_pose, size=item_size["SPAM2"], rotation=(0,0,0), frame="panda_link0")
    # moh.add_cylinder_object("beans", pose=beans_pose, height=item_size["BEANS"][0], radius=item_size["BEANS"][1], rotation=(0,0,0), frame="panda_link0")
    moh.add_cylinder_object("coco2", pose=coco2_pose, height=item_size["COCO2"][0], radius=item_size["COCO2"][1], rotation=(0,0,0), frame="panda_link0")
    # moh.add_cylinder_object("root", pose=root_pose, height=item_size["ROOT"][0], radius=item_size["ROOT"][1], rotation=(0,0,0), frame="panda_link0")
    moh.add_cylinder_object("coco4", pose=coco4_pose, height=item_size["COCO4"][0], radius=item_size["COCO4"][1], rotation=(0,0,0), frame="panda_link0")
    moh.add_cylinder_object("corn", pose=corn_pose, height=item_size["CORN"][0], radius=item_size["CORN"][1], rotation=(0,0,0), frame="panda_link0")
    
    # PICK AND PLACE OBJECTS    
    recovery_client()

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "first_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", spam2_pick, spam2_place, "spam2")
    moh.remove_world_object("spam2")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "second_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)
    
    # result = call_server("pick_and_place", beans_pick, beans_place, "beans")
    # moh.remove_world_object("beans")

    result = call_server("pick_and_place", coco2_pick, coco2_place, "coco2")
    moh.remove_world_object("coco2")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "third_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    # result = call_server("pick_and_place", root_pick, root_place, "root")
    # moh.remove_world_object("root")
    result = call_server("pick_and_place", coco4_pick, coco4_place, "coco4")
    moh.remove_world_object("coco4")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "last_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", corn_pick, corn_place, "corn")
    moh.remove_world_object("corn")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "finish.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    panda_arm.move_to_home()

    print result

# FOURTH BOX 
def box4():
    # DEMO PLACES
    row1_x = 0.50403
    row1_left =  0.1
    row1_mid = 0
    row1_right = -0.1

    # os.system("mpg321 --gain 30 scan.mp3")
    os.system("mpg321 --gain 20 intro.mp3")
    os.system("mpg321 --gain 20 scan.mp3")

    # SCAN FOR OBJECTS 
    recovery_client()
    panda_arm.move_to_joint_positions([-0.6727395856066753, -1.654537815261305, 0.85348222029, -2.178381291540045, 1.185371011430203, 0.951887996123406, 0.9801514293502747])
    result = call_server("move_to_pose", scan_pose1, scan_pose1, "")

    # INITIALISE PUBLISHER
    pub = rospy.Publisher('/pick_pose', PoseArray, queue_size=10)
    
    # DEFINE PACKING OBJECTS 
    
    [spam4_pose, spam4_pick, spam4_place] = get_object_info(item_size, pub, "SPAM4", "first", row1_x)
    # [ritz_pose, ritz_pick, ritz_place] = get_object_info(item_size, pub, "RITZ", "highfirst", row1_x)

    [muesli2_pose, muesli2_pick, muesli2_place] = get_object_info(item_size, pub, "MUESLI2", "highsecond", row1_x)

    [spam3_pose, spam3_pick, spam3_place] = get_object_info(item_size, pub, "SPAM3", "third", row1_x)

    [pose_goal_corn2, object_orient_corn2] = get_EE_pose_wrt_obj("CORN2", pub)
    corn2_pose = create_pose_stamped(create_pose(pose_goal_corn2.pose.position.x, pose_goal_corn2.pose.position.y, 0.035, object_orient_corn2[0], object_orient_corn2[1], object_orient_corn2[2], object_orient_corn2[3]), "panda_link0") 
    corn2_pick = create_pose_stamped(create_pose(pose_goal_corn2.pose.position.x, pose_goal_corn2.pose.position.y, 0.04, pose_goal_corn2.pose.orientation.x, pose_goal_corn2.pose.orientation.y, pose_goal_corn2.pose.orientation.z, pose_goal_corn2.pose.orientation.w), "panda_link0") 
    corn2_place = create_pose_stamped(create_pose(row1_x, -0.1, 0.13, -1, 0, 0, 0), "panda_link0") 


    
    # ADD COLLISION OBJECTS
    # moh.add_box_object("ritz", pose=ritz_pose, size=item_size["RITZ"], rotation=(0,0,0), frame="panda_link0")
    # moh.add_box_object("sugar", pose=sugar_pose, size=item_size["SUGAR"], rotation=(0,0,0), frame="panda_link0")
    # moh.add_box_object("vapo2", pose=vapo_pose, size=item_size["VAPO2"], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("spam4", pose=spam4_pose, size=item_size["SPAM4"], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("muesli2", pose=muesli2_pose, size=item_size["MUESLI2"], rotation=(0,0,0), frame="panda_link0")
    moh.add_box_object("spam3", pose=spam3_pose, size=item_size["SPAM3"], rotation=(0,0,0), frame="panda_link0")
    moh.add_cylinder_object("corn2", pose=corn2_pose, height=item_size["CORN2"][0], radius=item_size["CORN2"][1], rotation=(0,0,0), frame="panda_link0")
        
    # PICK AND PLACE OBJECTS     
    recovery_client()
    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "first_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)
    
    result = call_server("pick_and_place", spam4_pick, spam4_place, "spam4")
    moh.remove_world_object("spam4")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "second_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", spam3_pick, spam3_place, "spam3")
    moh.remove_world_object("spam3")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "third_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", muesli2_pick, muesli2_place, "muesli2")
    moh.remove_world_object("muesli2")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "last_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    result = call_server("pick_and_place", corn2_pick, corn2_place, "corn2")
    moh.remove_world_object("corn2")

    time.sleep(5)

    p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    time.sleep(0.5)
    p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "finish.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
    while p2.poll() is None:
        time.sleep(0.1)

    panda_arm.move_to_home()

    print result


if __name__ == '__main__':
    rospy.init_node("panda_arm_client_py")

    ### from test_panda_arm_action_server.py
    panda_arm = PandaArm(simulation=True)

    # READY POSITION
    recovery_client()
    panda_arm.move_to_home()

    # ITEM DICTIONARY
    item_size = {
        "SPAM": (0.1, 0.055, 0.063), # x, y, z
        "SPAM2": (0.1, 0.055, 0.063), # x, y, z
        "SPAM3": (0.1, 0.055, 0.063), # x, y, z
        "SPAM4": (0.1, 0.055, 0.063), # x, y, z
        "SPAM5": (0.1, 0.055, 0.063), # x, y, z
        "SPAM6": (0.1, 0.055, 0.063), # x, y, z
        "BEEF": (0.08, 0.063, 0.072),
        "BEEF2": (0.08, 0.063, 0.072),
        "RITZ": (0.15, 0.055, 0.19),
        "MUESLI": (0.155, 0.035, 0.15),
        "MUESLI2": (0.155, 0.035, 0.15),
        "VAPO": (0.11, 0.035, 0.06),
        "VAPO2": (0.11, 0.035, 0.06),
        "VITA": (0.2, 0.07, 0.095),
        "SUGAR": (0.11, 0.04, 0.15), 
        "COCO":(0.088, 0.0265), # height, radius 
        "COCO2":(0.088, 0.0265), # height, radius 
        "COCO3":(0.088, 0.0265), # height, radius 
        "CAN": (0.09, 0.038),
        "MAC": (0.135 , 0.055, 0.18),
        "BEANS":(0.1, 0.0325), # height, radius
        "BEANS2":(0.1, 0.0325), # height, radius
        "CORN":(0.07, 0.025), # height, radius
        "CORN2":(0.07, 0.025), # height, radius
        "COCO4":(0.088, 0.0265), # height, radius 
    }

    # SCANNING POSITIONS
    scan_pose1 = create_pose_stamped(create_pose(0.15, 0.40, 0.40, -1, 0, 0, 0), "panda_link0") 
    scan_pose2 = create_pose_stamped(create_pose(-0.15, 0.40, 0.40, -1, 0, 0, 0), "panda_link0") 
    scan_pose_middle = create_pose_stamped(create_pose(0, 0.4, 0.40, -1, 0, 0, 0), "panda_link0") 

    # BOX POSITIONS 
    box_bottom_pose = create_pose_stamped(create_pose(0.595 - 0.02, 0, 0.00125, -1, 0, 0, 0), "panda_link0")
    box_east_pose = create_pose_stamped(create_pose(0.595 - 0.02, 0.24 - 0.5*0.0025, 0.105 + 0.0025, -1, 0, 0, 0), "panda_link0")
    box_west_pose = create_pose_stamped(create_pose(0.595 - 0.02, -0.24 + 0.5*0.0025, 0.105 + 0.0025, -1, 0, 0, 0), "panda_link0")
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
        # box_bottom_size = (0.37, 0.45, 0.0025)
        box_bottom_size = (0.37, 0.48, 0.0025)
        box_bottom_rotation = (0, 0, 0)
        box_short_size = (0.0025, 0.365, 0.22) # east and west 
        box_short_rotation = (0, 0, 90)
        # box_long_size = (0.0025, 0.45, 0.22) # north and south 
        box_long_size = (0.0025, 0.48, 0.22) # north and south 
        box_long_rotation = (0, 0, 0)

        # SET PLANNING SCENE
        moh.add_box_object("box_bottom", pose=box_bottom_pose, size=box_bottom_size, rotation=box_bottom_rotation, frame="panda_link0")
        moh.add_box_object("box_east", pose=box_east_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_west", pose=box_west_pose, size=box_short_size, rotation=box_short_rotation, frame="panda_link0")
        moh.add_box_object("box_north", pose=box_north_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("box_south", pose=box_south_pose, size=box_long_size, rotation=box_long_rotation, frame="panda_link0")
        moh.add_box_object("table", pose=table_pose, size=table_size, rotation=table_rotation, frame="panda_link0")

        # CHOOSE BOX 

        # Dictionary for box choice 
        pick_box = {
        0: test,
        1: box1,
        2: box2,
        3: box3,
        4: box4,
        # 3: boxTest
        }

        # While loop for experiment - repeated boxes 
        q = 1 # start experiment 
        num_box_packed = 0 # number of boxes packed 

        while (q == 1):
            # ask for box number 
            boxChoice = input("Please enter box number (0 - 4 or -1 to end): ")
            
            if boxChoice != -1:
                pick_box[boxChoice]()
                panda_arm.move_to_home()
                
                if boxChoice != 0:
                    num_box_packed += 1
            elif boxChoice == -1 or num_box_packed == 4:
                print("Ending experiment")
                q = 0
            
        print 'done'


    except rospy.ROSInterruptException as e:
        print 'Something went wrong:', e