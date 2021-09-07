
(cl:in-package :asdf)

(defsystem "posedetection_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Curve1D" :depends-on ("_package_Curve1D"))
    (:file "_package_Curve1D" :depends-on ("_package"))
    (:file "Feature0D" :depends-on ("_package_Feature0D"))
    (:file "_package_Feature0D" :depends-on ("_package"))
    (:file "Feature1D" :depends-on ("_package_Feature1D"))
    (:file "_package_Feature1D" :depends-on ("_package"))
    (:file "ImageFeature0D" :depends-on ("_package_ImageFeature0D"))
    (:file "_package_ImageFeature0D" :depends-on ("_package"))
    (:file "ImageFeature1D" :depends-on ("_package_ImageFeature1D"))
    (:file "_package_ImageFeature1D" :depends-on ("_package"))
    (:file "Object6DPose" :depends-on ("_package_Object6DPose"))
    (:file "_package_Object6DPose" :depends-on ("_package"))
    (:file "ObjectDetection" :depends-on ("_package_ObjectDetection"))
    (:file "_package_ObjectDetection" :depends-on ("_package"))
  ))