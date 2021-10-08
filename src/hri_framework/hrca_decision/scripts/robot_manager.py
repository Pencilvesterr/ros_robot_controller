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
    AVAILABLE_ZONES = 2

    replan_count = 0
    incorrect_gaze_prediction = 0
    correct_gaze_prediction = 0
    moved_blocks_count = 0
    potential_errors = 0
    next_zone = 0
    gaze_selection = 0
    study_running = False

    def __init__(self):
        super(RobotNode, self).__init__()
        rospy.init_node('robot_coordination', anonymous=True)  

        self.pub_selection = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        self.pub_study_consition = rospy.Publisher('/study_condition', Int32, queue_size=10)
        self.srv_move_block = rospy.ServiceProxy('/move_block', MoveBlock)
        self.srv_reset_robot = rospy.ServiceProxy('/reset_to_neutral', ResetRobot)
        rospy.Subscriber('/gaze_object_selected', Int32, self.callback_gaze_selection)
        rospy.Subscriber('/block_placed', Int32, self.callback_block_selected)
        rospy.loginfo("---Robot node waiting to find 'Robot MoveIt' services...---")
        rospy.wait_for_service('/move_block')
        rospy.wait_for_service('/reset_to_neutral')
        # Params coming from the relevant launch file 
        self.SHORT_PAUSE = rospy.get_param('/short_pause', default=1)
        self.LONG_PAUSE = rospy.get_param('/long_pause', default=3)        
        
        rospy.loginfo("---Robot Node Initialised---")
    
    def _run_study_condition(self):
        self.study_running = True
        self.start_time = timeit.default_timer()
        while not rospy.is_shutdown():
            robot_block = 0
            self.robot_zone = 0
            selection_valid = False

            while not selection_valid:
                if len(self.remaining_blocks) == 0:
                    self._finalise_study()
                    return

                robot_block = self.get_next_block_selection()
                self.robot_zone = random.randint(1, self.AVAILABLE_ZONES)
                # Uses the first digit of the block number for zone
                # self.robot_zone = int(str(robot_block)[0])  
                if robot_block == 0:
                    rospy.logwarn("No remaining placable blocks")
                    rospy.sleep(self.LONG_PAUSE)
                    continue
                
                self._update_AR_selection(robot_block, self.robot_zone, LightStatus.yellow)
                # May already be reset, so ensures it always waits atleast LONG_PAUSE seconds
                start_pause = timeit.default_timer()
                resp = self.srv_reset_robot(0.0) # 0 will use default value
                paused_time = timeit.default_timer() - start_pause
                if paused_time <= self.LONG_PAUSE:
                    rospy.sleep(self.LONG_PAUSE - paused_time)

                selection_valid = self.selection_still_valid(robot_block, self.robot_zone)
                if not selection_valid:
                    rospy.logwarn("Updating plan based on conflict")
                    self.replan_count += 1
                    # User override, reset selection
                    rospy.sleep(self.SHORT_PAUSE)
                    self._update_AR_selection(robot_block, self.robot_zone, LightStatus.unselected)
                    rospy.sleep(self.SHORT_PAUSE)
                    self.remaining_blocks.append(robot_block)
            
            # A valid block selection was found
            if robot_block != 0:
                self._update_AR_selection(robot_block, self.robot_zone, LightStatus.red)
                rospy.sleep(self.SHORT_PAUSE)
                try: 
                    resp = self.srv_move_block(robot_block, self.robot_zone)
                    if resp:
                        self.moved_blocks_count += 1
                    else:
                        rospy.logwarn("MoveIt failed to move block {}".format(robot_block))
                        
                    self._update_AR_selection(robot_block, self.robot_zone, LightStatus.unselected)
                    rospy.sleep(self.SHORT_PAUSE)
                except rospy.ServiceException as e:
                    rospy.logerr("Service called failed: " + str(e))
    
    def callback_gaze_selection(self, msg):
        if not self.study_running:
            return 
        
        self.gaze_selection = msg.data
        if self.gaze_selection == 0:
            rospy.loginfo("Gaze selection reset")
        else: 
            rospy.loginfo("Gaze selection received: " + str(self.gaze_selection))
        return 

    def callback_block_selected(self, msg):
        # The block should still be in the plan if the robot hasn't placed it 
        block_selection = msg.data
        rospy.logwarn("Block selection received: " + str(block_selection))
        if block_selection in self.remaining_blocks:
            self.remaining_blocks.remove(block_selection)
            if block_selection == self.gaze_selection:
                self.correct_gaze_prediction += 1
            # A prediction was made, but it was incorrect. Dont care when there is no current prediction
            elif self.gaze_selection != 0:
                self.incorrect_gaze_prediction += 1
                
            user_zone = int(str(block_selection)[0])  
            if user_zone == self.robot_zone:
                # The user has selected to place a block in a zone the robot has selected.
                # This doesn't mean they will enter the zone / count as an error
                self.potential_errors += 1
                
        else:
            rospy.logerr("Block selection {} recieved, but block not in remaining queue".format(msg.data))

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

    def _finalise_study(self):
        self.study_running = False
        rospy.loginfo("All blocks complete")
        rospy.loginfo("------------------")
        rospy.loginfo("Robot moved {} blocks".format(self.moved_blocks_count))
        rospy.loginfo("Robot replanned {} times".format(self.replan_count))
        rospy.loginfo("Gaze incorrectly predicted user selection {} times".format(self.incorrect_gaze_prediction))
        rospy.loginfo("Gaze correctly predicted user selection {} times".format(self.correct_gaze_prediction))
        rospy.loginfo("User potentially entered the robot's zone {} times".format(self.potential_errors))
        rospy.loginfo("Total time taken: {:.2f}s".format(timeit.default_timer() - self.start_time))
        self.srv_reset_robot(0.0)
        
    def _reset_study(self):
        self.gaze_selection = 0
        self.moved_blocks_count = 0
        self.incorrect_gaze_prediction = 0
        self.correct_gaze_prediction = 0
        self.potential_errors = 0
        # Shuffle the list in place
        random.shuffle(self.AVAILABLE_BLOCKS)
        # List slicing copies list content instead of reference
        self.remaining_blocks = self.AVAILABLE_BLOCKS[:]  

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
    # Initial slow reset of robot to home pos
    resp = robot_node.srv_reset_robot(0.1)
    if resp.success == False:
        rospy.logerr("Unable to reset robot. Ending node.")
        rospy.signal_shutdown("Failure to reset robot")
    
    while not rospy.is_shutdown():
        robot_node._reset_study()
        robot_node._get_study_condition()
        robot_node._run_study_condition()
