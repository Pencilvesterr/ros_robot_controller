
(cl:in-package :asdf)

(defsystem "robohub_object_tracking-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "TrackedObjectPose" :depends-on ("_package_TrackedObjectPose"))
    (:file "_package_TrackedObjectPose" :depends-on ("_package"))
    (:file "TrackedObjectPoseList" :depends-on ("_package_TrackedObjectPoseList"))
    (:file "_package_TrackedObjectPoseList" :depends-on ("_package"))
  ))