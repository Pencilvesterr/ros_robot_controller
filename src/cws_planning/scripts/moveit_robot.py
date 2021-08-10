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

from copy import deepcopy
from math import pi, atan2
from std_msgs.msg import String, Int16
from moveit_commander.conversions import pose_to_list
from trajectory_msgs.msg import JointTrajectoryPoint
from cws_planning.srv import MoveBlock, MoveBlockResponse, ResetRobot, ResetRobotResponse, MoveToPosition, MoveToPositionResponse
from python_utilities.light_status import LightStatus
from python_utilities.robot_positions import RobotPositions

def all_close(goal, actual, tolerance):
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
    return all_close(goal.pose, actual.pose, tolerance)

  elif type(goal) is geometry_msgs.msg.Pose:
    return all_close(pose_to_list(goal), pose_to_list(actual), tolerance)

  return True


class MoveGroupPythonInteface(object):    
    def __init__(self):
        super(MoveGroupPythonInteface, self).__init__()

        moveit_commander.roscpp_initialize(sys.argv)
        # Provides information such as the robot's kinematic model and the robot's current joint states
        self.robot = moveit_commander.RobotCommander()
        # Manages robot's internal understanding of the surrounding world:
        self.scene = moveit_commander.PlanningSceneInterface()
        # Interface for planning group of joints. Can be used to plan and execute motions:
        group_name_arm = "panda_arm"
        self.move_group_arm = moveit_commander.MoveGroupCommander(group_name_arm)
        group_name_hand = "hand"
        self.move_group_hand = moveit_commander.MoveGroupCommander(group_name_hand)

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
                'size': (1, 0.1, 1.4),
                'position': (-0.2, -0.4, 0.7)
            },
            'twist_motion_prevention': {
                'size': (0.2, 0.4, 1.4),
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
                  
    def move_to_pose_goal(self, pose_goal):
        """Move the EE to the pose goal.

        pose_goal = geometry_msgs.msg.Pose()
        pose_goal.orientation.w = 1.0
        pose_goal.position.x = 0.4
        """
        self.move_group_arm.set_pose_target(pose_goal)

        ## Now, we call the planner to compute the plan and execute it.
        plan = self.move_group_arm.go(wait=True)
        # Calling `stop()` ensures that there is no residual movement
        self.move_group_arm.stop()
        # It is always good to clear your targets after planning with poses.
        self.move_group_arm.clear_pose_targets()

        current_pose = self.move_group_arm.get_current_pose().pose
        return all_close(pose_goal, current_pose, 0.01)

    def plan_cartesian_path(self, waypoints, scale=1):
        """Plan a Cartesian path directly bclosey specifying a list of waypoints for the end-effector to go through. 

        Examples:
            wpose = self.move_group.get_current_pose().pose
            wpose.position.z -= scale * 0.1  # First move up (z)
            waypoints.append(copy.deepcopy(wpose))

            Args:
                waypoints (list): list of poses from move_group.get_current_pose().pose
        """

        # We want the Cartesian path to be interpolated at a resolution of 1 cm
        # which is why we will specify 0.01 as the eef_step in Cartesian
        # translation.  We will disable the jump threshold by setting it to 0.0,
        # ignoring the check for infeasible jumps in joint space, which is sufficient
        # for this tutorial.
        (plan, fraction) = self.move_group_arm.compute_cartesian_path(
                                            waypoints,   # waypoints to follow
                                            0.01,        # eef_step
                                            0.0)         # jump_threshold

        return plan, fraction

    def display_trajectory(self, plan):
        ## You can ask RViz to visualize a plan (aka trajectory) for you. But the
        ## group.plan() method does this automatically so this is not that useful
        ## here (it just displays the same trajectory again):
        ##
        ## A `DisplayTrajectory`_ msg has two primary fields, trajectory_start and trajectory.
        ## We populate the trajectory_start with our current robot state to copy over
        ## any AttachedCollisionObjects and add our plan to the trajectory.
        display_trajectory = moveit_msgs.msg.DisplayTrajectory()
        display_trajectory.trajectory_start = self.robot.get_current_state()
        display_trajectory.trajectory.append(plan)
        # Publish
        self.display_trajectory_publisher.publish(display_trajectory)

    def move_to_neutral(self):
        rospy.loginfo('Moving to home position')
        self.move_to_joint([0.0, -0.785, 0.0, -2.356, 0.0, 1.571, 0.785])
        # TODO: This was the previous joint target
        #self.move_to_joint([0, 0, 0, -pi/2, 0, pi/2, pi/4])      
 
    def move_to_neutral_zoneside(self):
        self.move_to_joint([2.5, -0.785, 0.0, -2.356, 0.0, 1.571, 0.785])
        # TODO: This was the previous joint target. Maybe have it move here after the turn?
        #self.move_to_joint([2.5, 0, 0, -pi/2, 0, pi/2, pi/4]) 

    def move_to_joint(self, added_values):
        joint_goal = self.move_group_arm.get_current_joint_values()
        for idx in range(len(added_values)):
            joint_goal[idx] = added_values[idx]

        self.move_group_arm.go(joint_goal, wait=True)

    def pickup_block(self, block_number):
        "Grabs block and returns success bool"        
        block_coordinates = RobotPositions.block_locations[block_number]
        block_position = (block_coordinates['position']['x'], 
                          block_coordinates['position']['y'],
                          0.05/2) 
               
        grasp = moveit_msgs.msg.Grasp()
        
        # Grasp goal
        WRITST_TO_GRIPPER = 0.113
        grasp_position = (block_position[0], block_position[1], block_position[2] + WRITST_TO_GRIPPER) 
        # Dealing with pose of panda_link8 so have to compensate for the transform from the palm of 8 to the end effector
        x,y,z,w = tf.transformations.quaternion_from_euler(pi, 0, -pi/4)
        grasp.grasp_pose = self._get_pose_stamped(position=grasp_position, orientation=(x,y,z,w)) 
        
    
        # Set approach gripper open
        open_pos = JointTrajectoryPoint()
        open_pos.positions.append(0.038)
        open_pos.positions.append(0.038)
        grasp.pre_grasp_posture.joint_names.append("panda_finger_joint1")
        grasp.pre_grasp_posture.joint_names.append("panda_finger_joint2")
        grasp.pre_grasp_posture.points.append(open_pos)
        
        # Set grasp gripper closed
        closed_pos = JointTrajectoryPoint()
        closed_pos.positions.append(0.02)
        closed_pos.positions.append(0.02)
        grasp.grasp_posture.joint_names.append("panda_finger_joint1")
        grasp.grasp_posture.joint_names.append("panda_finger_joint2")
        grasp.grasp_posture.points.append(closed_pos)
    
        # Approach      
        grasp.pre_grasp_approach.direction.header.frame_id = "panda_link0"
        grasp.pre_grasp_approach.direction.vector.z = -1
        grasp.pre_grasp_approach.min_distance = 0.195 
        grasp.pre_grasp_approach.desired_distance = 0.215
                
        # Retreat
        grasp.post_grasp_retreat.direction.header.frame_id = "panda_link0"
        grasp.post_grasp_retreat.direction.vector.z = 1.0
        grasp.post_grasp_retreat.min_distance = 0.1
        grasp.post_grasp_retreat.desired_distance = 0.25
        
        self.move_group_arm.set_support_surface_name("table1")
        rospy.loginfo("Running pickup for {}".format(block_number))
        result = self.move_group_arm.pick(str(block_number), grasp)    
        
        return True if result == 1 else False
        
    def place_block_in_zone(self, block_number, block_zone_int):
        """Assumes start in neutral with block in gripper"""
        ZONE_PLACEMENT_HEIGHT = 0.15
        zone_coordinates = RobotPositions.zone_locations[block_zone_int]
        block_name = str(block_number)
        rospy.loginfo("Placing in zone " + str(block_zone_int))
        
        place_loc = moveit_msgs.msg.PlaceLocation()
        
        place_position = (zone_coordinates['position']['x'], 
                          zone_coordinates['position']['y'],
                          ZONE_PLACEMENT_HEIGHT) 
        
        # Dealing with pose of panda_link8 so have to compensate for the transform from the palm of 8 to the end effector
        x,y,z,w = tf.transformations.quaternion_from_euler(0, 0, pi) 
        place_loc.place_pose = self._get_pose_stamped(position=place_position, orientation=(x,y,z,w))
        
        # Set release gripper open
        open_pos = JointTrajectoryPoint()
        open_pos.positions.append(0.038)
        open_pos.positions.append(0.038)
        place_loc.post_place_posture.joint_names.append("panda_finger_joint1")
        place_loc.post_place_posture.joint_names.append("panda_finger_joint2")
        place_loc.post_place_posture.points.append(open_pos)
    
        # Approach      
        place_loc.pre_place_approach.direction.header.frame_id = "panda_link0"
        place_loc.pre_place_approach.direction.vector.z = -1
        place_loc.pre_place_approach.min_distance = 0.05 
        place_loc.pre_place_approach.desired_distance = 0.1
                
        # Retreat
        place_loc.post_place_retreat.direction.header.frame_id = "panda_link0"
        place_loc.post_place_retreat.direction.vector.z = 1.0 
        place_loc.post_place_retreat.min_distance = 0.1
        place_loc.post_place_retreat.desired_distance = 0.15
        
        self.move_group_arm.set_support_surface_name("table2")
        result = self.move_group_arm.place(block_name, place_loc)
        self.scene.remove_world_object(block_name)
        
        return True if result == 1 else False
           
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
    
    def _add_block_scene(self, block_number):
        BLOCK_LENGTH =  0.05    
        
        block_name = str(block_number)
        block_size = (BLOCK_LENGTH, BLOCK_LENGTH, BLOCK_LENGTH)
        x =  RobotPositions.block_locations[block_number]['position']['x']
        y =  RobotPositions.block_locations[block_number]['position']['y']
        pose_msg = self._get_pose_stamped(position=(x, y, BLOCK_LENGTH/2))
        self.scene.add_box(block_name, pose_msg, block_size)
        if not self._wait_for_state_update(block_name, box_is_known=True):
            rospy.logerr("Collision objects for block {} failed to add to scene".format(block_name))    
        
        # Enough time to not update scene
        rospy.sleep(0.05)

class NodeManagerMoveIt(object):
    REDUCED_MAX_VELOCITY = 1 # 0.1
    FULL_MAX_VELOCITY = 1 # 0.3

    def __init__(self, panda_interface):
        super(NodeManagerMoveIt, self).__init__()
        self.panda_interface = panda_interface
        self.current_cws = 0
        self.panda_interface.move_group_arm.set_max_velocity_scaling_factor(self.FULL_MAX_VELOCITY)
        rospy.init_node('moveitt_robot')
        rospy.sleep(1)  # Needed to allow init of node before collision objects will add
        self.panda_interface.add_scene_objects()
        
    def start_services(self):
        # Reset Panda to home position between runs
        self.panda_interface.move_to_neutral()  
        
        rospy.Service("/move_block", MoveBlock, self.callback_move_block)
        rospy.Service("/move_robot", MoveToPosition, self.callback_move_position)
        rospy.Service("/reset_to_neutral", ResetRobot, self.callback_return_neutral)
        rospy.loginfo("---MoveIt Robot Services Setup---")
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
        if not self.panda_interface.pickup_block(req.block_number):
            return MoveBlockResponse(False)
        self.panda_interface.move_to_neutral()
        self.panda_interface.move_to_neutral_zoneside()
        if not self.panda_interface.place_block_in_zone(req.block_number, req.block_zone):
            return MoveBlockResponse(False)
        self.panda_interface.move_to_neutral_zoneside()
        
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

        # TODO: See if you can use the other pose method that exists to remove this one
        pose_goal = self.panda_interface._get_pose_from_dict(coordinates)
        self.panda_interface.move_to_pose_goal(pose_goal)

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


if __name__ == '__main__': 
    panda_interface = MoveGroupPythonInteface()
    node_manager = NodeManagerMoveIt(panda_interface)
    node_manager.start_services()

"""
    def add_box(self, timeout=4):
        # Copy class variables to local variables to make the web tutorials more clear.
        # In practice, you should use the class variables directly unless you have a good
        # reason not to.
        box_name = self.box_name
        scene = self.scene

        ## BEGIN_SUB_TUTORIAL add_box
        ##
        ## Adding Objects to the Planning Scene
        ## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        ## First, we will create a box in the planning scene at the location of the left finger:
        box_pose = geometry_msgs.msg.PoseStamped()
        box_pose.header.frame_id = "panda_leftfinger"
        box_pose.pose.orientation.w = 1.0
        box_pose.pose.position.z = 0.07 # slightly above the end effector
        box_name = "box"
        scene.add_box(box_name, box_pose, size=(0.1, 0.1, 0.1))

        ## END_SUB_TUTORIAL
        # Copy local variables back to class variables. In practice, you should use the class
        # variables directly unless you have a good reason not to.
        self.box_name=box_name
        return self._wait_for_state_update(box_is_known=True, timeout=timeout)

    def attach_box(self, timeout=4):
        # Copy class variables to local variables to make the web tutorials more clear.
        # In practice, you should use the class variables directly unless you have a good
        # reason not to.
        box_name = self.box_name
        robot = self.robot
        scene = self.scene
        eef_link = self.eef_link
        group_names = self.group_names

        ## BEGIN_SUB_TUTORIAL attach_object
        ##
        ## Attaching Objects to the Robot
        ## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        ## Next, we will attach the box to the Panda wrist. Manipulating objects requires the
        ## robot be able to touch them without the planning scene reporting the contact as a
        ## collision. By adding link names to the ``touch_links`` array, we are telling the
        ## planning scene to ignore collisions between those links and the box. For the Panda
        ## robot, we set ``grasping_group = 'hand'``. If you are using a different robot,
        ## you should change this value to the name of your end effector group name.
        grasping_group = 'hand'
        touch_links = robot.get_link_names(group=grasping_group)
        scene.attach_box(eef_link, box_name, touch_links=touch_links)
        ## END_SUB_TUTORIAL

        # We wait for the planning scene to update.
        return self._wait_for_state_update(box_is_attached=True, box_is_known=False, timeout=timeout)

    def detach_box(self, timeout=4):
        # Copy class variables to local variables to make the web tutorials more clear.
        # In practice, you should use the class variables directly unless you have a good
        # reason not to.
        box_name = self.box_name
        scene = self.scene
        eef_link = self.eef_link

        ## BEGIN_SUB_TUTORIAL detach_object
        ##
        ## Detaching Objects from the Robot
        ## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        ## We can also detach and remove the object from the planning scene:
        scene.remove_attached_object(eef_link, name=box_name)
        ## END_SUB_TUTORIAL

        # We wait for the planning scene to update.
        return self._wait_for_state_update(box_is_known=True, box_is_attached=False, timeout=timeout)

    def remove_box(self, timeout=4):
        # Copy class variables to local variables to make the web tutorials more clear.
        # In practice, you should use the class variables directly unless you have a good
        # reason not to.
        box_name = self.box_name
        scene = self.scene

        ## BEGIN_SUB_TUTORIAL remove_object
        ##
        ## Removing Objects from the Planning Scene
        ## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        ## We can remove the box from the world.
        scene.remove_world_object(box_name)

        ## **Note:** The object must be detached before we can remove it from the world
        ## END_SUB_TUTORIAL

        # We wait for the planning scene to update.
        return self._wait_for_state_update(box_is_attached=False, box_is_known=False, timeout=timeout)  
"""