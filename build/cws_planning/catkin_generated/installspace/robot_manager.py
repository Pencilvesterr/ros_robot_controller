#!/usr/bin/env python2
import rospy

from std_msgs.msg import String, Int16, Int32
from cws_planning.msg import TrafficLight
from cws_planning.srv import MoveBlock

class RobotNode(object):
    def __init__(self):
        super(RobotNode, self).__init__()
        rospy.init_node('robot_coordination', anonymous=True)
        # Node cycle rate (in Hz)
        self.loop_rate = rospy.Rate(1)
        self.gaze_selection = 0
        self.current_cwz = 0

        self.pub = rospy.Publisher('/ar_selection',TrafficLight, queue_size=20)
        self.srv_move_block = rospy.ServiceProxy('/move_block', MoveBlock)
        rospy.Subscriber('/gaze_object_selected', Int32, self.callback_gaze_selection)

        rospy.loginfo("---Robot Node Initilaised---")
    

    def callback_gaze_selection(self, data):
        # TODO: Rework this so it's not based on actually moving the robot
        return 
   

    def start(self):
        rospy.loginfo('---Robot Node Started---')
        rospy.loginfo('Robot node waiting to find moveit servies...')
        rospy.wait_for_service('/move_block')
        rospy.loginfo('---Robot Found MoveIt Services---')
        resp = self.srv_move_block(1, 1)
        rospy.loginfo(str(resp))

        while not rospy.is_shutdown():
            # Do something
            # Each iteration it needs to do something
            # Have function that does plan?
            try: 
                resp = self.srv_move_block(resp.temp, 1)
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
