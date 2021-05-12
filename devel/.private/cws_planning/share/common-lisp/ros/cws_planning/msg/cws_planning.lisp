; Auto-generated. Do not edit!


(cl:in-package cws_planning-msg)


;//! \htmlinclude cws_planning.msg.html

(cl:defclass <cws_planning> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass cws_planning (<cws_planning>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cws_planning>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cws_planning)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cws_planning-msg:<cws_planning> is deprecated: use cws_planning-msg:cws_planning instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cws_planning>) ostream)
  "Serializes a message object of type '<cws_planning>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cws_planning>) istream)
  "Deserializes a message object of type '<cws_planning>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cws_planning>)))
  "Returns string type for a message object of type '<cws_planning>"
  "cws_planning/cws_planning")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cws_planning)))
  "Returns string type for a message object of type 'cws_planning"
  "cws_planning/cws_planning")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cws_planning>)))
  "Returns md5sum for a message object of type '<cws_planning>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cws_planning)))
  "Returns md5sum for a message object of type 'cws_planning"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cws_planning>)))
  "Returns full string definition for message of type '<cws_planning>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cws_planning)))
  "Returns full string definition for message of type 'cws_planning"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cws_planning>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cws_planning>))
  "Converts a ROS message object to a list"
  (cl:list 'cws_planning
))
