;; Auto-generated. Do not edit!


(when (boundp 'hrca_msgs::GetRobotPose)
  (if (not (find-package "HRCA_MSGS"))
    (make-package "HRCA_MSGS"))
  (shadow 'GetRobotPose (find-package "HRCA_MSGS")))
(unless (find-package "HRCA_MSGS::GETROBOTPOSE")
  (make-package "HRCA_MSGS::GETROBOTPOSE"))
(unless (find-package "HRCA_MSGS::GETROBOTPOSEREQUEST")
  (make-package "HRCA_MSGS::GETROBOTPOSEREQUEST"))
(unless (find-package "HRCA_MSGS::GETROBOTPOSERESPONSE")
  (make-package "HRCA_MSGS::GETROBOTPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass hrca_msgs::GetRobotPoseRequest
  :super ros::object
  :slots (_frame ))

(defmethod hrca_msgs::GetRobotPoseRequest
  (:init
   (&key
    ((:frame __frame) "")
    )
   (send-super :init)
   (setq _frame (string __frame))
   self)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:serialization-length
   ()
   (+
    ;; string _frame
    4 (length _frame)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _frame
       (write-long (length _frame) s) (princ _frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass hrca_msgs::GetRobotPoseResponse
  :super ros::object
  :slots (_pose_stamped ))

(defmethod hrca_msgs::GetRobotPoseResponse
  (:init
   (&key
    ((:pose_stamped __pose_stamped) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _pose_stamped __pose_stamped)
   self)
  (:pose_stamped
   (&rest __pose_stamped)
   (if (keywordp (car __pose_stamped))
       (send* _pose_stamped __pose_stamped)
     (progn
       (if __pose_stamped (setq _pose_stamped (car __pose_stamped)))
       _pose_stamped)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _pose_stamped
    (send _pose_stamped :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _pose_stamped
       (send _pose_stamped :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _pose_stamped
     (send _pose_stamped :deserialize buf ptr-) (incf ptr- (send _pose_stamped :serialization-length))
   ;;
   self)
  )

(defclass hrca_msgs::GetRobotPose
  :super ros::object
  :slots ())

(setf (get hrca_msgs::GetRobotPose :md5sum-) "374bd414473ccf176471f65d96682d5f")
(setf (get hrca_msgs::GetRobotPose :datatype-) "hrca_msgs/GetRobotPose")
(setf (get hrca_msgs::GetRobotPose :request) hrca_msgs::GetRobotPoseRequest)
(setf (get hrca_msgs::GetRobotPose :response) hrca_msgs::GetRobotPoseResponse)

(defmethod hrca_msgs::GetRobotPoseRequest
  (:response () (instance hrca_msgs::GetRobotPoseResponse :init)))

(setf (get hrca_msgs::GetRobotPoseRequest :md5sum-) "374bd414473ccf176471f65d96682d5f")
(setf (get hrca_msgs::GetRobotPoseRequest :datatype-) "hrca_msgs/GetRobotPoseRequest")
(setf (get hrca_msgs::GetRobotPoseRequest :definition-)
      "string frame
---
geometry_msgs/PoseStamped pose_stamped

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

(setf (get hrca_msgs::GetRobotPoseResponse :md5sum-) "374bd414473ccf176471f65d96682d5f")
(setf (get hrca_msgs::GetRobotPoseResponse :datatype-) "hrca_msgs/GetRobotPoseResponse")
(setf (get hrca_msgs::GetRobotPoseResponse :definition-)
      "string frame
---
geometry_msgs/PoseStamped pose_stamped

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



(provide :hrca_msgs/GetRobotPose "374bd414473ccf176471f65d96682d5f")


