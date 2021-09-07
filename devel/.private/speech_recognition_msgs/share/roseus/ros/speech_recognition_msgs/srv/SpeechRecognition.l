;; Auto-generated. Do not edit!


(when (boundp 'speech_recognition_msgs::SpeechRecognition)
  (if (not (find-package "SPEECH_RECOGNITION_MSGS"))
    (make-package "SPEECH_RECOGNITION_MSGS"))
  (shadow 'SpeechRecognition (find-package "SPEECH_RECOGNITION_MSGS")))
(unless (find-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITION")
  (make-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITION"))
(unless (find-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITIONREQUEST")
  (make-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITIONREQUEST"))
(unless (find-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITIONRESPONSE")
  (make-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITIONRESPONSE"))

(in-package "ROS")





(defclass speech_recognition_msgs::SpeechRecognitionRequest
  :super ros::object
  :slots (_vocabulary _grammar _grammar_name _duration _quiet _threshold ))

(defmethod speech_recognition_msgs::SpeechRecognitionRequest
  (:init
   (&key
    ((:vocabulary __vocabulary) (instance speech_recognition_msgs::Vocabulary :init))
    ((:grammar __grammar) (instance speech_recognition_msgs::Grammar :init))
    ((:grammar_name __grammar_name) "")
    ((:duration __duration) 0.0)
    ((:quiet __quiet) nil)
    ((:threshold __threshold) 0.0)
    )
   (send-super :init)
   (setq _vocabulary __vocabulary)
   (setq _grammar __grammar)
   (setq _grammar_name (string __grammar_name))
   (setq _duration (float __duration))
   (setq _quiet __quiet)
   (setq _threshold (float __threshold))
   self)
  (:vocabulary
   (&rest __vocabulary)
   (if (keywordp (car __vocabulary))
       (send* _vocabulary __vocabulary)
     (progn
       (if __vocabulary (setq _vocabulary (car __vocabulary)))
       _vocabulary)))
  (:grammar
   (&rest __grammar)
   (if (keywordp (car __grammar))
       (send* _grammar __grammar)
     (progn
       (if __grammar (setq _grammar (car __grammar)))
       _grammar)))
  (:grammar_name
   (&optional __grammar_name)
   (if __grammar_name (setq _grammar_name __grammar_name)) _grammar_name)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:quiet
   (&optional __quiet)
   (if __quiet (setq _quiet __quiet)) _quiet)
  (:threshold
   (&optional __threshold)
   (if __threshold (setq _threshold __threshold)) _threshold)
  (:serialization-length
   ()
   (+
    ;; speech_recognition_msgs/Vocabulary _vocabulary
    (send _vocabulary :serialization-length)
    ;; speech_recognition_msgs/Grammar _grammar
    (send _grammar :serialization-length)
    ;; string _grammar_name
    4 (length _grammar_name)
    ;; float32 _duration
    4
    ;; bool _quiet
    1
    ;; float32 _threshold
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; speech_recognition_msgs/Vocabulary _vocabulary
       (send _vocabulary :serialize s)
     ;; speech_recognition_msgs/Grammar _grammar
       (send _grammar :serialize s)
     ;; string _grammar_name
       (write-long (length _grammar_name) s) (princ _grammar_name s)
     ;; float32 _duration
       (sys::poke _duration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _quiet
       (if _quiet (write-byte -1 s) (write-byte 0 s))
     ;; float32 _threshold
       (sys::poke _threshold (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; speech_recognition_msgs/Vocabulary _vocabulary
     (send _vocabulary :deserialize buf ptr-) (incf ptr- (send _vocabulary :serialization-length))
   ;; speech_recognition_msgs/Grammar _grammar
     (send _grammar :deserialize buf ptr-) (incf ptr- (send _grammar :serialization-length))
   ;; string _grammar_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _grammar_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _duration
     (setq _duration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _quiet
     (setq _quiet (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _threshold
     (setq _threshold (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass speech_recognition_msgs::SpeechRecognitionResponse
  :super ros::object
  :slots (_result ))

(defmethod speech_recognition_msgs::SpeechRecognitionResponse
  (:init
   (&key
    ((:result __result) (instance speech_recognition_msgs::SpeechRecognitionCandidates :init))
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&rest __result)
   (if (keywordp (car __result))
       (send* _result __result)
     (progn
       (if __result (setq _result (car __result)))
       _result)))
  (:serialization-length
   ()
   (+
    ;; speech_recognition_msgs/SpeechRecognitionCandidates _result
    (send _result :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; speech_recognition_msgs/SpeechRecognitionCandidates _result
       (send _result :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; speech_recognition_msgs/SpeechRecognitionCandidates _result
     (send _result :deserialize buf ptr-) (incf ptr- (send _result :serialization-length))
   ;;
   self)
  )

(defclass speech_recognition_msgs::SpeechRecognition
  :super ros::object
  :slots ())

(setf (get speech_recognition_msgs::SpeechRecognition :md5sum-) "fa1c2822647ba139ac562b2fdc05f1fb")
(setf (get speech_recognition_msgs::SpeechRecognition :datatype-) "speech_recognition_msgs/SpeechRecognition")
(setf (get speech_recognition_msgs::SpeechRecognition :request) speech_recognition_msgs::SpeechRecognitionRequest)
(setf (get speech_recognition_msgs::SpeechRecognition :response) speech_recognition_msgs::SpeechRecognitionResponse)

(defmethod speech_recognition_msgs::SpeechRecognitionRequest
  (:response () (instance speech_recognition_msgs::SpeechRecognitionResponse :init)))

(setf (get speech_recognition_msgs::SpeechRecognitionRequest :md5sum-) "fa1c2822647ba139ac562b2fdc05f1fb")
(setf (get speech_recognition_msgs::SpeechRecognitionRequest :datatype-) "speech_recognition_msgs/SpeechRecognitionRequest")
(setf (get speech_recognition_msgs::SpeechRecognitionRequest :definition-)
      "Vocabulary vocabulary  #  Specify isolated words candidates to be recognized (Enabled on isolated word mode)
Grammar grammar        #  Or, specify grammar to be recognized
string grammar_name    #  Or, simply specify grammar name which is already registered on the server

float32 duration
bool quiet
float32 threshold

================================================================================
MSG: speech_recognition_msgs/Vocabulary
string name  # register vocabulary with the name.
string[] words
string[] phonemes

================================================================================
MSG: speech_recognition_msgs/Grammar
string name  # register this grammar with the name
PhraseRule[] rules

string[] categories
Vocabulary[] vocabularies

================================================================================
MSG: speech_recognition_msgs/PhraseRule
string symbol
string[] definition
---
speech_recognition_msgs/SpeechRecognitionCandidates result


================================================================================
MSG: speech_recognition_msgs/SpeechRecognitionCandidates
string[] transcript   # candidate words of speech-to-text API
")

(setf (get speech_recognition_msgs::SpeechRecognitionResponse :md5sum-) "fa1c2822647ba139ac562b2fdc05f1fb")
(setf (get speech_recognition_msgs::SpeechRecognitionResponse :datatype-) "speech_recognition_msgs/SpeechRecognitionResponse")
(setf (get speech_recognition_msgs::SpeechRecognitionResponse :definition-)
      "Vocabulary vocabulary  #  Specify isolated words candidates to be recognized (Enabled on isolated word mode)
Grammar grammar        #  Or, specify grammar to be recognized
string grammar_name    #  Or, simply specify grammar name which is already registered on the server

float32 duration
bool quiet
float32 threshold

================================================================================
MSG: speech_recognition_msgs/Vocabulary
string name  # register vocabulary with the name.
string[] words
string[] phonemes

================================================================================
MSG: speech_recognition_msgs/Grammar
string name  # register this grammar with the name
PhraseRule[] rules

string[] categories
Vocabulary[] vocabularies

================================================================================
MSG: speech_recognition_msgs/PhraseRule
string symbol
string[] definition
---
speech_recognition_msgs/SpeechRecognitionCandidates result


================================================================================
MSG: speech_recognition_msgs/SpeechRecognitionCandidates
string[] transcript   # candidate words of speech-to-text API
")



(provide :speech_recognition_msgs/SpeechRecognition "fa1c2822647ba139ac562b2fdc05f1fb")


