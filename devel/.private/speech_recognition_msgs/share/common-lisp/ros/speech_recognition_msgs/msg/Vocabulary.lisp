; Auto-generated. Do not edit!


(cl:in-package speech_recognition_msgs-msg)


;//! \htmlinclude Vocabulary.msg.html

(cl:defclass <Vocabulary> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (words
    :reader words
    :initarg :words
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (phonemes
    :reader phonemes
    :initarg :phonemes
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass Vocabulary (<Vocabulary>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Vocabulary>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Vocabulary)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_recognition_msgs-msg:<Vocabulary> is deprecated: use speech_recognition_msgs-msg:Vocabulary instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Vocabulary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:name-val is deprecated.  Use speech_recognition_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'words-val :lambda-list '(m))
(cl:defmethod words-val ((m <Vocabulary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:words-val is deprecated.  Use speech_recognition_msgs-msg:words instead.")
  (words m))

(cl:ensure-generic-function 'phonemes-val :lambda-list '(m))
(cl:defmethod phonemes-val ((m <Vocabulary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:phonemes-val is deprecated.  Use speech_recognition_msgs-msg:phonemes instead.")
  (phonemes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Vocabulary>) ostream)
  "Serializes a message object of type '<Vocabulary>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'words))))
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
   (cl:slot-value msg 'words))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'phonemes))))
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
   (cl:slot-value msg 'phonemes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Vocabulary>) istream)
  "Deserializes a message object of type '<Vocabulary>"
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
  (cl:setf (cl:slot-value msg 'words) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'words)))
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
  (cl:setf (cl:slot-value msg 'phonemes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'phonemes)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Vocabulary>)))
  "Returns string type for a message object of type '<Vocabulary>"
  "speech_recognition_msgs/Vocabulary")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Vocabulary)))
  "Returns string type for a message object of type 'Vocabulary"
  "speech_recognition_msgs/Vocabulary")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Vocabulary>)))
  "Returns md5sum for a message object of type '<Vocabulary>"
  "20a1ff9e31d8f4dc29f230a64ed707d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Vocabulary)))
  "Returns md5sum for a message object of type 'Vocabulary"
  "20a1ff9e31d8f4dc29f230a64ed707d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Vocabulary>)))
  "Returns full string definition for message of type '<Vocabulary>"
  (cl:format cl:nil "string name  # register vocabulary with the name.~%string[] words~%string[] phonemes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Vocabulary)))
  "Returns full string definition for message of type 'Vocabulary"
  (cl:format cl:nil "string name  # register vocabulary with the name.~%string[] words~%string[] phonemes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Vocabulary>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'words) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'phonemes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Vocabulary>))
  "Converts a ROS message object to a list"
  (cl:list 'Vocabulary
    (cl:cons ':name (name msg))
    (cl:cons ':words (words msg))
    (cl:cons ':phonemes (phonemes msg))
))
