; Auto-generated. Do not edit!


(cl:in-package robohub_object_tracking-msg)


;//! \htmlinclude TrackedObjectPose.msg.html

(cl:defclass <TrackedObjectPose> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass TrackedObjectPose (<TrackedObjectPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackedObjectPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackedObjectPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robohub_object_tracking-msg:<TrackedObjectPose> is deprecated: use robohub_object_tracking-msg:TrackedObjectPose instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <TrackedObjectPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robohub_object_tracking-msg:id-val is deprecated.  Use robohub_object_tracking-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <TrackedObjectPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robohub_object_tracking-msg:pose-val is deprecated.  Use robohub_object_tracking-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackedObjectPose>) ostream)
  "Serializes a message object of type '<TrackedObjectPose>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackedObjectPose>) istream)
  "Deserializes a message object of type '<TrackedObjectPose>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackedObjectPose>)))
  "Returns string type for a message object of type '<TrackedObjectPose>"
  "robohub_object_tracking/TrackedObjectPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackedObjectPose)))
  "Returns string type for a message object of type 'TrackedObjectPose"
  "robohub_object_tracking/TrackedObjectPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackedObjectPose>)))
  "Returns md5sum for a message object of type '<TrackedObjectPose>"
  "ca24679b18012554617c5552db286b5e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackedObjectPose)))
  "Returns md5sum for a message object of type 'TrackedObjectPose"
  "ca24679b18012554617c5552db286b5e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackedObjectPose>)))
  "Returns full string definition for message of type '<TrackedObjectPose>"
  (cl:format cl:nil "# Used to hold data for each message. The '...List' message is the one actually used.~%string id~%geometry_msgs/PoseStamped pose~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackedObjectPose)))
  "Returns full string definition for message of type 'TrackedObjectPose"
  (cl:format cl:nil "# Used to hold data for each message. The '...List' message is the one actually used.~%string id~%geometry_msgs/PoseStamped pose~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackedObjectPose>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackedObjectPose>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackedObjectPose
    (cl:cons ':id (id msg))
    (cl:cons ':pose (pose msg))
))
