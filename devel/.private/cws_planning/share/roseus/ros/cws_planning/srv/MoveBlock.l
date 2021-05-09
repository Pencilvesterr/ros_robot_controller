;; Auto-generated. Do not edit!


(when (boundp 'cws_planning::MoveBlock)
  (if (not (find-package "CWS_PLANNING"))
    (make-package "CWS_PLANNING"))
  (shadow 'MoveBlock (find-package "CWS_PLANNING")))
(unless (find-package "CWS_PLANNING::MOVEBLOCK")
  (make-package "CWS_PLANNING::MOVEBLOCK"))
(unless (find-package "CWS_PLANNING::MOVEBLOCKREQUEST")
  (make-package "CWS_PLANNING::MOVEBLOCKREQUEST"))
(unless (find-package "CWS_PLANNING::MOVEBLOCKRESPONSE")
  (make-package "CWS_PLANNING::MOVEBLOCKRESPONSE"))

(in-package "ROS")





(defclass cws_planning::MoveBlockRequest
  :super ros::object
  :slots (_block_number _block_zone ))

(defmethod cws_planning::MoveBlockRequest
  (:init
   (&key
    ((:block_number __block_number) 0)
    ((:block_zone __block_zone) 0)
    )
   (send-super :init)
   (setq _block_number (round __block_number))
   (setq _block_zone (round __block_zone))
   self)
  (:block_number
   (&optional __block_number)
   (if __block_number (setq _block_number __block_number)) _block_number)
  (:block_zone
   (&optional __block_zone)
   (if __block_zone (setq _block_zone __block_zone)) _block_zone)
  (:serialization-length
   ()
   (+
    ;; int32 _block_number
    4
    ;; int32 _block_zone
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _block_number
       (write-long _block_number s)
     ;; int32 _block_zone
       (write-long _block_zone s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _block_number
     (setq _block_number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _block_zone
     (setq _block_zone (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass cws_planning::MoveBlockResponse
  :super ros::object
  :slots (_success _temp ))

(defmethod cws_planning::MoveBlockResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:temp __temp) 0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _temp (round __temp))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; int32 _temp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; int32 _temp
       (write-long _temp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _temp
     (setq _temp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass cws_planning::MoveBlock
  :super ros::object
  :slots ())

(setf (get cws_planning::MoveBlock :md5sum-) "ce9e787312db48692e8fbbc8b03d8015")
(setf (get cws_planning::MoveBlock :datatype-) "cws_planning/MoveBlock")
(setf (get cws_planning::MoveBlock :request) cws_planning::MoveBlockRequest)
(setf (get cws_planning::MoveBlock :response) cws_planning::MoveBlockResponse)

(defmethod cws_planning::MoveBlockRequest
  (:response () (instance cws_planning::MoveBlockResponse :init)))

(setf (get cws_planning::MoveBlockRequest :md5sum-) "ce9e787312db48692e8fbbc8b03d8015")
(setf (get cws_planning::MoveBlockRequest :datatype-) "cws_planning/MoveBlockRequest")
(setf (get cws_planning::MoveBlockRequest :definition-)
      "
int32 block_number
int32 block_zone
---
bool success
int32 temp

")

(setf (get cws_planning::MoveBlockResponse :md5sum-) "ce9e787312db48692e8fbbc8b03d8015")
(setf (get cws_planning::MoveBlockResponse :datatype-) "cws_planning/MoveBlockResponse")
(setf (get cws_planning::MoveBlockResponse :definition-)
      "
int32 block_number
int32 block_zone
---
bool success
int32 temp

")



(provide :cws_planning/MoveBlock "ce9e787312db48692e8fbbc8b03d8015")


