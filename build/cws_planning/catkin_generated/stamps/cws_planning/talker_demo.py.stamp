#!/usr/bin/env python

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
from std_msgs.msg import Int16

def talker():
    pub = rospy.Publisher('cws_selected', Int16, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(1) # 10hz
    while not rospy.is_shutdown():
        selected_cws = int(raw_input("Select a cws: "))
        rospy.loginfo("Sending: " + str(selected_cws))
        pub.publish(selected_cws)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
