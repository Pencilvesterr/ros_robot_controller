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
        
        self.gaze_selection = 0
        # This shuffles the list in place
        random.shuffle(self.AVAILABLE_BLOCKS)
        self.plan = self.AVAILABLE_BLOCKS

        self.pub_selection = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        self.srv_move_block = rospy.ServiceProxy('/move_block', MoveBlock)
        self.srv_reset_robot = rospy.ServiceProxy('/reset_to_neutral', ResetRobot)
        rospy.Subscriber('/gaze_object_selected', Int32, self.callback_gaze_selection)
        rospy.Subscriver('/block_placed', Int32, self.callback_block_placed)
        rospy.loginfo("---Robot node waiting to find 'Robot MoveIt' services...---")
        rospy.wait_for_service('/move_block')
        rospy.wait_for_service('/reset_to_neutral')
        rospy.loginfo("---Robot Node Initialised---")
    
    def callback_gaze_selection(self, msg):
        self.gaze_selection = msg.data
        return 

    def callback_block_placed(self, msg):
        # The block should still be in the plan if the robot hasn't placed it 
        if msg.data in self.plan:
            self.plan.remove(msg.data)
   
    def update_AR_Tselection(self, next_block, next_zone, colour):
        selection_status = TrafficLight()
        selection_status.block_selected = next_block
        selection_status.block_status = colour
        selection_status.zone_selected = next_zone
        selection_status.zone_status = colour

        self.pub_selection.publish(selection_status)

    def get_next_block_selection(self):
        for idx, block in enumerate(self.plan):
            # Check that next block doesn't match the same zone of current eye selection
            zone_gaze_selection = str(self.gaze_selection)[0]
            if not str(block).startswith(zone_gaze_selection):
                return self.plan.pop(idx)

        else:
            return 0

    def selection_still_valid(self, next_block):
        '''User can still select a block for the same zone when the robot only highlihgt yellow'''
        zone_gaze_selection = str(self.gaze_selection)[0]
        if (str(next_block).startswith(zone_gaze_selection)):
            return False
        else:
            return True

    def start(self):
        resp = self.srv_reset_robot()
        if resp.success == False:
            rospy.logerror("Unable to reset robot, ending node")
            return

        while not rospy.is_shutdown():
            next_block = 0
            next_zone = str(next_block)[0]
            selection_valid = False

            while not selection_valid:
                next_block = self.get_next_block_selection()
                self.update_AR_selection(next_block, next_zone, LightStatus.yellow.value)
                rospy.sleep(5)
                selection_valid = self.selection_still_valid(next_block)
                if selection_valid:
                    self.update_AR_selection(next_block, next_zone, LightStatus.red.value)
                else:
                    self.plan.append(next_block)

            # Have now marked block and zone red, so can proceed
            try: 
                rospy.sleep(5)
                resp = self.srv_move_block(next_block, next_zone)
            except rospy.ServiceException as e:
                rospy.logerr("Service called failed: " + str(e))

if __name__ == '__main__': 
    robot_node = RobotNode()
    robot_node.start()


#     try:
#       ...      
#   except rospy.ROSInterruptException:
#     return
