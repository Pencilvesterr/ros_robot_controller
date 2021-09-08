; Auto-generated. Do not edit!


(cl:in-package hrca_decision-msg)


;//! \htmlinclude cws_planning.msg.html

(cl:defclass <cws_planning> (roslisp-msg-protocol:ros-message)
  ((hello
    :reader hello
    :initarg :hello
    :type cl:integer
    :initform 0))
)

(cl:defclass cws_planning (<cws_planning>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cws_planning>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cws_planning)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_decision-msg:<cws_planning> is deprecated: use hrca_decision-msg:cws_planning instead.")))

(cl:ensure-generic-function 'hello-val :lambda-list '(m))
(cl:defmethod hello-val ((m <cws_planning>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_decision-msg:hello-val is deprecated.  Use hrca_decision-msg:hello instead.")
  (hello m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cws_planning>) ostream)
  "Serializes a message object of type '<cws_planning>"
  (cl:let* ((signed (cl:slot-value msg 'hello)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cws_planning>) istream)
  "Deserializes a message object of type '<cws_planning>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hello) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cws_planning>)))
  "Returns string type for a message object of type '<cws_planning>"
  "hrca_decision/cws_planning")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cws_planning)))
  "Returns string type for a message object of type 'cws_planning"
  "hrca_decision/cws_planning")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cws_planning>)))
  "Returns md5sum for a message object of type '<cws_planning>"
  "9d9ca1866b512db488ffb6bed585ed1b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cws_planning)))
  "Returns md5sum for a message object of type 'cws_planning"
  "9d9ca1866b512db488ffb6bed585ed1b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cws_planning>)))
  "Returns full string definition for message of type '<cws_planning>"
  (cl:format cl:nil "# This is needed just to make rosbridge happy, else it wont find TrafficLight.msg (idk why???)~%int32 hello~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cws_planning)))
  "Returns full string definition for message of type 'cws_planning"
  (cl:format cl:nil "# This is needed just to make rosbridge happy, else it wont find TrafficLight.msg (idk why???)~%int32 hello~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cws_planning>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cws_planning>))
  "Converts a ROS message object to a list"
  (cl:list 'cws_planning
    (cl:cons ':hello (hello msg))
))
