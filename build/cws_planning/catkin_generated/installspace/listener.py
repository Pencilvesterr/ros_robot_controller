#!/usr/bin/env python2

import rospy
from std_msgs.msg import Int16

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %d', data.data)


def listener():
    rospy.init_node('cws_listener', anonymous=True)
    rospy.Subscriber('cws_selected', Int16, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()



'''
from aml_robot.panda_robot import PandaArm

panda = PandaArm()
panda.move_to_neutral()
'''