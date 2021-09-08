; Auto-generated. Do not edit!


(cl:in-package hrca_decision-srv)


;//! \htmlinclude MoveBlock-request.msg.html

(cl:defclass <MoveBlock-request> (roslisp-msg-protocol:ros-message)
  ((block_number
    :reader block_number
    :initarg :block_number
    :type cl:integer
    :initform 0)
   (block_zone
    :reader block_zone
    :initarg :block_zone
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveBlock-request (<MoveBlock-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBlock-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBlock-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_decision-srv:<MoveBlock-request> is deprecated: use hrca_decision-srv:MoveBlock-request instead.")))

(cl:ensure-generic-function 'block_number-val :lambda-list '(m))
(cl:defmethod block_number-val ((m <MoveBlock-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_decision-srv:block_number-val is deprecated.  Use hrca_decision-srv:block_number instead.")
  (block_number m))

(cl:ensure-generic-function 'block_zone-val :lambda-list '(m))
(cl:defmethod block_zone-val ((m <MoveBlock-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_decision-srv:block_zone-val is deprecated.  Use hrca_decision-srv:block_zone instead.")
  (block_zone m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBlock-request>) ostream)
  "Serializes a message object of type '<MoveBlock-request>"
  (cl:let* ((signed (cl:slot-value msg 'block_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'block_zone)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBlock-request>) istream)
  "Deserializes a message object of type '<MoveBlock-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'block_number) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'block_zone) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBlock-request>)))
  "Returns string type for a service object of type '<MoveBlock-request>"
  "hrca_decision/MoveBlockRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBlock-request)))
  "Returns string type for a service object of type 'MoveBlock-request"
  "hrca_decision/MoveBlockRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBlock-request>)))
  "Returns md5sum for a message object of type '<MoveBlock-request>"
  "e344a651812b0bbffc3452f20f9ea415")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBlock-request)))
  "Returns md5sum for a message object of type 'MoveBlock-request"
  "e344a651812b0bbffc3452f20f9ea415")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBlock-request>)))
  "Returns full string definition for message of type '<MoveBlock-request>"
  (cl:format cl:nil "~%int32 block_number~%int32 block_zone~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBlock-request)))
  "Returns full string definition for message of type 'MoveBlock-request"
  (cl:format cl:nil "~%int32 block_number~%int32 block_zone~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBlock-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBlock-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBlock-request
    (cl:cons ':block_number (block_number msg))
    (cl:cons ':block_zone (block_zone msg))
))
;//! \htmlinclude MoveBlock-response.msg.html

(cl:defclass <MoveBlock-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveBlock-response (<MoveBlock-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBlock-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBlock-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrca_decision-srv:<MoveBlock-response> is deprecated: use hrca_decision-srv:MoveBlock-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveBlock-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrca_decision-srv:success-val is deprecated.  Use hrca_decision-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBlock-response>) ostream)
  "Serializes a message object of type '<MoveBlock-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBlock-response>) istream)
  "Deserializes a message object of type '<MoveBlock-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBlock-response>)))
  "Returns string type for a service object of type '<MoveBlock-response>"
  "hrca_decision/MoveBlockResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBlock-response)))
  "Returns string type for a service object of type 'MoveBlock-response"
  "hrca_decision/MoveBlockResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBlock-response>)))
  "Returns md5sum for a message object of type '<MoveBlock-response>"
  "e344a651812b0bbffc3452f20f9ea415")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBlock-response)))
  "Returns md5sum for a message object of type 'MoveBlock-response"
  "e344a651812b0bbffc3452f20f9ea415")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBlock-response>)))
  "Returns full string definition for message of type '<MoveBlock-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBlock-response)))
  "Returns full string definition for message of type 'MoveBlock-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBlock-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBlock-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBlock-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveBlock)))
  'MoveBlock-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveBlock)))
  'MoveBlock-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBlock)))
  "Returns string type for a service object of type '<MoveBlock>"
  "hrca_decision/MoveBlock")