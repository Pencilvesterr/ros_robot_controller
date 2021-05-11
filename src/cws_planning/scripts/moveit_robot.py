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
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg

from math import pi
from std_msgs.msg import String, Int16
from moveit_commander.conversions import pose_to_list
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

        # interface for getting, setting, and updating the robot's internal understanding of the
        # surrounding world:
        self.scene = moveit_commander.PlanningSceneInterface()

        # Interface for planning group of joints. Can be used to plan and execute motions:
        group_name_arm = "panda_arm"
        self.move_group = moveit_commander.MoveGroupCommander(group_name_arm)

        group_name_hand = "hand"
        self.move_group_hand = moveit_commander.MoveGroupCommander(group_name_hand)


        ## Create a `DisplayTrajectory`_ ROS publisher which is used to displayF
        ## trajectories in Rviz:
        self.display_trajectory_publisher  = rospy.Publisher('/move_group/display_planned_path',
                                                    moveit_msgs.msg.DisplayTrajectory,
                                                    queue_size=20)

        self.box_name = ''
        self.eef_link = self.move_group.get_end_effector_link()
        self.block_locations = RobotPositions.block_locations

    def move_to_pose_goal(self, pose_goal):
        """Move the EE to the pose goal.

        pose_goal = geometry_msgs.msg.Pose()
        pose_goal.orientation.w = 1.0
        pose_goal.position.x = 0.4
        """
        self.move_group.set_pose_target(pose_goal)

        ## Now, we call the planner to compute the plan and execute it.
        plan = self.move_group.go(wait=True)
        # Calling `stop()` ensures that there is no residual movement
        self.move_group.stop()
        # It is always good to clear your targets after planning with poses.
        self.move_group.clear_pose_targets()

        current_pose = self.move_group.get_current_pose().pose
        return all_close(pose_goal, current_pose, 0.01)

    def plan_cartesian_path(self, waypoints, scale=1):
        """Plan a Cartesian path directly by specifying a list of waypoints for the end-effector to go through. 

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
        (plan, fraction) = self.move_group.compute_cartesian_path(
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
        self.display_trajectory_publisher.publish(display_trajectory);

    def execute_plan(self, plan):
        """Use execute if you would like the robot to follow the plan that has already been computed.

        **Note:** The robot's current joint state must be within some tolerance of the
        first waypoint in the `RobotTrajectory`_ or ``execute()`` will fail.
        """
        self.move_group.execute(plan, wait=True)

    def get_pose_goal(self, coordinates, orientation=True):
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
        
    def create_path(self, block_number, block_zone):
        coordinates_block = RobotPositions.block_locations[block_number]
        coordinates_home = RobotPositions.default_positions['home']
        coordinates_side_default = RobotPositions.default_positions['side_default']
        coordinates_zone_default = RobotPositions.default_positions['zone_default']
        coordinates_zone = RobotPositions.zone_locations[block_zone]

        waypoints = []
        waypoints.append(self.get_pose_goal(coordinates_block))
        waypoints.append(self.get_pose_goal(coordinates_home))
        #waypoints.append(self.get_pose_goal(coordinates_side_default, orientation=False))
        #waypoints.append(self.get_pose_goal(coordinates_zone_default, orientation=False))
        waypoints.append(self.get_pose_goal(coordinates_zone))

        plan, fraction = self.plan_cartesian_path(waypoints)

        return plan 

    def open_gripper(self):
        joint_goal = self.move_group_hand.get_current_joint_values()
        joint_goal[0] = 0.035
        joint_goal[1] = 0.035

        self.move_group_hand.go(joint_goal, wait=True)
        self.move_group_hand.stop()

    def close_gripper(self, end_pos=0.01):
        joint_goal = self.move_group_hand.get_current_joint_values()
        joint_goal[0] = end_pos
        joint_goal[1] = end_pos

        self.move_group_hand.go(joint_goal, wait=True)
        self.move_group_hand.stop()

    def move_to_neutral(self):
        rospy.loginfo('Moving to home position')
        self.move_to_joint([0, 0, 0, -pi/2, 0, pi/2, 1*pi/4]) 

    def move_to_neutral_zoneside(self):
        # second = -pi/4
        self.move_to_joint([-2.8, 0, 0, -pi/2, 0, pi/2, 1*pi/4]) 

    def move_to_joint(self, added_values):
        joint_goal = self.move_group.get_current_joint_values()
        for idx in range(len(added_values)):
            joint_goal[idx] = added_values[idx]

        self.move_group.go(joint_goal, wait=True)

        


class NodeManagerMoveIt(object):
    def __init__(self, panda_move_group):
        super(NodeManagerMoveIt, self).__init__()
        self.panda_move_group = panda_move_group
        self.current_cws = 0
        rospy.init_node('moveitt_robot')

    def valid_move_block_srv_args(self, req):
        if req.block_number not in RobotPositions.block_locations.keys():
            rospy.logerr("No location predefined for block: " + str(req.block_number))
            return False

        if req.block_zone not in RobotPositions.zone_locations.keys():
            rospy.logerr("No location predefined for zone: " + str(req.block_zone))
            return False

        return True


    def callback_move_block(self, req):
        ''' Arg: req.block_number, req.block_zone 

            Aim: 
                Open claw, Go to block position, Close claw, 
                Create then execute path plan to zone, Open claw, Return to home position
        '''        
        log = rospy.loginfo
        if not self.valid_move_block_srv_args(req):
            return MoveBlockResponse(False)

        rospy.loginfo("Moving from block number " + str(req.block_number) + " to zone " + str(req.block_zone))
        block_coordinates = RobotPositions.block_locations[req.block_number]
        zone_coordinates = RobotPositions.zone_locations[req.block_zone]
        
        
        # TODO: plan everything with cartesian path method. 
        #  ALSO add additional interim point for more consistent movement.

        #try: 
            # Go to block
        self.panda_move_group.move_to_neutral()
        self.panda_move_group.open_gripper()


        rospy.loginfo("Moving to block " + str(req.block_number))

        waypoint = [self.panda_move_group.get_pose_goal(block_coordinates)]
        block_plan, _ = self.panda_move_group.plan_cartesian_path(waypoint)
        self.panda_move_group.execute_plan(block_plan)      
        self.panda_move_group.close_gripper()
        self.panda_move_group.move_to_neutral()
        self.panda_move_group.move_to_neutral_zoneside()
        rospy.loginfo("Placing in zone " + str(req.block_zone))
        
        
        zone_pose_goal = self.panda_move_group.get_pose_goal(zone_coordinates)
        self.panda_move_group.move_to_pose_goal(zone_pose_goal)
        
        waypoint = [self.panda_move_group.get_pose_goal(zone_coordinates)]
        block_plan, _ = self.panda_move_group.plan_cartesian_path(waypoint)
        self.panda_move_group.execute_plan(block_plan)  
        
        self.panda_move_group.open_gripper()
        self.panda_move_group.move_to_neutral_zoneside()
        self.panda_move_group.move_to_neutral()

 
        return MoveBlockResponse(True)

        # except Exception as e:
        #     rospy.logerr(e)
        #     return MoveBlockResponse(False)

    def callback_move_position(self, req):
        """Utility service to check where the robot moves"""
        if req.position_number == 0:
            self.panda_move_group.move_to_neutral()
            return MoveToPositionResponse(True)

        if req.position_number == -1:
            self.panda_move_group.move_to_neutral_zoneside()
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

        pose_goal = self.panda_move_group.get_pose_goal(coordinates)
        self.panda_move_group.move_to_pose_goal(pose_goal)

        return MoveToPositionResponse(True)

    def callback_return_neutral(self, req):
        try:
            self.panda_move_group.move_to_neutral()
            return ResetRobotResponse(True)
        
        # Would be useful to know what type of exception we expect
        except Exception as e:
            rospy.logerr(e)
            return ResetRobotResponse(False)
            
    def start_services(self):
        # Reset Panda to home position
        self.panda_move_group.move_to_neutral()
        rospy.Service("/move_block", MoveBlock, self.callback_move_block)
        rospy.Service("/move_robot", MoveToPosition, self.callback_move_position)
        rospy.Service("/reset_to_neutral", ResetRobot, self.callback_return_neutral)
        rospy.loginfo("---MoveIt Robot Services Setup---")
        # spin() simply keeps python from exiting until this node is stopped
        rospy.spin()

if __name__ == '__main__': 
    panda_move_group = MoveGroupPythonInteface()
    node_manager = NodeManagerMoveIt(panda_move_group)
    node_manager.start_services()

#     try:
#       ...      
#   except rospy.ROSInterruptException:
#     return


"""
    # Extra Python Interface methods for dealing with objects within the scene

    def wait_for_state_update(self, box_is_known=False, box_is_attached=False, timeout=4):
        # Copy class variables to local variables to make the web tutorials more clear.
        # In practice, you should use the class variables directly unless you have a good
        # reason not to.
        box_name = self.box_name
        scene = self.scene

        ## BEGIN_SUB_TUTORIAL wait_for_scene_update
        ##
        ## Ensuring Collision Updates Are Receieved
        ## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        ## If the Python node dies before publishing a collision object update message, the message
        ## could get lost and the box will not appear. To ensure that the updates are
        ## made, we wait until we see the changes reflected in the
        ## ``get_attached_objects()`` and ``get_known_object_names()`` lists.
        ## For the purpose of this tutorial, we call this function after adding,
        ## removing, attaching or detaching an object in the planning scene. We then wait
        ## until the updates have been made or ``timeout`` seconds have passed
        start = rospy.get_time()
        seconds = rospy.get_time()
        while (seconds - start < timeout) and not rospy.is_shutdown():
            # Test if the box is in attached objects
            attached_objects = scene.get_attached_objects([box_name])
            is_attached = len(attached_objects.keys()) > 0

            # Test if the box is in the scene.
            # Note that attaching the box will remove it from known_objects
            is_known = box_name in scene.get_known_object_names()

            # Test if we are in the expected state
            if (box_is_attached == is_attached) and (box_is_known == is_known):
            return True

            # Sleep so that we give other threads time on the processor
            rospy.sleep(0.1)
            seconds = rospy.get_time()

        # If we exited the while loop without returning then we timed out
        return False
        ## END_SUB_TUTORIAL

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
        return self.wait_for_state_update(box_is_known=True, timeout=timeout)

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
        return self.wait_for_state_update(box_is_attached=True, box_is_known=False, timeout=timeout)

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
        return self.wait_for_state_update(box_is_known=True, box_is_attached=False, timeout=timeout)

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
        return self.wait_for_state_update(box_is_attached=False, box_is_known=False, timeout=timeout)  
"""