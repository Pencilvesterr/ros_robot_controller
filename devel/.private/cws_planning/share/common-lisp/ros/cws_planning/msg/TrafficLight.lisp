; Auto-generated. Do not edit!


(cl:in-package cws_planning-msg)


;//! \htmlinclude TrafficLight.msg.html

(cl:defclass <TrafficLight> (roslisp-msg-protocol:ros-message)
  ((block_selected
    :reader block_selected
    :initarg :block_selected
    :type cl:fixnum
    :initform 0)
   (block_status
    :reader block_status
    :initarg :block_status
    :type cl:fixnum
    :initform 0)
   (zone_selected
    :reader zone_selected
    :initarg :zone_selected
    :type cl:fixnum
    :initform 0)
   (zone_status
    :reader zone_status
    :initarg :zone_status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TrafficLight (<TrafficLight>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrafficLight>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrafficLight)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cws_planning-msg:<TrafficLight> is deprecated: use cws_planning-msg:TrafficLight instead.")))

(cl:ensure-generic-function 'block_selected-val :lambda-list '(m))
(cl:defmethod block_selected-val ((m <TrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cws_planning-msg:block_selected-val is deprecated.  Use cws_planning-msg:block_selected instead.")
  (block_selected m))

(cl:ensure-generic-function 'block_status-val :lambda-list '(m))
(cl:defmethod block_status-val ((m <TrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cws_planning-msg:block_status-val is deprecated.  Use cws_planning-msg:block_status instead.")
  (block_status m))

(cl:ensure-generic-function 'zone_selected-val :lambda-list '(m))
(cl:defmethod zone_selected-val ((m <TrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cws_planning-msg:zone_selected-val is deprecated.  Use cws_planning-msg:zone_selected instead.")
  (zone_selected m))

(cl:ensure-generic-function 'zone_status-val :lambda-list '(m))
(cl:defmethod zone_status-val ((m <TrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cws_planning-msg:zone_status-val is deprecated.  Use cws_planning-msg:zone_status instead.")
  (zone_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrafficLight>) ostream)
  "Serializes a message object of type '<TrafficLight>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'block_selected)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'block_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'zone_selected)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'zone_status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrafficLight>) istream)
  "Deserializes a message object of type '<TrafficLight>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'block_selected)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'block_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'zone_selected)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'zone_status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrafficLight>)))
  "Returns string type for a message object of type '<TrafficLight>"
  "cws_planning/TrafficLight")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrafficLight)))
  "Returns string type for a message object of type 'TrafficLight"
  "cws_planning/TrafficLight")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrafficLight>)))
  "Returns md5sum for a message object of type '<TrafficLight>"
  "a0b344af9bc677669c5cc9a9babbe2c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrafficLight)))
  "Returns md5sum for a message object of type 'TrafficLight"
  "a0b344af9bc677669c5cc9a9babbe2c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrafficLight>)))
  "Returns full string definition for message of type '<TrafficLight>"
  (cl:format cl:nil "uint8 block_selected~%uint8 block_status~%uint8 zone_selected~%uint8 zone_status~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrafficLight)))
  "Returns full string definition for message of type 'TrafficLight"
  (cl:format cl:nil "uint8 block_selected~%uint8 block_status~%uint8 zone_selected~%uint8 zone_status~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrafficLight>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrafficLight>))
  "Converts a ROS message object to a list"
  (cl:list 'TrafficLight
    (cl:cons ':block_selected (block_selected msg))
    (cl:cons ':block_status (block_status msg))
    (cl:cons ':zone_selected (zone_selected msg))
    (cl:cons ':zone_status (zone_status msg))
))
