; Auto-generated. Do not edit!


(cl:in-package hrca_msgs-srv)


;//! \htmlinclude GetRobotPose-request.msg.html

(cl:defclass <GetRobotPose-request> (roslisp-msg-protocol:ros-message)
  ((frame
    :reader frame
    :initarg :frame
    :type cl:string
    :initform ""))
)

(cl:defclass GetRobotPose-request (<GetRobotPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRobotPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRobotPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_msgs-srv:<GetRobotPose-request> is deprecated: use hrca_msgs-srv:GetRobotPose-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <GetRobotPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_msgs-srv:frame-val is deprecated.  Use hrca_msgs-srv:frame instead.")
  (frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRobotPose-request>) ostream)
  "Serializes a message object of type '<GetRobotPose-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRobotPose-request>) istream)
  "Deserializes a message object of type '<GetRobotPose-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRobotPose-request>)))
  "Returns string type for a service object of type '<GetRobotPose-request>"
  "hrca_msgs/GetRobotPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRobotPose-request)))
  "Returns string type for a service object of type 'GetRobotPose-request"
  "hrca_msgs/GetRobotPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRobotPose-request>)))
  "Returns md5sum for a message object of type '<GetRobotPose-request>"
  "374bd414473ccf176471f65d96682d5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRobotPose-request)))
  "Returns md5sum for a message object of type 'GetRobotPose-request"
  "374bd414473ccf176471f65d96682d5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRobotPose-request>)))
  "Returns full string definition for message of type '<GetRobotPose-request>"
  (cl:format cl:nil "string frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRobotPose-request)))
  "Returns full string definition for message of type 'GetRobotPose-request"
  (cl:format cl:nil "string frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRobotPose-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRobotPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRobotPose-request
    (cl:cons ':frame (frame msg))
))
;//! \htmlinclude GetRobotPose-response.msg.html

(cl:defclass <GetRobotPose-response> (roslisp-msg-protocol:ros-message)
  ((pose_stamped
    :reader pose_stamped
    :initarg :pose_stamped
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass GetRobotPose-response (<GetRobotPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRobotPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRobotPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_msgs-srv:<GetRobotPose-response> is deprecated: use hrca_msgs-srv:GetRobotPose-response instead.")))

(cl:ensure-generic-function 'pose_stamped-val :lambda-list '(m))
(cl:defmethod pose_stamped-val ((m <GetRobotPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_msgs-srv:pose_stamped-val is deprecated.  Use hrca_msgs-srv:pose_stamped instead.")
  (pose_stamped m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRobotPose-response>) ostream)
  "Serializes a message object of type '<GetRobotPose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_stamped) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRobotPose-response>) istream)
  "Deserializes a message object of type '<GetRobotPose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_stamped) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRobotPose-response>)))
  "Returns string type for a service object of type '<GetRobotPose-response>"
  "hrca_msgs/GetRobotPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRobotPose-response)))
  "Returns string type for a service object of type 'GetRobotPose-response"
  "hrca_msgs/GetRobotPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRobotPose-response>)))
  "Returns md5sum for a message object of type '<GetRobotPose-response>"
  "374bd414473ccf176471f65d96682d5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRobotPose-response)))
  "Returns md5sum for a message object of type 'GetRobotPose-response"
  "374bd414473ccf176471f65d96682d5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRobotPose-response>)))
  "Returns full string definition for message of type '<GetRobotPose-response>"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose_stamped~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRobotPose-response)))
  "Returns full string definition for message of type 'GetRobotPose-response"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose_stamped~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRobotPose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_stamped))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRobotPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRobotPose-response
    (cl:cons ':pose_stamped (pose_stamped msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetRobotPose)))
  'GetRobotPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetRobotPose)))
  'GetRobotPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRobotPose)))
  "Returns string type for a service object of type '<GetRobotPose>"
  "hrca_msgs/GetRobotPose")