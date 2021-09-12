#!/usr/bin/env python  
import rospy
import math
import tf
import geometry_msgs.msg
import numpy as np
import json
import sys
from scipy.spatial.transform import Rotation
from hrca_msgs.srv import get_object_angle, get_object_angleResponse

class object_pos:
    def __init__(self):

        self.listener = tf.TransformListener()

        self.camera = "realsense"
        # self.angle_pos = 0
        # self.trans_pos = [0, 0, 0]
        # self.cam_pos = []

        # self.get_current_angle(my_ID = 29)
        self.valid_IDs = [29, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]

        self.s = rospy.Service('get_object_angle', get_object_angle, self.angle_callback)
        
    def angle_callback(self, req):
        if req.ID in self.valid_IDs:
            if req.update:
                self.update(this_ID = req.ID)
            return get_object_angleResponse(success = True, angle = self.angle_pos, Cartesian_Pos = self.trans_pos, Cam_Pos = self.cam_pos, error = "")
        else:
            print("req.ID: ", req.ID)
            return get_object_angleResponse(success = False, angle = 0, Cartesian_Pos = [0, 0, 0], Cam_Pos = [0, 0, 0], error = "Not Valid ID")

    def update(self, this_ID):
        self.get_current_angle(my_ID = this_ID)

    def get_current_angle(self, my_ID):

        rot_cluster = []
        trans_cluster = []
        for i in range(1):
            i = my_ID
            for _ in range(10):
                try:
                    self.listener.waitForTransform('/panda_link0','/ar_marker_' + str(i), rospy.Time(), rospy.Duration(4.0))
                    (trans,rot) = self.listener.lookupTransform('panda_link0', 'ar_marker_' + str(i), rospy.Time(0))
                    rot_cluster.append(rot)
                    trans_cluster.append(trans)
                except Exception as e:
                    print(e)
                    continue
        
        self.listener.waitForTransform('/camera_color_optical_frame','/ar_marker_' + str(i), rospy.Time(), rospy.Duration(4.0))
        (trans_cam, _) = self.listener.lookupTransform('camera_color_optical_frame', 'ar_marker_' + str(i), rospy.Time(0))

        mean_rot = np.array(rot_cluster).mean(axis = 0)
        rotation_matrix = Rotation.from_quat(mean_rot)
        euler_angle = rotation_matrix.as_euler('xyz', degrees=True)
        self.angle_pos = euler_angle[2]
        self.trans_pos = np.array(trans_cluster).mean(axis=0)
        self.cam_pos = trans_cam
        

if __name__ == '__main__':
    rospy.init_node('object_publisher')

    # listener = tf.TransformListener()
    # rot_cluster = []
    # trans_cluster = []
    
    # camera = "realsense"

    # for i in range(1):
    #     i = 29
    #     for _ in range(10):
    #         try:
    #             listener.waitForTransform('/panda_link0','/ar_marker_' + str(i),rospy.Time(), rospy.Duration(4.0))
    #             (trans,rot) = listener.lookupTransform('panda_link0', 'ar_marker_' + str(i), rospy.Time(0))
    #             rot_cluster.append(rot)
    #             trans_cluster.append(trans)
    #         except Exception as e:
    #             print(e)
    #             continue
    
    # # rot = Rotation.from_quat(np.array(rot_cluster)).mean()
    # mean_rot = np.array(rot_cluster).mean(axis = 0)
    # rotation_matrix = Rotation.from_quat(mean_rot)
    # # rotation_matrix = Rotation.from_quat([1, 0, 0, 0])
    # # print(rotation_matrix.as_euler('xyz', degrees=True))
    # euler_angle = rotation_matrix.as_euler('xyz', degrees=True)
    # angle_pos = euler_angle[2]
    # # print(rotation_matrix.as_euler('ZYX', degrees=True))
    
    # trans_pos = np.array(trans_cluster).mean(axis=0)
    # # print(trans_cluster)

    obj_pos_object = object_pos()
    rospy.spin()






