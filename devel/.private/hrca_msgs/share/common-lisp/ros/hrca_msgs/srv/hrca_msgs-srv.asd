
(cl:in-package :asdf)

(defsystem "hrca_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ClearOctomap" :depends-on ("_package_ClearOctomap"))
    (:file "_package_ClearOctomap" :depends-on ("_package"))
    (:file "GetRobotPose" :depends-on ("_package_GetRobotPose"))
    (:file "_package_GetRobotPose" :depends-on ("_package"))
    (:file "MoveToPose" :depends-on ("_package_MoveToPose"))
    (:file "_package_MoveToPose" :depends-on ("_package"))
    (:file "ObjectDataRequest" :depends-on ("_package_ObjectDataRequest"))
    (:file "_package_ObjectDataRequest" :depends-on ("_package"))
  ))