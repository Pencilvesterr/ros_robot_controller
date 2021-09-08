;; Auto-generated. Do not edit!


(when (boundp 'hrca_decision::MoveToPosition)
  (if (not (find-package "HRCA_DECISION"))
    (make-package "HRCA_DECISION"))
  (shadow 'MoveToPosition (find-package "HRCA_DECISION")))
(unless (find-package "HRCA_DECISION::MOVETOPOSITION")
  (make-package "HRCA_DECISION::MOVETOPOSITION"))
(unless (find-package "HRCA_DECISION::MOVETOPOSITIONREQUEST")
  (make-package "HRCA_DECISION::MOVETOPOSITIONREQUEST"))
(unless (find-package "HRCA_DECISION::MOVETOPOSITIONRESPONSE")
  (make-package "HRCA_DECISION::MOVETOPOSITIONRESPONSE"))

(in-package "ROS")





(defclass hrca_decision::MoveToPositionRequest
  :super ros::object
  :slots (_position_number ))

(defmethod hrca_decision::MoveToPositionRequest
  (:init
   (&key
    ((:position_number __position_number) 0)
    )
   (send-super :init)
   (setq _position_number (round __position_number))
   self)
  (:position_number
   (&optional __position_number)
   (if __position_number (setq _position_number __position_number)) _position_number)
  (:serialization-length
   ()
   (+
    ;; int32 _position_number
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _position_number
       (write-long _position_number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _position_number
     (setq _position_number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass hrca_decision::MoveToPositionResponse
  :super ros::object
  :slots (_success ))

(defmethod hrca_decision::MoveToPositionResponse
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

(defclass hrca_decision::MoveToPosition
  :super ros::object
  :slots ())

(setf (get hrca_decision::MoveToPosition :md5sum-) "40aca93d2ba3835d16d6b0bb93925874")
(setf (get hrca_decision::MoveToPosition :datatype-) "hrca_decision/MoveToPosition")
(setf (get hrca_decision::MoveToPosition :request) hrca_decision::MoveToPositionRequest)
(setf (get hrca_decision::MoveToPosition :response) hrca_decision::MoveToPositionResponse)

(defmethod hrca_decision::MoveToPositionRequest
  (:response () (instance hrca_decision::MoveToPositionResponse :init)))

(setf (get hrca_decision::MoveToPositionRequest :md5sum-) "40aca93d2ba3835d16d6b0bb93925874")
(setf (get hrca_decision::MoveToPositionRequest :datatype-) "hrca_decision/MoveToPositionRequest")
(setf (get hrca_decision::MoveToPositionRequest :definition-)
      "
int32 position_number
---
bool success

")

(setf (get hrca_decision::MoveToPositionResponse :md5sum-) "40aca93d2ba3835d16d6b0bb93925874")
(setf (get hrca_decision::MoveToPositionResponse :datatype-) "hrca_decision/MoveToPositionResponse")
(setf (get hrca_decision::MoveToPositionResponse :definition-)
      "
int32 position_number
---
bool success

")



(provide :hrca_decision/MoveToPosition "40aca93d2ba3835d16d6b0bb93925874")


