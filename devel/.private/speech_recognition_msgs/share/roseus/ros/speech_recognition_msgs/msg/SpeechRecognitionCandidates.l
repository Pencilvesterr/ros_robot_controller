;; Auto-generated. Do not edit!


(when (boundp 'speech_recognition_msgs::SpeechRecognitionCandidates)
  (if (not (find-package "SPEECH_RECOGNITION_MSGS"))
    (make-package "SPEECH_RECOGNITION_MSGS"))
  (shadow 'SpeechRecognitionCandidates (find-package "SPEECH_RECOGNITION_MSGS")))
(unless (find-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITIONCANDIDATES")
  (make-package "SPEECH_RECOGNITION_MSGS::SPEECHRECOGNITIONCANDIDATES"))

(in-package "ROS")
;;//! \htmlinclude SpeechRecognitionCandidates.msg.html


(defclass speech_recognition_msgs::SpeechRecognitionCandidates
  :super ros::object
  :slots (_transcript _confidence ))

(defmethod speech_recognition_msgs::SpeechRecognitionCandidates
  (:init
   (&key
    ((:transcript __transcript) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:confidence __confidence) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _transcript __transcript)
   (setq _confidence __confidence)
   self)
  (:transcript
   (&optional __transcript)
   (if __transcript (setq _transcript __transcript)) _transcript)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; string[] _transcript
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _transcript)) 4
    ;; float32[] _confidence
    (* 4    (length _confidence)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _transcript
     (write-long (length _transcript) s)
     (dolist (elem _transcript)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float32[] _confidence
     (write-long (length _confidence) s)
     (dotimes (i (length _confidence))
       (sys::poke (elt _confidence i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _transcript
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _transcript (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _transcript i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float32[] _confidence
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidence (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidence i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get speech_recognition_msgs::SpeechRecognitionCandidates :md5sum-) "8bf91ae2b1d4cbc38dce17013599f915")
(setf (get speech_recognition_msgs::SpeechRecognitionCandidates :datatype-) "speech_recognition_msgs/SpeechRecognitionCandidates")
(setf (get speech_recognition_msgs::SpeechRecognitionCandidates :definition-)
      "string[] transcript   # candidate words of speech-to-text API
float32[] confidence  # confidence of transcript
")



(provide :speech_recognition_msgs/SpeechRecognitionCandidates "8bf91ae2b1d4cbc38dce17013599f915")


