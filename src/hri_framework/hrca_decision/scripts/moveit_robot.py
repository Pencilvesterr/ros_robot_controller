#!/usr/bin/env python

# Software License Agreement (BSD License)
#
# Copyright (c) 2013, SRI International
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of SRI International nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Original author: Acorn Pooley, Mike Lautman
# Updated: Morgan Crouch


## To use the Python MoveIt interfaces, we will import the `moveit_commander`_ namespace.
## This namespace provides us with a `MoveGroupCommander`_ class, a `PlanningSceneInterface`_ class,
## and a `RobotCommander`_ class. More on these below. We also import `rospy`_ and some messages that we will use:
##

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
        
        # Param values coming from launch file
        # TODO: See if this is needed with the new hri_framework methods
        self.FULL_MAX_VELOCITY = rospy.get_param("/max_velocity", default=0.4)
        self.REDUCED_MAX_VELOCITY = rospy.get_param("/reduced_velocity", default=0.1)   
        self.panda_interface.move_group_arm.set_max_velocity_scaling_factor(self.FULL_MAX_VELOCITY) 
        
        self.panda_interface.add_scene_objects()
        
    def start_services(self):
        # Reset Panda to home position between runs
        self.panda_interface.move_to_neutral()  
        try: 
            rospy.Service("/move_block", MoveBlock, self.callback_move_block)
            rospy.Service("/move_robot", MoveToPosition, self.callback_move_position)
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
        
        self.panda_interface.move_to_neutral()
        # Add blocks to scene individually as otherwise they prevent motion plan being found
        self.panda_interface._add_block_scene(req.block_number)
        self.panda_interface.grap_object(req.block_number)
        self.panda_interface.move_to_neutral()
        self.panda_interface.move_to_neutral_zoneside()
        self.panda_interface.place_object(req.block_number, req.block_zone)
        self.panda_interface.move_to_neutral_zoneside()
                
        # TODO: Exception handling if the result is bad, and respond MoveBlockResponse(False)    
        return MoveBlockResponse(True)

    def callback_move_position(self, req):
        """Utility service to check where the robot moves for each position"""
        if req.position_number == 0:
            self.panda_interface.move_to_neutral()
            return MoveToPositionResponse(True)

        if req.position_number == 99:
            self.panda_interface.move_to_neutral_zoneside()
            return MoveToPositionResponse(True)

        elif req.position_number > 0 and  req.position_number < 5:
            if req.position_number not in RobotPositions.zone_locations.keys():
                rospy.logerr("No location predefined for zone: " + str(req.position_number))
                return MoveToPositionResponse(False)
            else: 
                rospy.loginfo("Moving to block zone: " + str(req.position_number))
                coordinates = RobotPositions.zone_locations[req.position_number]

        elif req.position_number >= 5:
            if req.position_number not in RobotPositions.block_locations.keys():
                rospy.logerr("No location predefined for block: " + str(req.position_number))
                return MoveToPositionResponse(False)
            else:
                rospy.loginfo("Moving to block number: " + str(req.position_number))
                coordinates = RobotPositions.block_locations[req.position_number]

        pose_goal = self.panda_interface._get_pose_from_dict(coordinates, pose_stamped=True)
        self.panda_arm.move_to_pose(pose_goal)

        return MoveToPositionResponse(True)

    def callback_return_neutral(self, req):
        try:
            self.panda_interface.move_to_neutral()
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
     
    def __init__(self):
        super(MoveGroupPythonInteface, self).__init__()

        moveit_commander.roscpp_initialize(sys.argv)
        # Provides information such as the robot's kinematic model and the robot's current joint states
        self.robot = moveit_commander.RobotCommander()
        # Manages robot's internal understanding of the surrounding world:
        self.scene = moveit_commander.PlanningSceneInterface()
        
        # Uses the Panda Arm Server
        self.object_handler = MoveitObjectHandler()

        self.simulation_mode = rospy.get_param("/simulation", default=True)
        rospy.loginfo("Using simulated robot: " + str(self.simulation_mode))
        self.panda_arm = PandaArm(simulation=self.simulation_mode)
        
        #TODO: Remove these 
        # Interface for planning group of joints. Can be used to plan and execute motions:
        group_name_arm = "panda_arm"
        self.move_group_arm = moveit_commander.MoveGroupCommander(group_name_arm)

        ## Create a `DisplayTrajectory`_ ROS publisher which is used to display trajectories in Rviz:
        self.display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                    moveit_msgs.msg.DisplayTrajectory,
                                                    queue_size=20) 
  
    def add_scene_objects(self):
        TABLE_HEIGHT = 0.01
        
        # Clear all objects from previous run
        self.scene.remove_world_object()
        
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
        rospy.loginfo('Moving to home position')
        self.panda_arm.move_to_home()
 
    def move_to_neutral_zoneside(self):
        rospy.loginfo("Moving to zoneside")
        success = self.panda_arm.move_to_joint_positions([2.7, -0.78, 0.0, -2.36, 0, 1.57, 0.78]) 

    def move_to_zoneside_preplace(self):
        joint_goals = self._get_joint_goals([2.5, 0.1, 0, -pi/2, 0, pi/2, 0])
        self.panda_arm.move_to_joint_positions(joint_goals) 

    def _get_joint_goals(self, joint_angles):
        joint_goal = self.panda_arm.get_current_joint_values()
        for idx in range(len(joint_angles)):
            joint_goal[idx] = joint_angles[idx]

    def grap_object(self, block_number):
        WRITST_TO_GRIPPER = 0.113
        HOVER_Z_HEIGHT = 0.1
           
        block_coordinates = RobotPositions.block_locations[block_number]
        block_position = (block_coordinates['position']['x'], 
                          block_coordinates['position']['y'],
                          self.BLOCK_LENGTH/2) 
               
        grasp_position = (block_position[0], block_position[1], block_position[2] + WRITST_TO_GRIPPER) 
        grasp_hover_position = (block_position[0], block_position[1], block_position[2] + WRITST_TO_GRIPPER + HOVER_Z_HEIGHT) 

        # Dealing with pose of panda_link8 so have to compensate for the transform from the palm of 8 to the end effector
        x,y,z,w = tf.transformations.quaternion_from_euler(pi, 0, -pi/4)
        grasp_hover_pose = self._get_pose_stamped(position=grasp_hover_position, orientation=(x,y,z,w))
        grasp_pose = self._get_pose_stamped(position=grasp_position, orientation=(x,y,z,w)) 

        success = self.panda_arm.move_to_pose(grasp_hover_pose)
        success = self.panda_arm.move_to_pose(grasp_pose)

        if not self.simulation_mode:
            self.panda_arm.grasp(width=self.BLOCK_LENGTH, e_inner=0.01, e_outer=0.01, speed=0.1, force=1)
        self.object_handler.attach_gripper_object(str(block_number), self.panda_arm, "hand")

        success = self.panda_arm.move_to_pose(grasp_hover_pose)
    
    def place_object(self, block_number, block_zone_int):
        """Place the object at a location, assuming starting at neutral_zoneside"""
        ZONE_PLACEMENT_HEIGHT = 0.35
        ZONE_PLACEMENT_HOVER = 0.1
        zone_coordinates = RobotPositions.zone_locations[block_zone_int]
        block_name = str(block_number)
        rospy.loginfo("Placing in zone " + str(block_zone_int))
        
        place_position = (zone_coordinates['position']['x'], 
                          zone_coordinates['position']['y'],
                          ZONE_PLACEMENT_HEIGHT) 
        place_hover_position = (zone_coordinates['position']['x'], 
                          zone_coordinates['position']['y'],
                          ZONE_PLACEMENT_HEIGHT + ZONE_PLACEMENT_HOVER)
        
        # Dealing with pose of panda_link8 so have to compensate for the transform from the palm of 8 to the end effector
        x,y,z,w = tf.transformations.quaternion_from_euler(pi, 0, 3*pi/4) 
        place_hover_pose = self._get_pose_stamped(position=place_hover_position, orientation=(x,y,z,w))
        place_pose = self._get_pose_stamped(position=place_position, orientation=(x,y,z,w))
        
        success = self.panda_arm.move_to_pose(place_hover_pose)
        success = self.panda_arm.move_to_pose(place_pose)

        if not self.simulation_mode:
            self.panda_arm.open_gripper()

        self.object_handler.detach_gripper_object(str(block_number), self.panda_arm, False)
        self.object_handler.remove_world_object(str(block_name))
        
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

    def _get_pose_from_dict(self, coordinates, orientation=True, pose_stamped=False):
        if pose_stamped:
            pose_goal = geometry_msgs.msg.PoseStamped()
            pose_goal.header.frame_id = "panda_link0"
            pose_goal.pose.position.x = coordinates['position']['x']
            pose_goal.pose.position.y = coordinates['position']['y']
            pose_goal.pose.position.z = coordinates['position']['z']

            if orientation:  
                pose_goal.pose.orientation.w = coordinates['orientation']['w']
                pose_goal.pose.orientation.x = coordinates['orientation']['x']
                pose_goal.pose.orientation.y = coordinates['orientation']['y']
                pose_goal.pose.orientation.z = coordinates['orientation']['z']
        
        else:
            pose_goal = geometry_msgs.msg.Pose()
            pose_goal.position.x = coordinates['position']['x']
            pose_goal.position.y = coordinates['position']['y']
            pose_goal.position.z = coordinates['position']['z']

            if orientation:
                pose_goal.orientation.w = coordinates['orientation']['w']
                pose_goal.orientation.x = coordinates['orientation']['x']
                pose_goal.orientation.y = coordinates['orientation']['y']
                pose_goal.orientation.z = coordinates['orientation']['z']

        return pose_goal
        
    def _add_block_scene(self, block_number):
        # TODO: Seems this isnt used anymore
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
    
    def _all_close(self, goal, actual, tolerance):
        """
        Convenience method for testing if a list of values are within a tolerance of their counterparts in another list
        @param: goal       A list of floats, a Pose or a PoseStamped
        @param: actual     A list of floats, a Pose or a PoseStamped
        @param: tolerance  A float
        @returns: bool
        """
        all_equal = True
        if type(goal) is list:
            for index in range(len(goal)):
                if abs(actual[index] - goal[index]) > tolerance:
                    return False

        elif type(goal) is geometry_msgs.msg.PoseStamped:
            return self._all_close(goal.pose, actual.pose, tolerance)

        elif type(goal) is geometry_msgs.msg.Pose:
            return self._all_close(pose_to_list(goal), pose_to_list(actual), tolerance)

        return True


if __name__ == '__main__': 
    panda_interface = MoveGroupPythonInteface()
    node_manager = NodeManagerMoveIt(panda_interface)
    node_manager.start_services()
    