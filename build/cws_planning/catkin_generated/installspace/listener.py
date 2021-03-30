#!/usr/bin/env python2

import rospy
import numpy
from std_msgs.msg import Int16
from panda_robot import PandaArm
import quaternion

r.move_to_joint_positions({'panda_joint3': -1.9679309454524294, 'panda_joint2': -0.9986074692858208, 'panda_joint1': -0.4831874746084213, 'panda_joint7': 0.5257545814596943,'panda_joint6': 2.1555897599054616, 'panda_joint5': -1.2375366110536785, 'panda_joint4': -1.993352550473124})


LOCATION_POSITION = {
    1: {
        'pos': {
            'panda_joint3': -0.6910661271413148, 'panda_joint2': 0.8728888037851951, 'panda_joint1': 0.20965062271945253, 'panda_joint7': 1.5578828821265034, 
            'panda_joint6': 2.3562994836966196, 'panda_joint5': 0.7204521271652617, 'panda_joint4': -1.6932375942404445
        }

    },
    2: {
        'pos':{
            'panda_joint3': -1.9422652795691238, 'panda_joint2': -0.6341644614704849, 'panda_joint1': 0.21989295471132844, 'panda_joint7': 1.5004606638035278, 
            'panda_joint6': 2.4824534694005114, 'panda_joint5': -1.0128861088487837, 'panda_joint4': -2.473418408377128
        }

    }
    3: {
        'pos':{
            'panda_joint3': -1.9465294132400142, 'panda_joint2': -1.14798288051681, 'panda_joint1': -0.44161139181893594, 'panda_joint7': 0.2921920249544912,
            'panda_joint6': 2.0378925764828897, 'panda_joint5': -1.114895020617379, 'panda_joint4': -1.6992888378558897
        }
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
        joint_pos = LOCATION_POSITION[cws_selected]['pos']
        panda.move_to_joint_positions()
        panda.move_to_joint_positions(joint_pos)
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
