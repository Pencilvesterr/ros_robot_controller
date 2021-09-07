
(cl:in-package :asdf)

(defsystem "posedetection_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :posedetection_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Detect" :depends-on ("_package_Detect"))
    (:file "_package_Detect" :depends-on ("_package"))
    (:file "Feature0DDetect" :depends-on ("_package_Feature0DDetect"))
    (:file "_package_Feature0DDetect" :depends-on ("_package"))
    (:file "Feature1DDetect" :depends-on ("_package_Feature1DDetect"))
    (:file "_package_Feature1DDetect" :depends-on ("_package"))
    (:file "TargetObj" :depends-on ("_package_TargetObj"))
    (:file "_package_TargetObj" :depends-on ("_package"))
  ))