#!/usr/bin/env python  
import rospy
import math
import tf
import geometry_msgs.msg
import numpy as np
import json
import sys
from scipy.spatial.transform import Rotation
from hrca_action.utilities import *
import actionlib
from hrca_action.panda_arm import PandaArm 

if __name__ == '__main__':
    rospy.init_node('object_publisher')

    listener = tf.TransformListener()
    rot_cluster = []
    trans_cluster = []
    
    camera = "realsense"

    # wrist_
    # while not rospy.is_shutdown():
    for i in range(1):
        #rot_cluster.append([])
        #trans_cluster.append([])
        i = 29
        for _ in range(10):
            try:
                listener.waitForTransform('/panda_link0','/ar_marker_' + str(i),rospy.Time(), rospy.Duration(4.0))
                (trans,rot) = listener.lookupTransform('camera_color_optical_frame', 'ar_marker_' + str(i), rospy.Time(0))
                rot_cluster.append(rot)
                trans_cluster.append(trans)
            except Exception as e:
                print(e)
                continue
    
    # rot = Rotation.from_quat(np.array(rot_cluster)).mean()
    rot_cluster = np.array(rot_cluster)
    aldkfj = Rotation.from_quat(rot_cluster)
    print(list(aldkfj.as_quat()))
    # trans = np.array(trans_cluster).mean(axis=0)
    trans_cluster = np.array(trans_cluster)
    print(trans_cluster)
    rospy.init_node("panda_arm_client_py")
    
    
    ### test two nodes to planning scene
    ### from test_panda_arm_action_server.py
    panda_arm = PandaArm(simulation=True)
    moh = MoveitObjectHandler()

    # Add spam 
    # obj_1_size = (0.101, 0.056, 0.083)

    obj_1_size = (0.15, 0.055, 0.205)
    obj_1_rotation = (0,0,0)
    obj_1_pose = create_pose_stamped(create_pose(-0.00072, 0.34528, 0.1025, -1, 0, 0, 0), "panda_link0") # ritz

    # add object to planning scene 
    moh.add_box_object("obj_1", pose=obj_1_pose, size=obj_1_size, rotation=obj_1_rotation, frame="panda_link0")




