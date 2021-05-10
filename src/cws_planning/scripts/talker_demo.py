#!/usr/bin/env python

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
from std_msgs.msg import Int16
from cws_planning.srv import MoveBlock

def talker():
    pub = rospy.Publisher('cws_selected', Int16, queue_size=10)
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
        selected_cws = int(raw_input("Select a cws: "))
        rospy.loginfo("Sending: " + str(selected_cws))
        pub.publish(selected_cws)
        rate.sleep()

def call_service():
    service_name = '/move_block'
    srv = rospy.ServiceProxy(service_name, MoveBlock)
    rospy.wait_for_service(service_name)
    rospy.loginfo("Calling service")

    while not rospy.is_shutdown():
        resp = srv(11, 1)
        if resp.success:
            rospy.loginfo("Finished first movement")
        else:
            rospy.logerr("Failed movement")
            return
        resp = srv(22, 1)
        if resp.success:
            rospy.loginfo("Finished second movement")
        else:
            rospy.logerr("Failed movement")
            return
        
        rospy.sleep(10)

if __name__ == '__main__':
    rospy.init_node('talker_demo', anonymous=True)
    try:
        #talker()
        call_service()
    except rospy.ROSInterruptException as e:
        rospy.logerr(e)
