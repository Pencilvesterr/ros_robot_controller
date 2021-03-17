#! /usr/bin/env python
import rospy
from panda_robot import PandaArm

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
        pass
