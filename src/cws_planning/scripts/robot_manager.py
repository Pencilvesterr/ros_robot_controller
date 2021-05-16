#!/usr/bin/env python
import rospy
import random

from std_msgs.msg import String, Int16, Int32
from cws_planning.msg import TrafficLight
from cws_planning.srv import MoveBlock, ResetRobot
from python_utilities.light_status import LightStatus

class RobotNode(object):
    AVAILABLE_BLOCKS = [11, 12, 13, 21, 22, 23, 31, 32, 33]
    AVAILABLE_ZONES = 3

    def __init__(self):
        super(RobotNode, self).__init__()
        rospy.init_node('robot_coordination', anonymous=True)
        
        self.gaze_selection = 0
        # This shuffles the list in place
        random.shuffle(self.AVAILABLE_BLOCKS)
        self.remaining_blocks = self.AVAILABLE_BLOCKS

        self.pub_selection = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        self.srv_move_block = rospy.ServiceProxy('/move_block', MoveBlock)
        self.srv_reset_robot = rospy.ServiceProxy('/reset_to_neutral', ResetRobot)
        rospy.Subscriber('/gaze_object_selected', Int32, self.callback_gaze_selection)
        rospy.Subscriber('/block_placed', Int32, self.callback_block_placed)
        rospy.loginfo("---Robot node waiting to find 'Robot MoveIt' services...---")
        rospy.wait_for_service('/move_block')
        rospy.wait_for_service('/reset_to_neutral')
        rospy.loginfo("---Robot Node Initialised---")
    
    def callback_gaze_selection(self, msg):
        self.gaze_selection = msg.data
        rospy.loginfo("Gaze selection received: " + str(self.gaze_selection))
        return 

    def callback_block_placed(self, msg):
        # The block should still be in the plan if the robot hasn't placed it 
        rospy.loginfo("Block placement received: " + str(msg.data))
        if msg.data in self.remaining_blocks:
            self.remaining_blocks.remove(msg.data)
   
    def update_AR_selection(self, next_block, next_zone, colour):
        selection_status = TrafficLight()
        selection_status.block_selected = next_block
        selection_status.block_status = colour.value
        selection_status.zone_selected = next_zone
        selection_status.zone_status = colour.value

        rospy.loginfo("Setting block {}, zone {}, to {}".format(next_block, next_zone, colour.name))
        self.pub_selection.publish(selection_status)

    def get_next_block_selection(self):
        for idx, block in enumerate(self.remaining_blocks):
            # Check that next block doesn't match the same zone of current eye selection
            zone_gaze_selection = str(self.gaze_selection)[0]
            if not str(block).startswith(zone_gaze_selection):
                return self.remaining_blocks.pop(idx)

        else:
            return 0

    def selection_still_valid(self, next_zone):
        '''User can still select a block for the same zone when the robot only highlihgt yellow'''
        zone_gaze_selection = str(self.gaze_selection)[0]
        if (next_zone == int(zone_gaze_selection)):
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
            next_zone = 0
            selection_valid = False

            while not selection_valid:
                next_block = self.get_next_block_selection()
                next_zone = random.randint(1, self.AVAILABLE_ZONES)

                if next_block == 0:
                    rospy.loginfo("No remaining placable blocks")
                    rospy.sleep(10)
                    continue
                
                self.update_AR_selection(next_block, next_zone, LightStatus.yellow)
                rospy.sleep(6)

                selection_valid = self.selection_still_valid(next_block)
                if not selection_valid:
                    # User override, reset
                    rospy.sleep(2)
                    self.update_AR_selection(next_block, next_zone, LightStatus.unselected)
                    rospy.sleep(5)
                    self.remaining_blocks.append(next_block)
            
            # Have now marked block and zone red, so can proceed
            self.update_AR_selection(next_block, next_zone, LightStatus.red)
            rospy.sleep(3)

            try: 
                resp = self.srv_move_block(next_block, next_zone)
                self.update_AR_selection(next_block, next_zone, LightStatus.unselected)
                rospy.sleep(2)
                
            except rospy.ServiceException as e:
                rospy.logerr("Service called failed: " + str(e))

if __name__ == '__main__': 
    robot_node = RobotNode()
    robot_node.start()
   


#     try:
#       ...      
#   except rospy.ROSInterruptException:
#     return
