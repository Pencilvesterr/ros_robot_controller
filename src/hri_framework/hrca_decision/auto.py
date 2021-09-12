#!/usr/bin/env python

#
# Author: Callum Wearne

#This script is the current iteration of the autonomous algorithm to place dominos in a line

import rospy
import hrca_action.panda_arm as Panda
from hrca_action.utilities import *
from math import pi
tau = 2.0*pi

#define class positions with all key variables for main positions the arm will use, positions can be changed here to allow for easy reworking of the code
class Positions:
  def __init__(self):
    self.sim = True
    move = Panda.PandaArm(simulation=self.sim)
    #joint states
    #home neutral position
    self.home = [0,-tau/8,0,-3*tau/8,0,tau/4,tau/8]
    #domino locations in domino line
    self.dom = [None]*10
    domx = 0.5 #x location of domino line
    domy = -0.2 #y location of domino line
    domz = 0.25 #height the arm will move to before placement
    distance = 0.09 #distance apart the dominos will be in the line
    self.numDominos = 6 #number of dominos to be created and placed by the arm
    for i in range(self.numDominos):
      self.dom[i] = [domx,domy+distance*i,domz]
      #results in:
      #self.dom[0] = [0.5,-0.2,0.25]
      #self.dom[1] = [0.5,-0.11,0.25]
      #self.dom[2] = [0.5,-0.02,0.25] etc
    self.pile = [-0.42,-0.4,0.25] #pile location
    self.place_ori = euler_to_quat(pi/2,pi/4,0) #orientation of the hand when placing dominos
    self.pile_ori = euler_to_quat(pi,0,-pi/4) #orientation of the hand when picking up from the pile
    self.fail_ori = euler_to_quat(pi/2 +0.1,pi/4,0) #orientation of the hand when failing a placement to knock over dominos (the +0.1 will cause the placement to be slightly tilted)

def main():
  try:
    rospy.init_node("panda_arm_client_py")
    pos = Positions() #define class holding position variables
    move = Panda.PandaArm(simulation=pos.sim) #define the class containing move functions from base script

    #add all main collision objects to the scene
    objects = MoveitObjectHandler()
    obj_ori = euler_to_quat(0,0,0)

    ob_pose = create_pose_stamped(create_pose(0.4,0,-0.15,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("table1", pose = ob_pose, size = (0.5,1.3,0.3))

    ob_pose = create_pose_stamped(create_pose(-0.35,-0.4,-0.15,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("table2", pose = ob_pose, size = (1,0.5,0.3))

    ob_pose = create_pose_stamped(create_pose(-0.5,0.3,0.6,obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
    objects.add_box_object("wall", pose = ob_pose, size = (1,0.1,1.2))  

    dominoDimensions = [0.10,0.065,0.012] #xyz dimensions of the dominos 10cm long 6.5cm wide 1.2cm tall
    numDominos = pos.numDominos
    dominoLocation = [None]*10
    offcentre = 0.03 #how far from the centre of the domino along the x axis` the arm will pick it up in the pile to allow the arm to stay further away from the table when placing
    zoffset = 0.107 #the offset between where the code registers the end of the arm (the wrist as the hand is not the only thing that can attach to the panda arm) and the end of the arm for our purposes (in between the clamps of the hand) 0.103 by default

    for i in range(numDominos):
        #each domino numbers place in the pile height-wise, 0 is top the largest number is bottom as 0 will be picked up from top to bottom
        dominoLocation[i] = [pos.pile[0]+offcentre, pos.pile[1], dominoDimensions[2]/2+numDominos*dominoDimensions[2]-(i+1)*dominoDimensions[2]] 

        ob_pose = create_pose_stamped(create_pose(dominoLocation[i][0],dominoLocation[i][1],dominoLocation[i][2],obj_ori[0],obj_ori[1],obj_ori[2],obj_ori[3]),"world")
        objects.add_box_object("domino"+str(i), pose = ob_pose, size = (dominoDimensions[0],dominoDimensions[1],dominoDimensions[2]))

    dominosRemoved = 0 #variable to keep track of how many dominos have been removed from the pile
    for domnum in range(numDominos):
        height = (numDominos - dominosRemoved)*0.012 #current height of the pile, to be updated every time a domino is removed

        move.move_to_joint_positions(pos.home) #start at neutral home position

        #move to pile position
        pose = create_pose_stamped(create_pose(pos.pile[0],pos.pile[1],pos.pile[2],pos.pile_ori[0],pos.pile_ori[1],pos.pile_ori[2],pos.pile_ori[3]),"world")
        move.move_to_pose(pose)

        #raw_input("This is where the pickup happens")

        #################TESTING AREA#####################
        pickup_pose = create_pose_stamped(create_pose(dominoLocation[domnum][0]-offcentre,dominoLocation[domnum][1],dominoLocation[domnum][2]+zoffset,pos.pile_ori[0],pos.pile_ori[1],pos.pile_ori[2],pos.pile_ori[3]),"world")
        pickup_plan = move.plan_to_pose_cartesian(pickup_pose)
        move.execute_plan_unsafe(pickup_plan)
        #raw_input("check finger location")
        if not pos.sim:
            move.grasp(width=dominoDimensions[0], e_inner=0.01, e_outer=0.01, speed=0.1, force=1)
        objects.attach_gripper_object("domino"+str(domnum),move,"hand")
        ###############END TESTING AREA###################

        move.move_to_joint_positions(pos.home) #return home

        pose = create_pose_stamped(create_pose(pos.dom[domnum][0],pos.dom[domnum][1],pos.dom[domnum][2],pos.place_ori[0],pos.place_ori[1],pos.place_ori[2],pos.place_ori[3]),"world")
        move.move_to_pose(pose)

        #raw_input("This is where the placement happens")

        #################TESTING AREA#####################
        place_pose = create_pose_stamped(create_pose(pos.dom[domnum][0],pos.dom[domnum][1],dominoDimensions[2]/2+offcentre,pos.place_ori[0],pos.place_ori[1],pos.place_ori[2],pos.place_ori[3]),"world")
        place_plan = move.plan_to_pose_cartesian(place_pose)
        move.execute_plan_unsafe(place_plan)
        if not pos.sim:
            move.open_gripper()
        objects.detach_gripper_object("domino"+str(domnum),move,False)
        ###############END TESTING AREA###################

        pose = create_pose_stamped(create_pose(pos.dom[domnum][0],pos.dom[domnum][1],pos.dom[domnum][2],pos.place_ori[0],pos.place_ori[1],pos.place_ori[2],pos.place_ori[3]),"world")
        move.move_to_pose(pose)

        move.move_to_joint_positions(pos.home) #return home


    raw_input("Press Enter to remove items and end test")
    objects.remove_all_objects()

  except rospy.ROSInterruptException:
    return
  except KeyboardInterrupt:
    return

if __name__ == '__main__':
  main()
