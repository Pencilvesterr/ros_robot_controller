#!/usr/bin/env python

import sys
import copy
import rospy

from std_msgs.msg import String, Int16
from cws_planning.msg import TrafficLight


class RobotNode(object):
    def __init__(self, panda_move_group):
        super(RobotNode, self).__init__()
        # Node cycle rate (in Hz)
        self.loop_rate = rospy.Rate(10)
        self.gaze_selection = 0
        self.current_cwz = 0
        self.panda_move_group = panda_move_group
        self.panda_move_group.move_to_neutral()

        rospy.init_node('robot_coordination', anonymous=True)
        self.pub = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        rospy.Subscriber('/gaze_object_selected', Int16, self.callback_gaze_selection)
        rospy.loginfo("---Robot Node Initilaised---")
    )

    def callback_gaze_selection(self, data):
        # TODO: Rework this so it's not based on actually moving the robot
        cwz_selected = data.data
        rospy.loginfo(rospy.get_caller_id() + 'Zone Selected:  %d', cwz_selected)

        # Ignore if current zone
        if data.data == self.current_cwz:
            rospy.loginfo("Current zone is already " + str(self.current_cwz))
            return 
        
        self.panda_move_group.move_to_neutral()
        # Leave in neutral
        if data.data == 0:
            self.current_cwz = cwz_selected
        elif data.data in self.panda_move_group.LOCATION_POSITION.keys():
            self.panda_move_group.move_to_predefined(data.data)
            self.current_cwz = cwz_selected
        else:
            rospy.logerr("There is no position set for input: " + str(data.data))
            

    def start(self):
        rospy.loginfo('---Robot Node Started---')

        while not rospy.is_shutdown():
            # Do something
            # Each iteration it needs to do something
            # Have function that does plan?
            rospy.loginfo()
            self.loop_rate.sleep()

if __name__ == '__main__': 
    panda_move_group = MoveGroupPandaInteface()
    robot_node = RobotNode(panda_move_group)
    robot_node.start()


#     try:
#       ...      
#   except rospy.ROSInterruptException:
#     return
