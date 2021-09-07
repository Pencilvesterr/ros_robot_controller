;; Auto-generated. Do not edit!


(when (boundp 'speech_recognition_msgs::Vocabulary)
  (if (not (find-package "SPEECH_RECOGNITION_MSGS"))
    (make-package "SPEECH_RECOGNITION_MSGS"))
  (shadow 'Vocabulary (find-package "SPEECH_RECOGNITION_MSGS")))
(unless (find-package "SPEECH_RECOGNITION_MSGS::VOCABULARY")
  (make-package "SPEECH_RECOGNITION_MSGS::VOCABULARY"))

(in-package "ROS")
;;//! \htmlinclude Vocabulary.msg.html


(defclass speech_recognition_msgs::Vocabulary
  :super ros::object
  :slots (_name _words _phonemes ))

(defmethod speech_recognition_msgs::Vocabulary
  (:init
   (&key
    ((:name __name) "")
    ((:words __words) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:phonemes __phonemes) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _words __words)
   (setq _phonemes __phonemes)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:words
   (&optional __words)
   (if __words (setq _words __words)) _words)
  (:phonemes
   (&optional __phonemes)
   (if __phonemes (setq _phonemes __phonemes)) _phonemes)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string[] _words
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _words)) 4
    ;; string[] _phonemes
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _phonemes)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string[] _words
     (write-long (length _words) s)
     (dolist (elem _words)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _phonemes
     (write-long (length _phonemes) s)
     (dolist (elem _phonemes)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _words
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _words (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _words i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _phonemes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _phonemes (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _phonemes i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get speech_recognition_msgs::Vocabulary :md5sum-) "20a1ff9e31d8f4dc29f230a64ed707d7")
(setf (get speech_recognition_msgs::Vocabulary :datatype-) "speech_recognition_msgs/Vocabulary")
(setf (get speech_recognition_msgs::Vocabulary :definition-)
      "string name  # register vocabulary with the name.
string[] words
string[] phonemes

")



(provide :speech_recognition_msgs/Vocabulary "20a1ff9e31d8f4dc29f230a64ed707d7")


