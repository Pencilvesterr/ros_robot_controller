; Auto-generated. Do not edit!


(cl:in-package hrca_msgs-msg)


;//! \htmlinclude RobotTaskGoal.msg.html

(cl:defclass <RobotTaskGoal> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (pose1
    :reader pose1
    :initarg :pose1
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (pose2
    :reader pose2
    :initarg :pose2
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (object_name
    :reader object_name
    :initarg :object_name
    :type cl:string
    :initform ""))
)

(cl:defclass RobotTaskGoal (<RobotTaskGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotTaskGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotTaskGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_msgs-msg:<RobotTaskGoal> is deprecated: use hrca_msgs-msg:RobotTaskGoal instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <RobotTaskGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_msgs-msg:action-val is deprecated.  Use hrca_msgs-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'pose1-val :lambda-list '(m))
(cl:defmethod pose1-val ((m <RobotTaskGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_msgs-msg:pose1-val is deprecated.  Use hrca_msgs-msg:pose1 instead.")
  (pose1 m))

(cl:ensure-generic-function 'pose2-val :lambda-list '(m))
(cl:defmethod pose2-val ((m <RobotTaskGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_msgs-msg:pose2-val is deprecated.  Use hrca_msgs-msg:pose2 instead.")
  (pose2 m))

(cl:ensure-generic-function 'object_name-val :lambda-list '(m))
(cl:defmethod object_name-val ((m <RobotTaskGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_msgs-msg:object_name-val is deprecated.  Use hrca_msgs-msg:object_name instead.")
  (object_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotTaskGoal>) ostream)
  "Serializes a message object of type '<RobotTaskGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose2) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotTaskGoal>) istream)
  "Deserializes a message object of type '<RobotTaskGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose2) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotTaskGoal>)))
  "Returns string type for a message object of type '<RobotTaskGoal>"
  "hrca_msgs/RobotTaskGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTaskGoal)))
  "Returns string type for a message object of type 'RobotTaskGoal"
  "hrca_msgs/RobotTaskGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotTaskGoal>)))
  "Returns md5sum for a message object of type '<RobotTaskGoal>"
  "7f2c64fd41eafea32d78342b5e64b8ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotTaskGoal)))
  "Returns md5sum for a message object of type 'RobotTaskGoal"
  "7f2c64fd41eafea32d78342b5e64b8ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotTaskGoal>)))
  "Returns full string definition for message of type '<RobotTaskGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string action #'hold', 'pick_and_place', 'move_to_pose', 'move_to_pose_cartesian', 'pick_and_handoff'~%geometry_msgs/PoseStamped pose1~%geometry_msgs/PoseStamped pose2~%string object_name~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotTaskGoal)))
  "Returns full string definition for message of type 'RobotTaskGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string action #'hold', 'pick_and_place', 'move_to_pose', 'move_to_pose_cartesian', 'pick_and_handoff'~%geometry_msgs/PoseStamped pose1~%geometry_msgs/PoseStamped pose2~%string object_name~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotTaskGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose2))
     4 (cl:length (cl:slot-value msg 'object_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotTaskGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotTaskGoal
    (cl:cons ':action (action msg))
    (cl:cons ':pose1 (pose1 msg))
    (cl:cons ':pose2 (pose2 msg))
    (cl:cons ':object_name (object_name msg))
))
