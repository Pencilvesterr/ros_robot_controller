
(cl:in-package :asdf)

(defsystem "hrca_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RobotTaskAction" :depends-on ("_package_RobotTaskAction"))
    (:file "_package_RobotTaskAction" :depends-on ("_package"))
    (:file "RobotTaskActionFeedback" :depends-on ("_package_RobotTaskActionFeedback"))
    (:file "_package_RobotTaskActionFeedback" :depends-on ("_package"))
    (:file "RobotTaskActionGoal" :depends-on ("_package_RobotTaskActionGoal"))
    (:file "_package_RobotTaskActionGoal" :depends-on ("_package"))
    (:file "RobotTaskActionResult" :depends-on ("_package_RobotTaskActionResult"))
    (:file "_package_RobotTaskActionResult" :depends-on ("_package"))
    (:file "RobotTaskFeedback" :depends-on ("_package_RobotTaskFeedback"))
    (:file "_package_RobotTaskFeedback" :depends-on ("_package"))
    (:file "RobotTaskGoal" :depends-on ("_package_RobotTaskGoal"))
    (:file "_package_RobotTaskGoal" :depends-on ("_package"))
    (:file "RobotTaskResult" :depends-on ("_package_RobotTaskResult"))
    (:file "_package_RobotTaskResult" :depends-on ("_package"))
  ))