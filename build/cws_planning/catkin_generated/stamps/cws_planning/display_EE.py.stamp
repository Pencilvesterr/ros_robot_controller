#! /usr/bin/env python
import rospy
from panda_robot import PandaArm

if __name__ == '__main__':
    rospy.init_node('panda', anonymous=True) # initialise ros node

    r = PandaArm() # create PandaArm instance

    r.move_to_neutral() # moves robot to neutral pose; uses moveit if available, else JointTrajectory action client

    pos,ori = r.ee_pose() # get current end-effector pose (3d position and orientation quaternion of end-effector frame in base frame)

    r.get_gripper().home_joints() # homes gripper joints
    r.get_gripper().open() # open gripper

    r.move_to_joint_position([-8.48556818e-02, -8.88127666e-02, -6.59622769e-01, -1.57569726e+00, -4.82374882e-04,  2.15975946e+00,  4.36766917e-01]) # move robot to the specified pose

    raw_input("Hit enter to continue") # hit enter to continue

    r.move_to_cartesian_pose(pos,ori) # move the robot end-effector to pose specified by 'pos','ori'


'''import rospy
from aml_robot.panda_robot import PandaArm

def get_ee():
    rospy.init_node("panda_position")
    panda = PandaArm()
    panda.move_to_neutral()

    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        pos, ori = panda.ee_pose()
        log_msg = "Position: " + str(pos) + ", Orientation: " + str(ori)
        rospy.loginfo(log_msg)
        rate.sleep()
    

if __name__ == '__main__':
    try:
        get_ee()
    except rospy.ROSInterruptException:
        pass'''
