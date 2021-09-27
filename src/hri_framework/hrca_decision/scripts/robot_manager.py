#!/usr/bin/env python
import rospy
import random
import timeit

from std_msgs.msg import String, Int16, Int32
from hrca_decision.msg import TrafficLight
from hrca_decision.srv import MoveBlock, ResetRobot
from python_utilities.light_status import LightStatus

class RobotNode(object):
    AVAILABLE_BLOCKS = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27]
    # Use below if you hit a failure state during user study
    # AVAILABLE_BLOCKS = [11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27]
    AVAILABLE_ZONES = 2

    replan_count = 0
    moved_blocks_count = 0

    def __init__(self):
        super(RobotNode, self).__init__()
        rospy.init_node('robot_coordination', anonymous=True)  

        self.pub_selection = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        self.pub_study_consition = rospy.Publisher('/study_condition', Int32, queue_size=10)
        self.srv_move_block = rospy.ServiceProxy('/move_block', MoveBlock)
        self.srv_reset_robot = rospy.ServiceProxy('/reset_to_neutral', ResetRobot)
        rospy.Subscriber('/gaze_object_selected', Int32, self.callback_gaze_selection)
        rospy.Subscriber('/block_placed', Int32, self.callback_block_placed)
        rospy.loginfo("---Robot node waiting to find 'Robot MoveIt' services...---")
        rospy.wait_for_service('/move_block')
        rospy.wait_for_service('/reset_to_neutral')
        # Params coming from the relevant launch file 
        self.SHORT_PAUSE = rospy.get_param('/short_pause', default=1)
        self.LONG_PAUSE = rospy.get_param('/long_pause', default=3)        
        
        rospy.loginfo("---Robot Node Initialised---")
    
    def _run_study_condition(self):
        self.start_time = timeit.default_timer()
        resp = self.srv_reset_robot(0.1)
        if resp.success == False:
            rospy.logerr("Unable to reset robot, ending node")
            return

        while not rospy.is_shutdown():
            next_block = 0
            next_zone = 0
            selection_valid = False

            while not selection_valid:
                if len(self.remaining_blocks) == 0:
                    self._exit_process()
                    return

                next_block = self.get_next_block_selection()
                # next_zone = random.randint(1, self.AVAILABLE_ZONES)
                next_zone = int(str(next_block)[0])  # Gets the first digit of the block number
                if next_block == 0:
                    rospy.logwarn("No remaining placable blocks")
                    rospy.sleep(self.LONG_PAUSE)
                    continue
                
                self._update_AR_selection(next_block, next_zone, LightStatus.yellow)
                # May already be reset, so ensures it always waits atleast LONG_PAUSE seconds
                start_pause = timeit.default_timer()
                resp = self.srv_reset_robot(0.0) # 0 will use default value
                paused_time = timeit.default_timer() - start_pause
                if paused_time <= self.LONG_PAUSE:
                    rospy.sleep(self.LONG_PAUSE - paused_time)

                selection_valid = self.selection_still_valid(next_block, next_zone)
                if not selection_valid:
                    rospy.logwarn("Updating plan based on conflict")
                    self.replan_count += 1
                    # User override, reset selection
                    rospy.sleep(self.SHORT_PAUSE)
                    self._update_AR_selection(next_block, next_zone, LightStatus.unselected)
                    rospy.sleep(self.SHORT_PAUSE)
                    self.remaining_blocks.append(next_block)
            
            # A valid block selection was found
            if next_block != 0:
                self._update_AR_selection(next_block, next_zone, LightStatus.red)
                rospy.sleep(self.SHORT_PAUSE)
                try: 
                    resp = self.srv_move_block(next_block, next_zone)
                    if resp:
                        self.moved_blocks_count += 1
                    else:
                        rospy.logwarn("MoveIt failed to move block {}".format(next_block))
                        
                    self._update_AR_selection(next_block, next_zone, LightStatus.unselected)
                    rospy.sleep(self.SHORT_PAUSE)
                except rospy.ServiceException as e:
                    rospy.logerr("Service called failed: " + str(e))
    
    def callback_gaze_selection(self, msg):
        self.gaze_selection = msg.data
        if self.gaze_selection == 0:
            rospy.loginfo("Gaze selection reset")
        else: 
            rospy.loginfo("Gaze selection received: " + str(self.gaze_selection))
        return 

    def callback_block_placed(self, msg):
        # The block should still be in the plan if the robot hasn't placed it 
        rospy.loginfo("Block placement received: " + str(msg.data))
        if msg.data in self.remaining_blocks:
            self.remaining_blocks.remove(msg.data)
            # Clear the gaze selection of user after confirming placement
            self.gaze_selection = 0
        else:
            rospy.logwarn("Block placement {} recieved for block not in remaining queue".format(msg.data))

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
    
    def _update_AR_selection(self, next_block, next_zone, colour):
        selection_status = TrafficLight()
        selection_status.block_selected = next_block
        selection_status.block_status = colour.value
        selection_status.zone_selected = next_zone
        selection_status.zone_status = colour.value

        rospy.loginfo("Setting block {}, zone {}, to {}".format(next_block, next_zone, colour.name))
        self.pub_selection.publish(selection_status)

    def _reset_study(self):
        self.gaze_selection = 0
        self.moved_blocks_count = 0
        # Shuffle the list in place
        random.shuffle(self.AVAILABLE_BLOCKS)
        # List slicing copies list content instead of reference
        self.remaining_blocks = self.AVAILABLE_BLOCKS[:]  

    def _exit_process(self):
        rospy.loginfo("All blocks complete")
        rospy.loginfo("------------------")
        rospy.loginfo("Robot moved {} blocks".format(self.moved_blocks_count))
        rospy.loginfo("Robot replanned {} times".format(self.replan_count))
        rospy.loginfo("Total time taken: {:.2f}s".format(timeit.default_timer() - self.start_time))
        self.srv_reset_robot(0.0)

    def _get_study_condition(self):
        valid_study_condition = False
        while not valid_study_condition:
            rospy.loginfo("--------------------")
            rospy.loginfo("Choose study condition")
            rospy.loginfo("--------------------")        
            rospy.loginfo("1: Traffic light and eye gaze")
            rospy.loginfo("2: Traffic light only")
            rospy.loginfo("3: Eye gaze only")
            rospy.loginfo("4: Neither on")
            study_condition = int(raw_input("Selection: "))
            if study_condition in [1, 2, 3, 4]:
                self.pub_study_consition.publish(study_condition)
                valid_study_condition = True

if __name__ == '__main__': 
    robot_node = RobotNode()
    while not rospy.is_shutdown():
        robot_node._get_study_condition()
        robot_node._reset_study()
        robot_node._run_study_condition()
