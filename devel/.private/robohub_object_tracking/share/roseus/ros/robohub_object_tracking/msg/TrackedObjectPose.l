;; Auto-generated. Do not edit!


(when (boundp 'robohub_object_tracking::TrackedObjectPose)
  (if (not (find-package "ROBOHUB_OBJECT_TRACKING"))
    (make-package "ROBOHUB_OBJECT_TRACKING"))
  (shadow 'TrackedObjectPose (find-package "ROBOHUB_OBJECT_TRACKING")))
(unless (find-package "ROBOHUB_OBJECT_TRACKING::TRACKEDOBJECTPOSE")
  (make-package "ROBOHUB_OBJECT_TRACKING::TRACKEDOBJECTPOSE"))

(in-package "ROS")
;;//! \htmlinclude TrackedObjectPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass robohub_object_tracking::TrackedObjectPose
  :super ros::object
  :slots (_id _pose ))

(defmethod robohub_object_tracking::TrackedObjectPose
  (:init
   (&key
    ((:id __id) "")
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _pose __pose)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get robohub_object_tracking::TrackedObjectPose :md5sum-) "ca24679b18012554617c5552db286b5e")
(setf (get robohub_object_tracking::TrackedObjectPose :datatype-) "robohub_object_tracking/TrackedObjectPose")
(setf (get robohub_object_tracking::TrackedObjectPose :definition-)
      "# Used to hold data for each message. The '...List' message is the one actually used.
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



(provide :robohub_object_tracking/TrackedObjectPose "ca24679b18012554617c5552db286b5e")


