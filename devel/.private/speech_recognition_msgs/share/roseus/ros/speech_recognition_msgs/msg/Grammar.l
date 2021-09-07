;; Auto-generated. Do not edit!


(when (boundp 'speech_recognition_msgs::Grammar)
  (if (not (find-package "SPEECH_RECOGNITION_MSGS"))
    (make-package "SPEECH_RECOGNITION_MSGS"))
  (shadow 'Grammar (find-package "SPEECH_RECOGNITION_MSGS")))
(unless (find-package "SPEECH_RECOGNITION_MSGS::GRAMMAR")
  (make-package "SPEECH_RECOGNITION_MSGS::GRAMMAR"))

(in-package "ROS")
;;//! \htmlinclude Grammar.msg.html


(defclass speech_recognition_msgs::Grammar
  :super ros::object
  :slots (_name _rules _categories _vocabularies ))

(defmethod speech_recognition_msgs::Grammar
  (:init
   (&key
    ((:name __name) "")
    ((:rules __rules) (let (r) (dotimes (i 0) (push (instance speech_recognition_msgs::PhraseRule :init) r)) r))
    ((:categories __categories) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:vocabularies __vocabularies) (let (r) (dotimes (i 0) (push (instance speech_recognition_msgs::Vocabulary :init) r)) r))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _rules __rules)
   (setq _categories __categories)
   (setq _vocabularies __vocabularies)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:rules
   (&rest __rules)
   (if (keywordp (car __rules))
       (send* _rules __rules)
     (progn
       (if __rules (setq _rules (car __rules)))
       _rules)))
  (:categories
   (&optional __categories)
   (if __categories (setq _categories __categories)) _categories)
  (:vocabularies
   (&rest __vocabularies)
   (if (keywordp (car __vocabularies))
       (send* _vocabularies __vocabularies)
     (progn
       (if __vocabularies (setq _vocabularies (car __vocabularies)))
       _vocabularies)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; speech_recognition_msgs/PhraseRule[] _rules
    (apply #'+ (send-all _rules :serialization-length)) 4
    ;; string[] _categories
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _categories)) 4
    ;; speech_recognition_msgs/Vocabulary[] _vocabularies
    (apply #'+ (send-all _vocabularies :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; speech_recognition_msgs/PhraseRule[] _rules
     (write-long (length _rules) s)
     (dolist (elem _rules)
       (send elem :serialize s)
       )
     ;; string[] _categories
     (write-long (length _categories) s)
     (dolist (elem _categories)
       (write-long (length elem) s) (princ elem s)
       )
     ;; speech_recognition_msgs/Vocabulary[] _vocabularies
     (write-long (length _vocabularies) s)
     (dolist (elem _vocabularies)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; speech_recognition_msgs/PhraseRule[] _rules
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rules (let (r) (dotimes (i n) (push (instance speech_recognition_msgs::PhraseRule :init) r)) r))
     (dolist (elem- _rules)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _categories
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _categories (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _categories i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; speech_recognition_msgs/Vocabulary[] _vocabularies
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vocabularies (let (r) (dotimes (i n) (push (instance speech_recognition_msgs::Vocabulary :init) r)) r))
     (dolist (elem- _vocabularies)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get speech_recognition_msgs::Grammar :md5sum-) "a8653cae3429492cb944a813429e7151")
(setf (get speech_recognition_msgs::Grammar :datatype-) "speech_recognition_msgs/Grammar")
(setf (get speech_recognition_msgs::Grammar :definition-)
      "string name  # register this grammar with the name
PhraseRule[] rules

string[] categories
Vocabulary[] vocabularies

================================================================================
MSG: speech_recognition_msgs/PhraseRule
string symbol
string[] definition

================================================================================
MSG: speech_recognition_msgs/Vocabulary
string name  # register vocabulary with the name.
string[] words
string[] phonemes

")



(provide :speech_recognition_msgs/Grammar "a8653cae3429492cb944a813429e7151")


