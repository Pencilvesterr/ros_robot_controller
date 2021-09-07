; Auto-generated. Do not edit!


(cl:in-package posedetection_msgs-msg)


;//! \htmlinclude Object6DPose.msg.html

(cl:defclass <Object6DPose> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (reliability
    :reader reliability
    :initarg :reliability
    :type cl:float
    :initform 0.0)
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform ""))
)

(cl:defclass Object6DPose (<Object6DPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Object6DPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Object6DPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name posedetection_msgs-msg:<Object6DPose> is deprecated: use posedetection_msgs-msg:Object6DPose instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <Object6DPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-msg:pose-val is deprecated.  Use posedetection_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'reliability-val :lambda-list '(m))
(cl:defmethod reliability-val ((m <Object6DPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-msg:reliability-val is deprecated.  Use posedetection_msgs-msg:reliability instead.")
  (reliability m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Object6DPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-msg:type-val is deprecated.  Use posedetection_msgs-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Object6DPose>) ostream)
  "Serializes a message object of type '<Object6DPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'reliability))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Object6DPose>) istream)
  "Deserializes a message object of type '<Object6DPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reliability) (roslisp-utils:decode-single-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Object6DPose>)))
  "Returns string type for a message object of type '<Object6DPose>"
  "posedetection_msgs/Object6DPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Object6DPose)))
  "Returns string type for a message object of type 'Object6DPose"
  "posedetection_msgs/Object6DPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Object6DPose>)))
  "Returns md5sum for a message object of type '<Object6DPose>"
  "68aad97d55c4f9555772eee1814bb3c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Object6DPose)))
  "Returns md5sum for a message object of type 'Object6DPose"
  "68aad97d55c4f9555772eee1814bb3c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Object6DPose>)))
  "Returns full string definition for message of type '<Object6DPose>"
  (cl:format cl:nil "# 6D pose of object~%geometry_msgs/Pose pose~%# reliability~%float32 reliability~%~%# type of object, usually contains the filename of the object that allows the receiving side to visualize it~%# can also be used as a unique type id~%string type ~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Object6DPose)))
  "Returns full string definition for message of type 'Object6DPose"
  (cl:format cl:nil "# 6D pose of object~%geometry_msgs/Pose pose~%# reliability~%float32 reliability~%~%# type of object, usually contains the filename of the object that allows the receiving side to visualize it~%# can also be used as a unique type id~%string type ~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Object6DPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
     4 (cl:length (cl:slot-value msg 'type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Object6DPose>))
  "Converts a ROS message object to a list"
  (cl:list 'Object6DPose
    (cl:cons ':pose (pose msg))
    (cl:cons ':reliability (reliability msg))
    (cl:cons ':type (type msg))
))
