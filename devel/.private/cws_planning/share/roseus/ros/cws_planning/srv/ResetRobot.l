;; Auto-generated. Do not edit!


(when (boundp 'cws_planning::ResetRobot)
  (if (not (find-package "CWS_PLANNING"))
    (make-package "CWS_PLANNING"))
  (shadow 'ResetRobot (find-package "CWS_PLANNING")))
(unless (find-package "CWS_PLANNING::RESETROBOT")
  (make-package "CWS_PLANNING::RESETROBOT"))
(unless (find-package "CWS_PLANNING::RESETROBOTREQUEST")
  (make-package "CWS_PLANNING::RESETROBOTREQUEST"))
(unless (find-package "CWS_PLANNING::RESETROBOTRESPONSE")
  (make-package "CWS_PLANNING::RESETROBOTRESPONSE"))

(in-package "ROS")





(defclass cws_planning::ResetRobotRequest
  :super ros::object
  :slots ())

(defmethod cws_planning::ResetRobotRequest
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

(defclass cws_planning::ResetRobotResponse
  :super ros::object
  :slots (_success ))

(defmethod cws_planning::ResetRobotResponse
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

(defclass cws_planning::ResetRobot
  :super ros::object
  :slots ())

(setf (get cws_planning::ResetRobot :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get cws_planning::ResetRobot :datatype-) "cws_planning/ResetRobot")
(setf (get cws_planning::ResetRobot :request) cws_planning::ResetRobotRequest)
(setf (get cws_planning::ResetRobot :response) cws_planning::ResetRobotResponse)

(defmethod cws_planning::ResetRobotRequest
  (:response () (instance cws_planning::ResetRobotResponse :init)))

(setf (get cws_planning::ResetRobotRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get cws_planning::ResetRobotRequest :datatype-) "cws_planning/ResetRobotRequest")
(setf (get cws_planning::ResetRobotRequest :definition-)
      "---
bool success

")

(setf (get cws_planning::ResetRobotResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get cws_planning::ResetRobotResponse :datatype-) "cws_planning/ResetRobotResponse")
(setf (get cws_planning::ResetRobotResponse :definition-)
      "---
bool success

")



(provide :cws_planning/ResetRobot "358e233cde0c8a8bcfea4ce193f8fc15")


