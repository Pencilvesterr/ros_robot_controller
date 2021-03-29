#!/usr/bin/env python2

import rospy
import numpy
from std_msgs.msg import Int16
from panda_robot import PandaArm
import quaternion

LOCATION_POSITION = {
    1: {
        'pos': numpy.array([0.45050132, -0.33909326,  0.29167399]),
        'ori': numpy.quaternion(-0.00820482144626581, 0.999658825563928, 0.014268675933549, -0.0202809828234555)
    },
    2: {
        'pos': numpy.array([0.45116247, 0.04518949, 0.28994951]),
        'ori': numpy.quaternion(-0.005552933327, 0.99967321758, 0.013878288047, -0.020736829410)
    },
    3: {
        'pos': numpy.array([0.4271424,  0.45832332, 0.30650098]),
        'ori': numpy.quaternion(-0.00970434986010763, 0.999628653903166, 0.014554248937302, -0.0208938681772511)
    }
}

rospy.init_node('cws_listener')
panda = PandaArm()
panda.move_to_neutral()
current_cws = 0

def callback(data):
    global current_cws
    cws_selected = data.data
    rospy.loginfo(rospy.get_caller_id() + 'Zone Selected:  %d', cws_selected)
    if data.data == current_cws:
        return 

    panda.move_to_neutral()
    if data.data == 0:
        # Leave in neutral
        return
    elif cws_selected in LOCATION_POSITION.keys():
        pos = LOCATION_POSITION[cws_selected]['pos']
        ori = LOCATION_POSITION[cws_selected]['ori']
        panda.move_to_cartesian_pose(pos,ori)
        current_cws = cws_selected
    else:
        rospy.logerr('The sent cws zone does not have a pre-set location: ' + str(cws_selected))

def listener():
    TOPIC = 'cws_selected'
    rospy.Subscriber(TOPIC, Int16, callback)
    rospy.loginfo("---Subscriber setup---")
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
