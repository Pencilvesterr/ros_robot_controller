#!/usr/bin/env python

#
# Author: Callum Wearne
#This is a script which allows manual control over the arm, sending it to any desired custom positions for testing or any known position
#Also allows cartesian and joint state control as well as controlling the gripper, creating/attaching/detaching/deleting collision objects and printing current coordinates


import sys
import copy
import rospy
import numpy as np
import math
import hrca_action.panda_arm as Panda
from hrca_action.utilities import *

try:
  from math import pi, tau, dist, fabs, cos
except: # For Python 2 compatibility
  from math import pi, fabs, cos, sqrt
  tau = 2.0*pi
  def dist(p, q):
    return sqrt(sum((p_i - q_i)**2.0 for p_i, q_i in zip(p,q)))
from std_msgs.msg import String


def main():
  try:
    rospy.init_node("panda_arm_client_py")
    cont = 1
    move = Panda.PandaArm(simulation=True)
    objects = MoveitObjectHandler()

    objectlist = []
    obj_ori = euler_to_quat(0,0,0)
    ob_pose = create_pose_stamped(create_pose(0.4,0,-0.15,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("table1", pose = ob_pose, size = (0.5,1.3,0.3))

    ob_pose = create_pose_stamped(create_pose(-0.35,-0.4,-0.15,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("table2", pose = ob_pose, size = (1,0.5,0.3))

    ob_pose = create_pose_stamped(create_pose(-0.5,0.275,0.6,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("wall", pose = ob_pose, size = (1.2,0.1,1.2))  

    """ob_pose = create_pose_stamped(create_pose(-0.4,0,0.85,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("roof", pose = ob_pose, size = (3,3,0.1))

    ob_pose = create_pose_stamped(create_pose(-0.64,0.4,0.5,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("prevention3", pose = ob_pose, size = (0.01,1,1))

    ob_pose = create_pose_stamped(create_pose(0,0.7,0.5,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("sidewall", pose = ob_pose, size = (1,0.1,1))"""

    
    while cont == 1:
      print("-----------------------------------------------------")
      print("-----------------------------------------------------")
      print("-----------------------------------------------------")
      movetype = int(raw_input("0 for known location, 1 for joint, 2 for pose, 3 for cartesian, 4 for current coords, 5 for gripper, 6 for objects, 7 to quit: "))
      print("-----------------------------------------------------")

      if movetype == 0:
        location = int(raw_input("0 for home, 1-10 for domino placements, 100 for domino pile: "))
        print("-----------------------------------------------------")
        if location == 0:
          joint_mat = [0,-tau/8,0,-3*tau/8,0,tau/4,tau/8]
          move.move_to_joint_positions(joint_mat)
        elif location == 1: 
          goal_pos = [0.5,-0.5,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose)   
        elif location == 2:     
          goal_pos = [0.5,-0.41,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 3:     
          goal_pos = [0.5,-0.32,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 4:     
          goal_pos = [0.5,-0.23,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 5:     
          goal_pos = [0.5,-0.14,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 6:     
          goal_pos = [0.5,-0.05,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 7:     
          goal_pos = [0.5,0.04,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 8:     
          goal_pos = [0.5,0.13,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 9:     
          goal_pos = [0.5,0.22,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 
        elif location == 10:     
          goal_pos = [0.5,0.31,0.25]
          goal_ori = euler_to_quat(pi/2,pi/4,0)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose)   
        elif location == 100:     
          goal_pos = [-0.42,-0.4,0.25]
          goal_ori = euler_to_quat(pi,0,-pi/4)
          pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
          move.move_to_pose(pose) 

      elif movetype == 1:
        j1 = float(raw_input("joint 1: "))
        j2 = float(raw_input("joint 2: "))
        j3 = float(raw_input("joint 3: "))
        j4 = float(raw_input("joint 4: "))
        j5 = float(raw_input("joint 5: "))
        j6 = float(raw_input("joint 6: "))
        j7 = float(raw_input("joint 7: "))
        print("-----------------------------------------------------")
        joint_mat = [j1,j2,j3,j4,j5,j6,j7]
        move.move_to_joint_positions(joint_mat)

      elif movetype == 2:
        x = float(raw_input("x coordinate: "))
        y = float(raw_input("y coordinate: "))
        z = float(raw_input("z coordinate: "))
        ex = float(raw_input("Eular x: "))
        ey = float(raw_input("Eular y: "))
        ez = float(raw_input("Eular z: "))
        print("-----------------------------------------------------")
        goal_pos = [x,y,z]
        goal_ori = euler_to_quat(ex,ey,ez)
        pose = create_pose_stamped(create_pose(goal_pos[0],goal_pos[1],goal_pos[2],goal_ori[0],goal_ori[1],goal_ori[2],goal_ori[3]),"world")
        move.move_to_pose(pose) 

      elif movetype == 3:
        dx = float(raw_input("x change: "))
        dy = float(raw_input("y change: "))
        dz = float(raw_input("z change: "))
        scale = float(raw_input("Scale (usually 1): "))
        print("-----------------------------------------------------")
        delta = [dx,dy,dz]
        cartesian_plan, fraction = move.plan_cartesian_path(delta,scale)
        move.execute_plan(cartesian_plan) 

      elif movetype == 4:
        move.print_coord()

      elif movetype == 5:
        grip = float(raw_input("Gripper value (0.04 for closed, 0.32 for open): "))
        print("-----------------------------------------------------")
        move.change_gripper(grip)

      elif movetype == 6:
        objectuse = int(raw_input("0 to create object, 1 to delete object, 2 to attach object, 3 to detach box: "))
        print("-----------------------------------------------------")
        if objectuse == 0:
          objname = raw_input("Object name: ")
          objxsize = float(raw_input("Object x dimension: "))
          objysize = float(raw_input("Object y dimension: "))
          objzsize = float(raw_input("Object z dimension: "))
          objxloc = float(raw_input("Object x location: "))
          objyloc = float(raw_input("Object y location: "))
          objzloc = float(raw_input("Object z location: "))
          print("-----------------------------------------------------")
          move.add_box(objname,[objxsize,objysize,objzsize],[objxloc,objyloc,objzloc])
          objectlist.append(objname)
        elif objectuse == 1:
          print(objectlist)
          objname = raw_input("Name of object to delete: ")
          print("-----------------------------------------------------")
          move.remove_box(objname)
          objectlist.remove(objname)
        elif objectuse == 2:
          print(objectlist)
          objname = raw_input("Name of object to attach: ")
          print("-----------------------------------------------------")
          move.attach_box(objname)
        elif objectuse == 3:
          print(objectlist)
          objname = raw_input("Name of object to attach: ")
          print("-----------------------------------------------------")
          move.detach_box(objname)

      elif movetype == 7:
        objects.remove_all_objects()
        cont = 0
    

  except rospy.ROSInterruptException:
    return
  except KeyboardInterrupt:
    return

if __name__ == '__main__':
  main()
