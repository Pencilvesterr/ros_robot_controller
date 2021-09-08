; Auto-generated. Do not edit!


(cl:in-package hrca_decision-srv)


;//! \htmlinclude ResetRobot-request.msg.html

(cl:defclass <ResetRobot-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetRobot-request (<ResetRobot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetRobot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetRobot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_decision-srv:<ResetRobot-request> is deprecated: use hrca_decision-srv:ResetRobot-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetRobot-request>) ostream)
  "Serializes a message object of type '<ResetRobot-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetRobot-request>) istream)
  "Deserializes a message object of type '<ResetRobot-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetRobot-request>)))
  "Returns string type for a service object of type '<ResetRobot-request>"
  "hrca_decision/ResetRobotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetRobot-request)))
  "Returns string type for a service object of type 'ResetRobot-request"
  "hrca_decision/ResetRobotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetRobot-request>)))
  "Returns md5sum for a message object of type '<ResetRobot-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetRobot-request)))
  "Returns md5sum for a message object of type 'ResetRobot-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetRobot-request>)))
  "Returns full string definition for message of type '<ResetRobot-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetRobot-request)))
  "Returns full string definition for message of type 'ResetRobot-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetRobot-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetRobot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetRobot-request
))
;//! \htmlinclude ResetRobot-response.msg.html

(cl:defclass <ResetRobot-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ResetRobot-response (<ResetRobot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetRobot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetRobot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_decision-srv:<ResetRobot-response> is deprecated: use hrca_decision-srv:ResetRobot-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ResetRobot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_decision-srv:success-val is deprecated.  Use hrca_decision-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetRobot-response>) ostream)
  "Serializes a message object of type '<ResetRobot-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetRobot-response>) istream)
  "Deserializes a message object of type '<ResetRobot-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetRobot-response>)))
  "Returns string type for a service object of type '<ResetRobot-response>"
  "hrca_decision/ResetRobotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetRobot-response)))
  "Returns string type for a service object of type 'ResetRobot-response"
  "hrca_decision/ResetRobotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetRobot-response>)))
  "Returns md5sum for a message object of type '<ResetRobot-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetRobot-response)))
  "Returns md5sum for a message object of type 'ResetRobot-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetRobot-response>)))
  "Returns full string definition for message of type '<ResetRobot-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetRobot-response)))
  "Returns full string definition for message of type 'ResetRobot-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetRobot-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetRobot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetRobot-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetRobot)))
  'ResetRobot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetRobot)))
  'ResetRobot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetRobot)))
  "Returns string type for a service object of type '<ResetRobot>"
  "hrca_decision/ResetRobot")