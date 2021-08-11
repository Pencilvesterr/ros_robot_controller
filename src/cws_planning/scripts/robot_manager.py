#!/usr/bin/env python
import rospy
import random

from std_msgs.msg import String, Int16, Int32
from cws_planning.msg import TrafficLight
from cws_planning.srv import MoveBlock, ResetRobot
from python_utilities.light_status import LightStatus

class RobotNode(object):
    AVAILABLE_BLOCKS = [11, 12, 13, 14, 15, 21, 22, 23, 24, 25, 31, 32, 33, 34, 35]
    # Use below if you hit a failure state during user study
    # AVAILABLE_BLOCKS = [11, 12, 13, 14, 15, 21, 22, 23, 24, 25, 31, 32, 33, 34, 35]
    AVAILABLE_ZONES = 3

    replan_count = 0
    moved_blocks_count = 0

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
        # Params coming from the relevant launch file 
        self.SHORT_PAUSE = rospy.get_param('/short_pause', default=1)
        self.LONG_PAUSE = rospy.get_param('/short_pause', default=4)        
        
        rospy.loginfo("---Robot Node Initialised---")
    
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
                if len(self.remaining_blocks) == 0:
                    self.exit_process()
                    break

                next_block = self.get_next_block_selection()
                next_zone = random.randint(1, self.AVAILABLE_ZONES)
                if next_block == 0:
                    rospy.logwarn("No remaining placable blocks")
                    rospy.sleep(self.LONG_PAUSE)
                    continue
                
                self.update_AR_selection(next_block, next_zone, LightStatus.yellow)
                rospy.sleep(self.LONG_PAUSE)

                selection_valid = self.selection_still_valid(next_block, next_zone)
                if not selection_valid:
                    rospy.logwarn("Updating plan based on conflict")
                    self.replan_count += 1
                    # User override, reset selection
                    rospy.sleep(self.SHORT_PAUSE)
                    self.update_AR_selection(next_block, next_zone, LightStatus.unselected)
                    rospy.sleep(self.SHORT_PAUSE)
                    self.remaining_blocks.append(next_block)
            
            # A valid block selection was found
            if next_block != 0:
                self.update_AR_selection(next_block, next_zone, LightStatus.red)
                rospy.sleep(self.SHORT_PAUSE)
                try: 
                    resp = self.srv_move_block(next_block, next_zone)
                    if resp:
                        self.moved_blocks_count += 1
                    else:
                        rospy.logwarn("MoveIt failed to move block {}".format(next_block))
                        
                    self.update_AR_selection(next_block, next_zone, LightStatus.unselected)
                    rospy.sleep(self.SHORT_PAUSE)
                except rospy.ServiceException as e:
                    rospy.logerr("Service called failed: " + str(e))
    
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
            # Check that next blocke 25 doesn't match the same zone of current eye selection
            zone_gaze_selection = str(self.gaze_selection)[0]
            if not str(block).startswith(zone_gaze_selection):
                return self.remaining_blocks.pop(idx)
        else:
            return 0

    def selection_still_valid(self, next_block, next_zone):
        '''User can still select a block for the same zone when the robot only highlihgt yellow'''
        zone_gaze_selection = str(self.gaze_selection)[0]
        if (next_zone == int(zone_gaze_selection) or next_block == self.gaze_selection):
            return False
        else:
            return True

    def exit_process(self):
        rospy.loginfo("All blocks complete")
        rospy.loginfo("------------------")
        rospy.loginfo("Robot moved {} blocks".format(self.moved_blocks_count))
        rospy.loginfo("Robot replanned {} times".format(self.replan_count))
        # Spin keeps the terminal open while allowing you to ctrl c at any time
        rospy.spin()


if __name__ == '__main__': 
    robot_node = RobotNode()
    robot_node.start()
