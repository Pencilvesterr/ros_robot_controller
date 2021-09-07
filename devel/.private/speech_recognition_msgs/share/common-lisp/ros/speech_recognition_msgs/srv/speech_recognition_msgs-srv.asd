
(cl:in-package :asdf)

(defsystem "speech_recognition_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :speech_recognition_msgs-msg
)
  :components ((:file "_package")
    (:file "SpeechRecognition" :depends-on ("_package_SpeechRecognition"))
    (:file "_package_SpeechRecognition" :depends-on ("_package"))
  ))