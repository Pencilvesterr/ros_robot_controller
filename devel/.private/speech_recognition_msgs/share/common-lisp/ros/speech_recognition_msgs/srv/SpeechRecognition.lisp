; Auto-generated. Do not edit!


(cl:in-package speech_recognition_msgs-srv)


;//! \htmlinclude SpeechRecognition-request.msg.html

(cl:defclass <SpeechRecognition-request> (roslisp-msg-protocol:ros-message)
  ((vocabulary
    :reader vocabulary
    :initarg :vocabulary
    :type speech_recognition_msgs-msg:Vocabulary
    :initform (cl:make-instance 'speech_recognition_msgs-msg:Vocabulary))
   (grammar
    :reader grammar
    :initarg :grammar
    :type speech_recognition_msgs-msg:Grammar
    :initform (cl:make-instance 'speech_recognition_msgs-msg:Grammar))
   (grammar_name
    :reader grammar_name
    :initarg :grammar_name
    :type cl:string
    :initform "")
   (duration
    :reader duration
    :initarg :duration
    :type cl:float
    :initform 0.0)
   (quiet
    :reader quiet
    :initarg :quiet
    :type cl:boolean
    :initform cl:nil)
   (threshold
    :reader threshold
    :initarg :threshold
    :type cl:float
    :initform 0.0))
)

(cl:defclass SpeechRecognition-request (<SpeechRecognition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpeechRecognition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpeechRecognition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_recognition_msgs-srv:<SpeechRecognition-request> is deprecated: use speech_recognition_msgs-srv:SpeechRecognition-request instead.")))

(cl:ensure-generic-function 'vocabulary-val :lambda-list '(m))
(cl:defmethod vocabulary-val ((m <SpeechRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:vocabulary-val is deprecated.  Use speech_recognition_msgs-srv:vocabulary instead.")
  (vocabulary m))

(cl:ensure-generic-function 'grammar-val :lambda-list '(m))
(cl:defmethod grammar-val ((m <SpeechRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:grammar-val is deprecated.  Use speech_recognition_msgs-srv:grammar instead.")
  (grammar m))

(cl:ensure-generic-function 'grammar_name-val :lambda-list '(m))
(cl:defmethod grammar_name-val ((m <SpeechRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:grammar_name-val is deprecated.  Use speech_recognition_msgs-srv:grammar_name instead.")
  (grammar_name m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <SpeechRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:duration-val is deprecated.  Use speech_recognition_msgs-srv:duration instead.")
  (duration m))

(cl:ensure-generic-function 'quiet-val :lambda-list '(m))
(cl:defmethod quiet-val ((m <SpeechRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:quiet-val is deprecated.  Use speech_recognition_msgs-srv:quiet instead.")
  (quiet m))

(cl:ensure-generic-function 'threshold-val :lambda-list '(m))
(cl:defmethod threshold-val ((m <SpeechRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:threshold-val is deprecated.  Use speech_recognition_msgs-srv:threshold instead.")
  (threshold m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpeechRecognition-request>) ostream)
  "Serializes a message object of type '<SpeechRecognition-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vocabulary) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grammar) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'grammar_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'grammar_name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'quiet) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpeechRecognition-request>) istream)
  "Deserializes a message object of type '<SpeechRecognition-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vocabulary) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grammar) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grammar_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'grammar_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'quiet) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'threshold) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpeechRecognition-request>)))
  "Returns string type for a service object of type '<SpeechRecognition-request>"
  "speech_recognition_msgs/SpeechRecognitionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpeechRecognition-request)))
  "Returns string type for a service object of type 'SpeechRecognition-request"
  "speech_recognition_msgs/SpeechRecognitionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpeechRecognition-request>)))
  "Returns md5sum for a message object of type '<SpeechRecognition-request>"
  "fa1c2822647ba139ac562b2fdc05f1fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpeechRecognition-request)))
  "Returns md5sum for a message object of type 'SpeechRecognition-request"
  "fa1c2822647ba139ac562b2fdc05f1fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpeechRecognition-request>)))
  "Returns full string definition for message of type '<SpeechRecognition-request>"
  (cl:format cl:nil "Vocabulary vocabulary  #  Specify isolated words candidates to be recognized (Enabled on isolated word mode)~%Grammar grammar        #  Or, specify grammar to be recognized~%string grammar_name    #  Or, simply specify grammar name which is already registered on the server~%~%float32 duration~%bool quiet~%float32 threshold~%~%================================================================================~%MSG: speech_recognition_msgs/Vocabulary~%string name  # register vocabulary with the name.~%string[] words~%string[] phonemes~%~%================================================================================~%MSG: speech_recognition_msgs/Grammar~%string name  # register this grammar with the name~%PhraseRule[] rules~%~%string[] categories~%Vocabulary[] vocabularies~%~%================================================================================~%MSG: speech_recognition_msgs/PhraseRule~%string symbol~%string[] definition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpeechRecognition-request)))
  "Returns full string definition for message of type 'SpeechRecognition-request"
  (cl:format cl:nil "Vocabulary vocabulary  #  Specify isolated words candidates to be recognized (Enabled on isolated word mode)~%Grammar grammar        #  Or, specify grammar to be recognized~%string grammar_name    #  Or, simply specify grammar name which is already registered on the server~%~%float32 duration~%bool quiet~%float32 threshold~%~%================================================================================~%MSG: speech_recognition_msgs/Vocabulary~%string name  # register vocabulary with the name.~%string[] words~%string[] phonemes~%~%================================================================================~%MSG: speech_recognition_msgs/Grammar~%string name  # register this grammar with the name~%PhraseRule[] rules~%~%string[] categories~%Vocabulary[] vocabularies~%~%================================================================================~%MSG: speech_recognition_msgs/PhraseRule~%string symbol~%string[] definition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpeechRecognition-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vocabulary))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grammar))
     4 (cl:length (cl:slot-value msg 'grammar_name))
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpeechRecognition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SpeechRecognition-request
    (cl:cons ':vocabulary (vocabulary msg))
    (cl:cons ':grammar (grammar msg))
    (cl:cons ':grammar_name (grammar_name msg))
    (cl:cons ':duration (duration msg))
    (cl:cons ':quiet (quiet msg))
    (cl:cons ':threshold (threshold msg))
))
;//! \htmlinclude SpeechRecognition-response.msg.html

(cl:defclass <SpeechRecognition-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type speech_recognition_msgs-msg:SpeechRecognitionCandidates
    :initform (cl:make-instance 'speech_recognition_msgs-msg:SpeechRecognitionCandidates)))
)

(cl:defclass SpeechRecognition-response (<SpeechRecognition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpeechRecognition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpeechRecognition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_recognition_msgs-srv:<SpeechRecognition-response> is deprecated: use speech_recognition_msgs-srv:SpeechRecognition-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SpeechRecognition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_recognition_msgs-srv:result-val is deprecated.  Use speech_recognition_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpeechRecognition-response>) ostream)
  "Serializes a message object of type '<SpeechRecognition-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpeechRecognition-response>) istream)
  "Deserializes a message object of type '<SpeechRecognition-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpeechRecognition-response>)))
  "Returns string type for a service object of type '<SpeechRecognition-response>"
  "speech_recognition_msgs/SpeechRecognitionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpeechRecognition-response)))
  "Returns string type for a service object of type 'SpeechRecognition-response"
  "speech_recognition_msgs/SpeechRecognitionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpeechRecognition-response>)))
  "Returns md5sum for a message object of type '<SpeechRecognition-response>"
  "fa1c2822647ba139ac562b2fdc05f1fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpeechRecognition-response)))
  "Returns md5sum for a message object of type 'SpeechRecognition-response"
  "fa1c2822647ba139ac562b2fdc05f1fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpeechRecognition-response>)))
  "Returns full string definition for message of type '<SpeechRecognition-response>"
  (cl:format cl:nil "speech_recognition_msgs/SpeechRecognitionCandidates result~%~%~%================================================================================~%MSG: speech_recognition_msgs/SpeechRecognitionCandidates~%string[] transcript   # candidate words of speech-to-text API~%float32[] confidence  # confidence of transcript~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpeechRecognition-response)))
  "Returns full string definition for message of type 'SpeechRecognition-response"
  (cl:format cl:nil "speech_recognition_msgs/SpeechRecognitionCandidates result~%~%~%================================================================================~%MSG: speech_recognition_msgs/SpeechRecognitionCandidates~%string[] transcript   # candidate words of speech-to-text API~%float32[] confidence  # confidence of transcript~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpeechRecognition-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpeechRecognition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SpeechRecognition-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SpeechRecognition)))
  'SpeechRecognition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SpeechRecognition)))
  'SpeechRecognition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpeechRecognition)))
  "Returns string type for a service object of type '<SpeechRecognition>"
  "speech_recognition_msgs/SpeechRecognition")