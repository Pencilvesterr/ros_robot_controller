; Auto-generated. Do not edit!


(cl:in-package speech_recognition_msgs-msg)


;//! \htmlinclude SpeechRecognitionCandidates.msg.html

(cl:defclass <SpeechRecognitionCandidates> (roslisp-msg-protocol:ros-message)
  ((transcript
    :reader transcript
    :initarg :transcript
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (confidence
    :reader confidence
    :initarg :confidence
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SpeechRecognitionCandidates (<SpeechRecognitionCandidates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpeechRecognitionCandidates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpeechRecognitionCandidates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_recognition_msgs-msg:<SpeechRecognitionCandidates> is deprecated: use speech_recognition_msgs-msg:SpeechRecognitionCandidates instead.")))

(cl:ensure-generic-function 'transcript-val :lambda-list '(m))
(cl:defmethod transcript-val ((m <SpeechRecognitionCandidates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:transcript-val is deprecated.  Use speech_recognition_msgs-msg:transcript instead.")
  (transcript m))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <SpeechRecognitionCandidates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-msg:confidence-val is deprecated.  Use speech_recognition_msgs-msg:confidence instead.")
  (confidence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpeechRecognitionCandidates>) ostream)
  "Serializes a message object of type '<SpeechRecognitionCandidates>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'transcript))))
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
   (cl:slot-value msg 'transcript))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'confidence))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpeechRecognitionCandidates>) istream)
  "Deserializes a message object of type '<SpeechRecognitionCandidates>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'transcript) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'transcript)))
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
  (cl:setf (cl:slot-value msg 'confidence) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'confidence)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpeechRecognitionCandidates>)))
  "Returns string type for a message object of type '<SpeechRecognitionCandidates>"
  "speech_recognition_msgs/SpeechRecognitionCandidates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpeechRecognitionCandidates)))
  "Returns string type for a message object of type 'SpeechRecognitionCandidates"
  "speech_recognition_msgs/SpeechRecognitionCandidates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpeechRecognitionCandidates>)))
  "Returns md5sum for a message object of type '<SpeechRecognitionCandidates>"
  "8bf91ae2b1d4cbc38dce17013599f915")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpeechRecognitionCandidates)))
  "Returns md5sum for a message object of type 'SpeechRecognitionCandidates"
  "8bf91ae2b1d4cbc38dce17013599f915")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpeechRecognitionCandidates>)))
  "Returns full string definition for message of type '<SpeechRecognitionCandidates>"
  (cl:format cl:nil "string[] transcript   # candidate words of speech-to-text API~%float32[] confidence  # confidence of transcript~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpeechRecognitionCandidates)))
  "Returns full string definition for message of type 'SpeechRecognitionCandidates"
  (cl:format cl:nil "string[] transcript   # candidate words of speech-to-text API~%float32[] confidence  # confidence of transcript~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpeechRecognitionCandidates>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'transcript) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'confidence) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpeechRecognitionCandidates>))
  "Converts a ROS message object to a list"
  (cl:list 'SpeechRecognitionCandidates
    (cl:cons ':transcript (transcript msg))
    (cl:cons ':confidence (confidence msg))
))
