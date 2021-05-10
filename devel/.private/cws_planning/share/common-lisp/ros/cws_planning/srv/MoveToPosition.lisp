; Auto-generated. Do not edit!


(cl:in-package cws_planning-srv)


;//! \htmlinclude MoveToPosition-request.msg.html

(cl:defclass <MoveToPosition-request> (roslisp-msg-protocol:ros-message)
  ((position_number
    :reader position_number
    :initarg :position_number
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveToPosition-request (<MoveToPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cws_planning-srv:<MoveToPosition-request> is deprecated: use cws_planning-srv:MoveToPosition-request instead.")))

(cl:ensure-generic-function 'position_number-val :lambda-list '(m))
(cl:defmethod position_number-val ((m <MoveToPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cws_planning-srv:position_number-val is deprecated.  Use cws_planning-srv:position_number instead.")
  (position_number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToPosition-request>) ostream)
  "Serializes a message object of type '<MoveToPosition-request>"
  (cl:let* ((signed (cl:slot-value msg 'position_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToPosition-request>) istream)
  "Deserializes a message object of type '<MoveToPosition-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position_number) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToPosition-request>)))
  "Returns string type for a service object of type '<MoveToPosition-request>"
  "cws_planning/MoveToPositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToPosition-request)))
  "Returns string type for a service object of type 'MoveToPosition-request"
  "cws_planning/MoveToPositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToPosition-request>)))
  "Returns md5sum for a message object of type '<MoveToPosition-request>"
  "40aca93d2ba3835d16d6b0bb93925874")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToPosition-request)))
  "Returns md5sum for a message object of type 'MoveToPosition-request"
  "40aca93d2ba3835d16d6b0bb93925874")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToPosition-request>)))
  "Returns full string definition for message of type '<MoveToPosition-request>"
  (cl:format cl:nil "~%int32 position_number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToPosition-request)))
  "Returns full string definition for message of type 'MoveToPosition-request"
  (cl:format cl:nil "~%int32 position_number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToPosition-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToPosition-request
    (cl:cons ':position_number (position_number msg))
))
;//! \htmlinclude MoveToPosition-response.msg.html

(cl:defclass <MoveToPosition-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveToPosition-response (<MoveToPosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToPosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToPosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cws_planning-srv:<MoveToPosition-response> is deprecated: use cws_planning-srv:MoveToPosition-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveToPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cws_planning-srv:success-val is deprecated.  Use cws_planning-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToPosition-response>) ostream)
  "Serializes a message object of type '<MoveToPosition-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToPosition-response>) istream)
  "Deserializes a message object of type '<MoveToPosition-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToPosition-response>)))
  "Returns string type for a service object of type '<MoveToPosition-response>"
  "cws_planning/MoveToPositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToPosition-response)))
  "Returns string type for a service object of type 'MoveToPosition-response"
  "cws_planning/MoveToPositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToPosition-response>)))
  "Returns md5sum for a message object of type '<MoveToPosition-response>"
  "40aca93d2ba3835d16d6b0bb93925874")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToPosition-response)))
  "Returns md5sum for a message object of type 'MoveToPosition-response"
  "40aca93d2ba3835d16d6b0bb93925874")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToPosition-response>)))
  "Returns full string definition for message of type '<MoveToPosition-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToPosition-response)))
  "Returns full string definition for message of type 'MoveToPosition-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToPosition-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToPosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToPosition-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveToPosition)))
  'MoveToPosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveToPosition)))
  'MoveToPosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToPosition)))
  "Returns string type for a service object of type '<MoveToPosition>"
  "cws_planning/MoveToPosition")