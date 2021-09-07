
(cl:in-package :asdf)

(defsystem "speech_recognition_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Grammar" :depends-on ("_package_Grammar"))
    (:file "_package_Grammar" :depends-on ("_package"))
    (:file "PhraseRule" :depends-on ("_package_PhraseRule"))
    (:file "_package_PhraseRule" :depends-on ("_package"))
    (:file "SpeechRecognitionCandidates" :depends-on ("_package_SpeechRecognitionCandidates"))
    (:file "_package_SpeechRecognitionCandidates" :depends-on ("_package"))
    (:file "Vocabulary" :depends-on ("_package_Vocabulary"))
    (:file "_package_Vocabulary" :depends-on ("_package"))
  ))