; Auto-generated. Do not edit!


(cl:in-package speech_recognition_msgs-msg)


;//! \htmlinclude PhraseRule.msg.html

(cl:defclass <PhraseRule> (roslisp-msg-protocol:ros-message)
  ((symbol
    :reader symbol
    :initarg :symbol
    :type cl:string
    :initform "")
   (definition
    :reader definition
    :initarg :definition
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass PhraseRule (<PhraseRule>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PhraseRule>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PhraseRule)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_recognition_msgs-msg:<PhraseRule> is deprecated: use speech_recognition_msgs-msg:PhraseRule instead.")))

(cl:ensure-generic-function 'symbol-val :lambda-list '(m))
(cl:defmethod symbol-val ((m <PhraseRule>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:symbol-val is deprecated.  Use speech_recognition_msgs-msg:symbol instead.")
  (symbol m))

(cl:ensure-generic-function 'definition-val :lambda-list '(m))
(cl:defmethod definition-val ((m <PhraseRule>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:definition-val is deprecated.  Use speech_recognition_msgs-msg:definition instead.")
  (definition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PhraseRule>) ostream)
  "Serializes a message object of type '<PhraseRule>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'symbol))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'symbol))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'definition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'definition))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PhraseRule>) istream)
  "Deserializes a message object of type '<PhraseRule>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'symbol) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'symbol) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'definition) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'definition)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PhraseRule>)))
  "Returns string type for a message object of type '<PhraseRule>"
  "speech_recognition_msgs/PhraseRule")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PhraseRule)))
  "Returns string type for a message object of type 'PhraseRule"
  "speech_recognition_msgs/PhraseRule")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PhraseRule>)))
  "Returns md5sum for a message object of type '<PhraseRule>"
  "8184f0f93fdc3a6768ac26cd56040fdd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PhraseRule)))
  "Returns md5sum for a message object of type 'PhraseRule"
  "8184f0f93fdc3a6768ac26cd56040fdd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PhraseRule>)))
  "Returns full string definition for message of type '<PhraseRule>"
  (cl:format cl:nil "string symbol~%string[] definition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PhraseRule)))
  "Returns full string definition for message of type 'PhraseRule"
  (cl:format cl:nil "string symbol~%string[] definition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PhraseRule>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'symbol))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'definition) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PhraseRule>))
  "Converts a ROS message object to a list"
  (cl:list 'PhraseRule
    (cl:cons ':symbol (symbol msg))
    (cl:cons ':definition (definition msg))
))
