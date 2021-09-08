;; Auto-generated. Do not edit!


(when (boundp 'hrca_decision::ResetRobot)
  (if (not (find-package "HRCA_DECISION"))
    (make-package "HRCA_DECISION"))
  (shadow 'ResetRobot (find-package "HRCA_DECISION")))
(unless (find-package "HRCA_DECISION::RESETROBOT")
  (make-package "HRCA_DECISION::RESETROBOT"))
(unless (find-package "HRCA_DECISION::RESETROBOTREQUEST")
  (make-package "HRCA_DECISION::RESETROBOTREQUEST"))
(unless (find-package "HRCA_DECISION::RESETROBOTRESPONSE")
  (make-package "HRCA_DECISION::RESETROBOTRESPONSE"))

(in-package "ROS")





(defclass hrca_decision::ResetRobotRequest
  :super ros::object
  :slots ())

(defmethod hrca_decision::ResetRobotRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass hrca_decision::ResetRobotResponse
  :super ros::object
  :slots (_success ))

(defmethod hrca_decision::ResetRobotResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hrca_decision::ResetRobot
  :super ros::object
  :slots ())

(setf (get hrca_decision::ResetRobot :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get hrca_decision::ResetRobot :datatype-) "hrca_decision/ResetRobot")
(setf (get hrca_decision::ResetRobot :request) hrca_decision::ResetRobotRequest)
(setf (get hrca_decision::ResetRobot :response) hrca_decision::ResetRobotResponse)

(defmethod hrca_decision::ResetRobotRequest
  (:response () (instance hrca_decision::ResetRobotResponse :init)))

(setf (get hrca_decision::ResetRobotRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get hrca_decision::ResetRobotRequest :datatype-) "hrca_decision/ResetRobotRequest")
(setf (get hrca_decision::ResetRobotRequest :definition-)
      "---
bool success

")

(setf (get hrca_decision::ResetRobotResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get hrca_decision::ResetRobotResponse :datatype-) "hrca_decision/ResetRobotResponse")
(setf (get hrca_decision::ResetRobotResponse :definition-)
      "---
bool success

")



(provide :hrca_decision/ResetRobot "358e233cde0c8a8bcfea4ce193f8fc15")


