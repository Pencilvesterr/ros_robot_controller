#!/usr/bin/env python

import sys
import copy
import rospy
import numpy as np
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
import genpy
import tf
import actionlib

from copy import deepcopy
from math import pi, atan2

from std_msgs.msg import String, Int16
from moveit_commander.conversions import pose_to_list
from trajectory_msgs.msg import JointTrajectoryPoint

from python_utilities.light_status import LightStatus
from python_utilities.robot_positions import RobotPositions
from hrca_decision.srv import  MoveBlock, MoveBlockResponse, ResetRobot, ResetRobotResponse, MoveToPosition, MoveToPositionResponse
from hrca_action.panda_arm import PandaArm
from hrca_action.utilities import MoveitObjectHandler
from hrca_msgs.msg import RobotTaskAction, RobotTaskFeedback, RobotTaskResult, RobotTaskGoal
from hrca_msgs.srv import GetRobotPose


class NodeManagerMoveIt(object):
    def __init__(self, panda_interface):
        super(NodeManagerMoveIt, self).__init__()
        self.panda_interface = panda_interface
        self.current_cws = 0

        rospy.init_node('moveitt_robot')
        rospy.sleep(1)  # Needed to allow init of node before collision objects will add
        self.panda_interface.add_scene_objects()
        
    def start_services(self):
        try: 
            rospy.Service("/move_block", MoveBlock, self.callback_move_block)
            rospy.Service("/reset_to_neutral", ResetRobot, self.callback_return_neutral)
            rospy.loginfo("---MoveIt Robot Services Setup---")
        except Exception as e:
            rospy.logerr(e)
        # Keeps python from exiting until this node is stopped
        rospy.spin()  
        
    def callback_move_block(self, req):
        ''' Arg: req.block_number, req.block_zone 

            Process is Open claw, Go to block position, Close claw, 
            Create then execute path plan to zone, Open claw, Return to home position
        '''        
        if not self._valid_move_block_srv_args(req):
            return MoveBlockResponse(False)
        
        rospy.loginfo("Moving from block number {} to zone {}".format(
            str(req.block_number), str(req.block_zone)))
        
        try: 
            # Reset position should be done by robot_manager.py, but just incase
            self.panda_interface.move_to_neutral()
            self.panda_interface.open_gripper()
            # Add blocks to scene individually as otherwise they prevent motion plan being found
            self.panda_interface._add_block_scene(req.block_number)
            self.panda_interface.grap_object(req.block_number)
            self.panda_interface.move_to_neutral()
            self.panda_interface.set_high_movement_scaling()
            self.panda_interface.move_to_neutral_zoneside()
            self.panda_interface.reset_movement_scaling()
            self.panda_interface.place_object(req.block_number, req.block_zone)
            self.panda_interface.move_to_neutral_zoneside()
        except Exception as e:  
            # Catch all isn't ideal, but unsure what type of excpetions it will throw
            rospy.logerr("Unable to move block: " + e)
            return MoveBlockResponse(False)
                
        return MoveBlockResponse(True)

    def callback_return_neutral(self, req):
        try:
            # If 0 is received in message, then use defualt speed as isn't first reset of program run
            if req.movement_scaling_factor == 0:
                self.panda_interface.set_high_movement_scaling()
            else:
                self.panda_interface.set_movement_scaling(
                    req.movement_scaling_factor, req.movement_scaling_factor)

            self.panda_interface.move_to_neutral()
            self.panda_interface.reset_movement_scaling()
            return ResetRobotResponse(True)
        
        # Would be useful to know what type of exception we expect...
        except Exception as e:
            rospy.logerr(e)
            return ResetRobotResponse(False)
        
    def _valid_move_block_srv_args(self, req):
        if req.block_number not in RobotPositions.block_locations.keys():
            rospy.logerr("No location predefined for block: " + str(req.block_number))
            return False

        if req.block_zone not in RobotPositions.zone_locations.keys():
            rospy.logerr("No location predefined for zone: " + str(req.block_zone))
            return False

        return True
    

