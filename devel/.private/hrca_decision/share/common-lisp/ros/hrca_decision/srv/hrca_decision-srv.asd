
(cl:in-package :asdf)

(defsystem "hrca_decision-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MoveBlock" :depends-on ("_package_MoveBlock"))
    (:file "_package_MoveBlock" :depends-on ("_package"))
    (:file "MoveToPosition" :depends-on ("_package_MoveToPosition"))
    (:file "_package_MoveToPosition" :depends-on ("_package"))
    (:file "ResetRobot" :depends-on ("_package_ResetRobot"))
    (:file "_package_ResetRobot" :depends-on ("_package"))
  ))