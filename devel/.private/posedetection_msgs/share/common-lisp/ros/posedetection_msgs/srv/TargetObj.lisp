; Auto-generated. Do not edit!


(cl:in-package posedetection_msgs-srv)


;//! \htmlinclude TargetObj-request.msg.html

(cl:defclass <TargetObj-request> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform ""))
)

(cl:defclass TargetObj-request (<TargetObj-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TargetObj-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TargetObj-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name posedetection_msgs-srv:<TargetObj-request> is deprecated: use posedetection_msgs-srv:TargetObj-request instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <TargetObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-srv:type-val is deprecated.  Use posedetection_msgs-srv:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TargetObj-request>) ostream)
  "Serializes a message object of type '<TargetObj-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TargetObj-request>) istream)
  "Deserializes a message object of type '<TargetObj-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TargetObj-request>)))
  "Returns string type for a service object of type '<TargetObj-request>"
  "posedetection_msgs/TargetObjRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetObj-request)))
  "Returns string type for a service object of type 'TargetObj-request"
  "posedetection_msgs/TargetObjRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TargetObj-request>)))
  "Returns md5sum for a message object of type '<TargetObj-request>"
  "ef30370054b38413dfbfa16532d6fb84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TargetObj-request)))
  "Returns md5sum for a message object of type 'TargetObj-request"
  "ef30370054b38413dfbfa16532d6fb84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TargetObj-request>)))
  "Returns full string definition for message of type '<TargetObj-request>"
  (cl:format cl:nil "# service that returns posedetection_msgs/Object6DPose~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TargetObj-request)))
  "Returns full string definition for message of type 'TargetObj-request"
  (cl:format cl:nil "# service that returns posedetection_msgs/Object6DPose~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TargetObj-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TargetObj-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TargetObj-request
    (cl:cons ':type (type msg))
))
;//! \htmlinclude TargetObj-response.msg.html

(cl:defclass <TargetObj-response> (roslisp-msg-protocol:ros-message)
  ((object_pose
    :reader object_pose
    :initarg :object_pose
    :type posedetection_msgs-msg:Object6DPose
    :initform (cl:make-instance 'posedetection_msgs-msg:Object6DPose)))
)

(cl:defclass TargetObj-response (<TargetObj-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TargetObj-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TargetObj-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name posedetection_msgs-srv:<TargetObj-response> is deprecated: use posedetection_msgs-srv:TargetObj-response instead.")))

(cl:ensure-generic-function 'object_pose-val :lambda-list '(m))
(cl:defmethod object_pose-val ((m <TargetObj-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-srv:object_pose-val is deprecated.  Use posedetection_msgs-srv:object_pose instead.")
  (object_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TargetObj-response>) ostream)
  "Serializes a message object of type '<TargetObj-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TargetObj-response>) istream)
  "Deserializes a message object of type '<TargetObj-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TargetObj-response>)))
  "Returns string type for a service object of type '<TargetObj-response>"
  "posedetection_msgs/TargetObjResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetObj-response)))
  "Returns string type for a service object of type 'TargetObj-response"
  "posedetection_msgs/TargetObjResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TargetObj-response>)))
  "Returns md5sum for a message object of type '<TargetObj-response>"
  "ef30370054b38413dfbfa16532d6fb84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TargetObj-response)))
  "Returns md5sum for a message object of type 'TargetObj-response"
  "ef30370054b38413dfbfa16532d6fb84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TargetObj-response>)))
  "Returns full string definition for message of type '<TargetObj-response>"
  (cl:format cl:nil "posedetection_msgs/Object6DPose object_pose~%~%~%================================================================================~%MSG: posedetection_msgs/Object6DPose~%# 6D pose of object~%geometry_msgs/Pose pose~%# reliability~%float32 reliability~%~%# type of object, usually contains the filename of the object that allows the receiving side to visualize it~%# can also be used as a unique type id~%string type ~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TargetObj-response)))
  "Returns full string definition for message of type 'TargetObj-response"
  (cl:format cl:nil "posedetection_msgs/Object6DPose object_pose~%~%~%================================================================================~%MSG: posedetection_msgs/Object6DPose~%# 6D pose of object~%geometry_msgs/Pose pose~%# reliability~%float32 reliability~%~%# type of object, usually contains the filename of the object that allows the receiving side to visualize it~%# can also be used as a unique type id~%string type ~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TargetObj-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TargetObj-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TargetObj-response
    (cl:cons ':object_pose (object_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TargetObj)))
  'TargetObj-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TargetObj)))
  'TargetObj-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetObj)))
  "Returns string type for a service object of type '<TargetObj>"
  "posedetection_msgs/TargetObj")