class MoveGroupPythonInteface(object):   
    BLOCK_LENGTH =  0.05
    # Scaling factor used when rotating base joint for vel and accel
    FAST_MOTION_SCALING = 0.45

    # Use a speed limit when testing new (risky) movements with Panda
    speed_limit_used = False
    LIMIT_SCALING_FACTOR = 0.1
     
    def __init__(self):
        super(MoveGroupPythonInteface, self).__init__()

        moveit_commander.roscpp_initialize(sys.argv)
        # Manages robot's internal understanding of the surrounding world:
        self.scene = moveit_commander.PlanningSceneInterface()
        
        # Uses the Panda Arm Server
        self.object_handler = MoveitObjectHandler()

        self.simulation_mode = rospy.get_param("/simulation", default=True)
        rospy.loginfo("Using simulated robot: " + str(self.simulation_mode))
        self.panda_arm = PandaArm(simulation=self.simulation_mode)
        
        ## Create a `DisplayTrajectory`_ ROS publisher which is used to display trajectories in Rviz:
        self.display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                    moveit_msgs.msg.DisplayTrajectory,
                                                    queue_size=20) 

        self.default_vel = self.panda_arm.max_vel
        self.default_accel = self.panda_arm.max_accel
        
        if self.speed_limit_used:
            self._set_speed_limit(self.LIMIT_SCALING_FACTOR)
        elif self.simulation_mode:
            self._set_speed_limit(1)

    def add_scene_objects(self):
        TABLE_HEIGHT = 0.01
        #Removes any objects attached to the panda arm still
        self.object_handler.detach_gripper_object(None, self.panda_arm, False)
        # Clear all objects from previous run
        self.object_handler.remove_all_objects()

        
        scene_objects = {
            'table1': {
                'size': (3, 3, TABLE_HEIGHT),
                'position': (1.8, 0, -TABLE_HEIGHT/2)
            },
            'table2': {
                'size': (3, 3, TABLE_HEIGHT),
                'position': (-1.8, 0, -TABLE_HEIGHT/2)
            },
            'table_fill_middle': {
                'size': (0.6, 0.6, TABLE_HEIGHT),
                'position': (0, 0.5, -TABLE_HEIGHT/2)
            },
            'user_side_prevention': {
                'size': (1, 0.05, 1.4),
                'position': (-0.2, -0.4, 0.7)
            },
            'computer_side_prevention': {
                'size': (1, 0.05, 1.4),
                'position': (-0.2, 0.6, 0.7)
            },
            'twist_motion_prevention': {
                'size': (0.2, 0.4, 1),
                'position': (-0.4, -0.3, 0.7)
            },
            'height_prevention': {
                'size': (2, 2, 0.01),
                'position': (0, 0, 0.9)
            }
        }
        
        for object_name in scene_objects.keys():
            position = scene_objects[object_name]['position']
            object_size = scene_objects[object_name]['size']
            object_pose = self._get_pose_stamped(position)
            self.scene.add_box(object_name, object_pose, object_size)
            if not self._wait_for_state_update(object_name, box_is_known=True):
                rospy.logerr("Collision objects for {} failed to add to scene".format(object_name))

    def move_to_neutral(self):
        current_joints = self.panda_arm.get_current_joint_values()
        in_home_position = True
        for i in range(len(current_joints)):
            real_joint = current_joints[i]
            ideal_joint = self.panda_arm.home_position[i]
            if abs(real_joint - ideal_joint) > 0.1:
                in_home_position = False
                break 
        
        if not in_home_position:
            rospy.loginfo('Moving to home position')
            self.panda_arm.move_to_home()
 
    def move_to_neutral_zoneside(self):
        rospy.loginfo("Moving to zoneside")
        success = self.panda_arm.move_to_joint_positions([2.7, -0.78, 0.0, -2.36, 0, 1.57, 0.78]) 

    def grap_object(self, block_number):
        TABLE_PADDING_OFFSET = 0.1
        HOVER_Z_HEIGHT = 0.08
    
        rospy.loginfo("Picking block " + str(block_number))
        block_coordinates = RobotPositions.block_locations[block_number]
        block_position = (block_coordinates['position']['x'], 
                          block_coordinates['position']['y'],
                          self.BLOCK_LENGTH/2) 
               
        grasp_position = (block_position[0], block_position[1], block_position[2] + TABLE_PADDING_OFFSET) 
        grasp_hover_position = (block_position[0], block_position[1], block_position[2] + TABLE_PADDING_OFFSET + HOVER_Z_HEIGHT) 

        # Dealing with pose of panda_link8 so have to compensate for the transform from the palm of 8 to the end effector
        x,y,z,w = tf.transformations.quaternion_from_euler(pi, 0, -pi/4)
        grasp_hover_pose = self._get_pose_stamped(position=grasp_hover_position, orientation=(x,y,z,w))
        grasp_pose = self._get_pose_stamped(position=grasp_position, orientation=(x,y,z,w)) 

        plan_to_pose_hover = self.panda_arm.plan_to_pose_optimized(grasp_hover_pose)
        success = self.panda_arm.execute_plan_unsafe(plan_to_pose_hover)

        plan_to_pose = self.panda_arm.plan_to_pose_optimized(grasp_pose)
        success = self.panda_arm.execute_plan_unsafe(plan_to_pose)

        if not self.simulation_mode:
            self.panda_arm.grasp(width=self.BLOCK_LENGTH, e_inner=0.01, e_outer=0.01, speed=0.1, force=1)
        self.object_handler.attach_gripper_object(str(block_number), self.panda_arm, "hand")

        plan_to_pose_hover = self.panda_arm.plan_to_pose_optimized(grasp_hover_pose, iterations=10)
        success = self.panda_arm.execute_plan_unsafe(plan_to_pose_hover)
    
    def place_object(self, block_number, block_zone_int):
        """Place the object at a location, assuming starting at neutral_zoneside"""
        ZONE_PLACEMENT_HEIGHT = 0.3
        zone_coordinates = RobotPositions.zone_locations[block_zone_int]
        rospy.loginfo("Placing in zone " + str(block_zone_int))
        
        place_position = (zone_coordinates['position']['x'], 
                          zone_coordinates['position']['y'],
                          ZONE_PLACEMENT_HEIGHT) 

        
        # Dealing with pose of panda_link8 so have to compensate for the transform from the palm of 8 to the end effector
        x,y,z,w = tf.transformations.quaternion_from_euler(pi, 0, 3*pi/4) 
        place_pose = self._get_pose_stamped(position=place_position, orientation=(x,y,z,w))
        
        success = self.panda_arm.move_to_pose(place_pose, self.default_vel, self.default_accel)

        if not self.simulation_mode:
            self.panda_arm.open_gripper()

        # True means it will also remove object from the world
        self.object_handler.detach_gripper_object(str(block_number), self.panda_arm, True)
        rospy.sleep(0.1)  # Need to sleep before or else it gets skipped over...
        self.object_handler.remove_world_object(str(block_number))
        rospy.sleep(0.1)  # Need to sleep before or else it gets skipped over...


    def set_high_movement_scaling(self):
        self.set_movement_scaling(self.FAST_MOTION_SCALING, self.FAST_MOTION_SCALING)

    def reset_movement_scaling(self):
        self.set_movement_scaling(self.default_vel, self.default_accel)

    def set_movement_scaling(self, vel_factor, accel_factor):
        if self.speed_limit_used:
            return 
        self.panda_arm.set_movement_scaling_factors(vel_factor, accel_factor)
    
    def open_gripper(self):
        self.panda_arm.open_gripper()
        
    def _get_pose_stamped(self, position=(0,0,0), orientation=(0,0,0,1)):
        """Pose offset takes in a touple for adding translation to (x, y, z)"""
        # PoseStamped has a header which is required when adding collision objects to scene
        pose_msg = geometry_msgs.msg.PoseStamped()
        pose_msg.header.frame_id = "panda_link0"
        pose_msg.pose.position.x = position[0]
        pose_msg.pose.position.y = position[1]
        pose_msg.pose.position.z = position[2]
        
        if orientation is (0,0,0,1):
            pose_msg.pose.orientation.w = 1
        else:
            pose_msg.pose.orientation.x = orientation[0]
            pose_msg.pose.orientation.y = orientation[1]
            pose_msg.pose.orientation.z = orientation[2]
            pose_msg.pose.orientation.w = orientation[3]
            
        return pose_msg
        
    def _add_block_scene(self, block_number):
        block_name = str(block_number)
        block_size = (self.BLOCK_LENGTH, self.BLOCK_LENGTH, self.BLOCK_LENGTH)
        x =  RobotPositions.block_locations[block_number]['position']['x']
        y =  RobotPositions.block_locations[block_number]['position']['y']
        pose_msg = self._get_pose_stamped(position=(x, y, self.BLOCK_LENGTH/2))
        self.scene.add_box(block_name, pose_msg, block_size)
        if not self._wait_for_state_update(block_name, box_is_known=True):
            rospy.logerr("Collision objects for block {} failed to add to scene".format(block_name))    
        
        # Enough time to not update scene
        rospy.sleep(0.05)

    def _wait_for_state_update(self, box_name, box_is_known=False, box_is_attached=False, timeout=4):
        ## If the Python node dies before publishing a collision object update message, the message
        ## could get lost and the box will not appear. To ensure that the updates are
        ## made, we wait until we see the changes reflected in the
        ## ``get_attached_objects()`` and ``get_known_object_names()`` lists.
        ## Call this function after adding, removing, attaching or detaching an object in the planning scene. 
        start = rospy.get_time()
        seconds = rospy.get_time()
        while (seconds - start < timeout) and not rospy.is_shutdown():
            # Test if the box is in attached objects
            attached_objects = self.scene.get_attached_objects([box_name])
            is_attached = len(attached_objects.keys()) > 0

            # Test if the box is in the scene.
            # Note that attaching the box will remove it from known_objects
            is_known = box_name in self.scene.get_known_object_names()

            # Test if we are in the expected state
            if (box_is_attached == is_attached) and (box_is_known == is_known):
                return True

            # Sleep so that we give other threads time on the processor
            rospy.sleep(0.1)
            seconds = rospy.get_time()

        return False

    def _set_speed_limit(self, scaling_factor):
        rospy.logwarn("Speed limit scaling factor on")
        self.default_vel = scaling_factor
        self.default_accel = scaling_factor
        self.panda_arm.max_vel = scaling_factor
        self.panda_arm.max_accel = scaling_factor
    

if __name__ == '__main__': 
    panda_interface = MoveGroupPythonInteface()
    node_manager = NodeManagerMoveIt(panda_interface)
    node_manager.start_services()
    