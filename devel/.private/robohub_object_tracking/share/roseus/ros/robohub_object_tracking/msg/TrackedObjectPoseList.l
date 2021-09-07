;; Auto-generated. Do not edit!


(when (boundp 'robohub_object_tracking::TrackedObjectPoseList)
  (if (not (find-package "ROBOHUB_OBJECT_TRACKING"))
    (make-package "ROBOHUB_OBJECT_TRACKING"))
  (shadow 'TrackedObjectPoseList (find-package "ROBOHUB_OBJECT_TRACKING")))
(unless (find-package "ROBOHUB_OBJECT_TRACKING::TRACKEDOBJECTPOSELIST")
  (make-package "ROBOHUB_OBJECT_TRACKING::TRACKEDOBJECTPOSELIST"))

(in-package "ROS")
;;//! \htmlinclude TrackedObjectPoseList.msg.html


(defclass robohub_object_tracking::TrackedObjectPoseList
  :super ros::object
  :slots (_object_list ))

(defmethod robohub_object_tracking::TrackedObjectPoseList
  (:init
   (&key
    ((:object_list __object_list) (let (r) (dotimes (i 0) (push (instance robohub_object_tracking::TrackedObjectPose :init) r)) r))
    )
   (send-super :init)
   (setq _object_list __object_list)
   self)
  (:object_list
   (&rest __object_list)
   (if (keywordp (car __object_list))
       (send* _object_list __object_list)
     (progn
       (if __object_list (setq _object_list (car __object_list)))
       _object_list)))
  (:serialization-length
   ()
   (+
    ;; robohub_object_tracking/TrackedObjectPose[] _object_list
    (apply #'+ (send-all _object_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robohub_object_tracking/TrackedObjectPose[] _object_list
     (write-long (length _object_list) s)
     (dolist (elem _object_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robohub_object_tracking/TrackedObjectPose[] _object_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_list (let (r) (dotimes (i n) (push (instance robohub_object_tracking::TrackedObjectPose :init) r)) r))
     (dolist (elem- _object_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get robohub_object_tracking::TrackedObjectPoseList :md5sum-) "426728e80dadb19a5b9479f4048ea61c")
(setf (get robohub_object_tracking::TrackedObjectPoseList :datatype-) "robohub_object_tracking/TrackedObjectPoseList")
(setf (get robohub_object_tracking::TrackedObjectPoseList :definition-)
      "robohub_object_tracking/TrackedObjectPose[] object_list
================================================================================
MSG: robohub_object_tracking/TrackedObjectPose
# Used to hold data for each message. The '...List' message is the one actually used.
string id
geometry_msgs/PoseStamped pose
================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :robohub_object_tracking/TrackedObjectPoseList "426728e80dadb19a5b9479f4048ea61c")


