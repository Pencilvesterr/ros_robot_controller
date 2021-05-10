;; Auto-generated. Do not edit!


(when (boundp 'cws_planning::MoveToPosition)
  (if (not (find-package "CWS_PLANNING"))
    (make-package "CWS_PLANNING"))
  (shadow 'MoveToPosition (find-package "CWS_PLANNING")))
(unless (find-package "CWS_PLANNING::MOVETOPOSITION")
  (make-package "CWS_PLANNING::MOVETOPOSITION"))
(unless (find-package "CWS_PLANNING::MOVETOPOSITIONREQUEST")
  (make-package "CWS_PLANNING::MOVETOPOSITIONREQUEST"))
(unless (find-package "CWS_PLANNING::MOVETOPOSITIONRESPONSE")
  (make-package "CWS_PLANNING::MOVETOPOSITIONRESPONSE"))

(in-package "ROS")





(defclass cws_planning::MoveToPositionRequest
  :super ros::object
  :slots (_position_number ))

(defmethod cws_planning::MoveToPositionRequest
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

(defclass cws_planning::MoveToPositionResponse
  :super ros::object
  :slots (_success ))

(defmethod cws_planning::MoveToPositionResponse
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

(defclass cws_planning::MoveToPosition
  :super ros::object
  :slots ())

(setf (get cws_planning::MoveToPosition :md5sum-) "40aca93d2ba3835d16d6b0bb93925874")
(setf (get cws_planning::MoveToPosition :datatype-) "cws_planning/MoveToPosition")
(setf (get cws_planning::MoveToPosition :request) cws_planning::MoveToPositionRequest)
(setf (get cws_planning::MoveToPosition :response) cws_planning::MoveToPositionResponse)

(defmethod cws_planning::MoveToPositionRequest
  (:response () (instance cws_planning::MoveToPositionResponse :init)))

(setf (get cws_planning::MoveToPositionRequest :md5sum-) "40aca93d2ba3835d16d6b0bb93925874")
(setf (get cws_planning::MoveToPositionRequest :datatype-) "cws_planning/MoveToPositionRequest")
(setf (get cws_planning::MoveToPositionRequest :definition-)
      "
int32 position_number
---
bool success

")

(setf (get cws_planning::MoveToPositionResponse :md5sum-) "40aca93d2ba3835d16d6b0bb93925874")
(setf (get cws_planning::MoveToPositionResponse :datatype-) "cws_planning/MoveToPositionResponse")
(setf (get cws_planning::MoveToPositionResponse :definition-)
      "
int32 position_number
---
bool success

")



(provide :cws_planning/MoveToPosition "40aca93d2ba3835d16d6b0bb93925874")


