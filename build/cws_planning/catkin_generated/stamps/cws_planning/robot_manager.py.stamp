#!/usr/bin/env python
import rospy
import random

from std_msgs.msg import String, Int16, Int32
from cws_planning.msg import TrafficLight
from cws_planning.srv import MoveBlock, ResetRobot
from . import LightStatus

class RobotNode(object):
    AVAILABLE_BLOCKS = [11, 22, 33]
    AVAILABLE_ZONES = 3

    def __init__(self):
        super(RobotNode, self).__init__()
        rospy.init_node('robot_coordination', anonymous=True)
        # Node cycle rate (in Hz)
        self.loop_rate = rospy.Rate(1)
        self.gaze_selection = 0
        self.robot_status = 
        # This shuffles the list in place
        random.shuffle(self.AVAILABLE_BLOCKS)
        self.plan = self.AVAILABLE_BLOCKS

        self.pub_selection = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        self.srv_move_block = rospy.ServiceProxy('/move_block', MoveBlock)
        self.srv_reset_robot = rospy.ServiceProxy('/reset_to_neutral', ResetRobot)
        rospy.Subscriber('/gaze_object_selected', Int32, self.callback_gaze_selection)

        rospy.loginfo("---Robot Node Initialised---")
    
    def callback_gaze_selection(self, data):
        # TODO: Rework this so it's not based on actually moving the robot
        return 
   
    def update_AR_Tselection(next_block, next_zone, colour):
        selection_status = TrafficLight()
        selection_status.block_selected = next_block
        selection_status.block_status = colour
        selection_status.zone_selected = next_zone
        selection_status.zone_status = colour

        self.pub_selection.publish(selection_status)

    def start(self):
        rospy.loginfo('---Robot Node Started---')
        rospy.loginfo('Robot node waiting to find moveit services...')
        rospy.wait_for_service('/move_block')
        rospy.wait_for_service('/reset_to_neutral')
        rospy.loginfo('---Robot Found MoveIt Services---')

        resp = self.srv_reset_robot()
        if resp.success == True:
            rospy.loginfo("Finished resetting...")

        resp = self.srv_move_block(1, 1)
        rospy.loginfo(resp.success)

        while not rospy.is_shutdown():
            next_block = self.plan.pop()
            next_zone = random.randrange(1, self.AVAILABLE_ZONES+1)
            self.update_AR_selection(next_block, next_zone, LightStatus.yellow.value)
            rospy.sleep(5)
            self.update_AR_selection(next_block, next_zone, LightStatus.red.value)
            rospy.sleep(1)
            try: 
                resp = self.srv_move_block(next_block, next_zone)
            except rospy.ServiceException as e:
                rospy.logerr("Service called failed: " + str(e))
            self.loop_rate.sleep()

if __name__ == '__main__': 
    robot_node = RobotNode()
    robot_node.start()


#     try:
#       ...      
#   except rospy.ROSInterruptException:
#     return
