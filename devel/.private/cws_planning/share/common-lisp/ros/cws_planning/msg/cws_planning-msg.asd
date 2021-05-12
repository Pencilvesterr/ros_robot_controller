
(cl:in-package :asdf)

(defsystem "cws_planning-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TrafficLight" :depends-on ("_package_TrafficLight"))
    (:file "_package_TrafficLight" :depends-on ("_package"))
    (:file "cws_planning" :depends-on ("_package_cws_planning"))
    (:file "_package_cws_planning" :depends-on ("_package"))
  ))