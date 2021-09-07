;; Auto-generated. Do not edit!


(when (boundp 'speech_recognition_msgs::PhraseRule)
  (if (not (find-package "SPEECH_RECOGNITION_MSGS"))
    (make-package "SPEECH_RECOGNITION_MSGS"))
  (shadow 'PhraseRule (find-package "SPEECH_RECOGNITION_MSGS")))
(unless (find-package "SPEECH_RECOGNITION_MSGS::PHRASERULE")
  (make-package "SPEECH_RECOGNITION_MSGS::PHRASERULE"))

(in-package "ROS")
;;//! \htmlinclude PhraseRule.msg.html


(defclass speech_recognition_msgs::PhraseRule
  :super ros::object
  :slots (_symbol _definition ))

(defmethod speech_recognition_msgs::PhraseRule
  (:init
   (&key
    ((:symbol __symbol) "")
    ((:definition __definition) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _symbol (string __symbol))
   (setq _definition __definition)
   self)
  (:symbol
   (&optional __symbol)
   (if __symbol (setq _symbol __symbol)) _symbol)
  (:definition
   (&optional __definition)
   (if __definition (setq _definition __definition)) _definition)
  (:serialization-length
   ()
   (+
    ;; string _symbol
    4 (length _symbol)
    ;; string[] _definition
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _definition)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _symbol
       (write-long (length _symbol) s) (princ _symbol s)
     ;; string[] _definition
     (write-long (length _definition) s)
     (dolist (elem _definition)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _symbol
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _symbol (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _definition
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _definition (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _definition i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get speech_recognition_msgs::PhraseRule :md5sum-) "8184f0f93fdc3a6768ac26cd56040fdd")
(setf (get speech_recognition_msgs::PhraseRule :datatype-) "speech_recognition_msgs/PhraseRule")
(setf (get speech_recognition_msgs::PhraseRule :definition-)
      "string symbol
string[] definition

")



(provide :speech_recognition_msgs/PhraseRule "8184f0f93fdc3a6768ac26cd56040fdd")


