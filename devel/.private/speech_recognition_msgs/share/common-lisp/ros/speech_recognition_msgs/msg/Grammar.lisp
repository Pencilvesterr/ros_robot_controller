; Auto-generated. Do not edit!


(cl:in-package speech_recognition_msgs-msg)


;//! \htmlinclude Grammar.msg.html

(cl:defclass <Grammar> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (rules
    :reader rules
    :initarg :rules
    :type (cl:vector speech_recognition_msgs-msg:PhraseRule)
   :initform (cl:make-array 0 :element-type 'speech_recognition_msgs-msg:PhraseRule :initial-element (cl:make-instance 'speech_recognition_msgs-msg:PhraseRule)))
   (categories
    :reader categories
    :initarg :categories
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (vocabularies
    :reader vocabularies
    :initarg :vocabularies
    :type (cl:vector speech_recognition_msgs-msg:Vocabulary)
   :initform (cl:make-array 0 :element-type 'speech_recognition_msgs-msg:Vocabulary :initial-element (cl:make-instance 'speech_recognition_msgs-msg:Vocabulary))))
)

(cl:defclass Grammar (<Grammar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Grammar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Grammar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_recognition_msgs-msg:<Grammar> is deprecated: use speech_recognition_msgs-msg:Grammar instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Grammar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:name-val is deprecated.  Use speech_recognition_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'rules-val :lambda-list '(m))
(cl:defmethod rules-val ((m <Grammar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:rules-val is deprecated.  Use speech_recognition_msgs-msg:rules instead.")
  (rules m))

(cl:ensure-generic-function 'categories-val :lambda-list '(m))
(cl:defmethod categories-val ((m <Grammar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:categories-val is deprecated.  Use speech_recognition_msgs-msg:categories instead.")
  (categories m))

(cl:ensure-generic-function 'vocabularies-val :lambda-list '(m))
(cl:defmethod vocabularies-val ((m <Grammar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:vocabularies-val is deprecated.  Use speech_recognition_msgs-msg:vocabularies instead.")
  (vocabularies m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Grammar>) ostream)
  "Serializes a message object of type '<Grammar>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rules))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rules))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'categories))))
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
   (cl:slot-value msg 'categories))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vocabularies))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vocabularies))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Grammar>) istream)
  "Deserializes a message object of type '<Grammar>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rules) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rules)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'speech_recognition_msgs-msg:PhraseRule))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'categories) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'categories)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vocabularies) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vocabularies)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'speech_recognition_msgs-msg:Vocabulary))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Grammar>)))
  "Returns string type for a message object of type '<Grammar>"
  "speech_recognition_msgs/Grammar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grammar)))
  "Returns string type for a message object of type 'Grammar"
  "speech_recognition_msgs/Grammar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Grammar>)))
  "Returns md5sum for a message object of type '<Grammar>"
  "a8653cae3429492cb944a813429e7151")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Grammar)))
  "Returns md5sum for a message object of type 'Grammar"
  "a8653cae3429492cb944a813429e7151")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Grammar>)))
  "Returns full string definition for message of type '<Grammar>"
  (cl:format cl:nil "string name  # register this grammar with the name~%PhraseRule[] rules~%~%string[] categories~%Vocabulary[] vocabularies~%~%================================================================================~%MSG: speech_recognition_msgs/PhraseRule~%string symbol~%string[] definition~%~%================================================================================~%MSG: speech_recognition_msgs/Vocabulary~%string name  # register vocabulary with the name.~%string[] words~%string[] phonemes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Grammar)))
  "Returns full string definition for message of type 'Grammar"
  (cl:format cl:nil "string name  # register this grammar with the name~%PhraseRule[] rules~%~%string[] categories~%Vocabulary[] vocabularies~%~%================================================================================~%MSG: speech_recognition_msgs/PhraseRule~%string symbol~%string[] definition~%~%================================================================================~%MSG: speech_recognition_msgs/Vocabulary~%string name  # register vocabulary with the name.~%string[] words~%string[] phonemes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Grammar>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rules) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'categories) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vocabularies) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Grammar>))
  "Converts a ROS message object to a list"
  (cl:list 'Grammar
    (cl:cons ':name (name msg))
    (cl:cons ':rules (rules msg))
    (cl:cons ':categories (categories msg))
    (cl:cons ':vocabularies (vocabularies msg))
))
