; Auto-generated. Do not edit!


(cl:in-package posedetection_msgs-msg)


;//! \htmlinclude Curve1D.msg.html

(cl:defclass <Curve1D> (roslisp-msg-protocol:ros-message)
  ((pts
    :reader pts
    :initarg :pts
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Curve1D (<Curve1D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Curve1D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Curve1D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name posedetection_msgs-msg:<Curve1D> is deprecated: use posedetection_msgs-msg:Curve1D instead.")))

(cl:ensure-generic-function 'pts-val :lambda-list '(m))
(cl:defmethod pts-val ((m <Curve1D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-msg:pts-val is deprecated.  Use posedetection_msgs-msg:pts instead.")
  (pts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Curve1D>) ostream)
  "Serializes a message object of type '<Curve1D>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Curve1D>) istream)
  "Deserializes a message object of type '<Curve1D>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Curve1D>)))
  "Returns string type for a message object of type '<Curve1D>"
  "posedetection_msgs/Curve1D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Curve1D)))
  "Returns string type for a message object of type 'Curve1D"
  "posedetection_msgs/Curve1D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Curve1D>)))
  "Returns md5sum for a message object of type '<Curve1D>"
  "e5367ca89dc9a58670f8f288e2c52f5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Curve1D)))
  "Returns md5sum for a message object of type 'Curve1D"
  "e5367ca89dc9a58670f8f288e2c52f5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Curve1D>)))
  "Returns full string definition for message of type '<Curve1D>"
  (cl:format cl:nil "float32[] pts # 2xN points in the image~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Curve1D)))
  "Returns full string definition for message of type 'Curve1D"
  (cl:format cl:nil "float32[] pts # 2xN points in the image~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Curve1D>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Curve1D>))
  "Converts a ROS message object to a list"
  (cl:list 'Curve1D
    (cl:cons ':pts (pts msg))
))
