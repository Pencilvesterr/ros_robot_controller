; Auto-generated. Do not edit!


(cl:in-package robohub_object_tracking-msg)


;//! \htmlinclude TrackedObjectPoseList.msg.html

(cl:defclass <TrackedObjectPoseList> (roslisp-msg-protocol:ros-message)
  ((object_list
    :reader object_list
    :initarg :object_list
    :type (cl:vector robohub_object_tracking-msg:TrackedObjectPose)
   :initform (cl:make-array 0 :element-type 'robohub_object_tracking-msg:TrackedObjectPose :initial-element (cl:make-instance 'robohub_object_tracking-msg:TrackedObjectPose))))
)

(cl:defclass TrackedObjectPoseList (<TrackedObjectPoseList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackedObjectPoseList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackedObjectPoseList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robohub_object_tracking-msg:<TrackedObjectPoseList> is deprecated: use robohub_object_tracking-msg:TrackedObjectPoseList instead.")))

(cl:ensure-generic-function 'object_list-val :lambda-list '(m))
(cl:defmethod object_list-val ((m <TrackedObjectPoseList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robohub_object_tracking-msg:object_list-val is deprecated.  Use robohub_object_tracking-msg:object_list instead.")
  (object_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackedObjectPoseList>) ostream)
  "Serializes a message object of type '<TrackedObjectPoseList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackedObjectPoseList>) istream)
  "Deserializes a message object of type '<TrackedObjectPoseList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robohub_object_tracking-msg:TrackedObjectPose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackedObjectPoseList>)))
  "Returns string type for a message object of type '<TrackedObjectPoseList>"
  "robohub_object_tracking/TrackedObjectPoseList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackedObjectPoseList)))
  "Returns string type for a message object of type 'TrackedObjectPoseList"
  "robohub_object_tracking/TrackedObjectPoseList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackedObjectPoseList>)))
  "Returns md5sum for a message object of type '<TrackedObjectPoseList>"
  "426728e80dadb19a5b9479f4048ea61c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackedObjectPoseList)))
  "Returns md5sum for a message object of type 'TrackedObjectPoseList"
  "426728e80dadb19a5b9479f4048ea61c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackedObjectPoseList>)))
  "Returns full string definition for message of type '<TrackedObjectPoseList>"
  (cl:format cl:nil "robohub_object_tracking/TrackedObjectPose[] object_list~%================================================================================~%MSG: robohub_object_tracking/TrackedObjectPose~%# Used to hold data for each message. The '...List' message is the one actually used.~%string id~%geometry_msgs/PoseStamped pose~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackedObjectPoseList)))
  "Returns full string definition for message of type 'TrackedObjectPoseList"
  (cl:format cl:nil "robohub_object_tracking/TrackedObjectPose[] object_list~%================================================================================~%MSG: robohub_object_tracking/TrackedObjectPose~%# Used to hold data for each message. The '...List' message is the one actually used.~%string id~%geometry_msgs/PoseStamped pose~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackedObjectPoseList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackedObjectPoseList>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackedObjectPoseList
    (cl:cons ':object_list (object_list msg))
))
