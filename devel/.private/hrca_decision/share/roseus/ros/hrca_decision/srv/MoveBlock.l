;; Auto-generated. Do not edit!


(when (boundp 'hrca_decision::MoveBlock)
  (if (not (find-package "HRCA_DECISION"))
    (make-package "HRCA_DECISION"))
  (shadow 'MoveBlock (find-package "HRCA_DECISION")))
(unless (find-package "HRCA_DECISION::MOVEBLOCK")
  (make-package "HRCA_DECISION::MOVEBLOCK"))
(unless (find-package "HRCA_DECISION::MOVEBLOCKREQUEST")
  (make-package "HRCA_DECISION::MOVEBLOCKREQUEST"))
(unless (find-package "HRCA_DECISION::MOVEBLOCKRESPONSE")
  (make-package "HRCA_DECISION::MOVEBLOCKRESPONSE"))

(in-package "ROS")





(defclass hrca_decision::MoveBlockRequest
  :super ros::object
  :slots (_block_number _block_zone ))

(defmethod hrca_decision::MoveBlockRequest
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

(defclass hrca_decision::MoveBlockResponse
  :super ros::object
  :slots (_success ))

(defmethod hrca_decision::MoveBlockResponse
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

(defclass hrca_decision::MoveBlock
  :super ros::object
  :slots ())

(setf (get hrca_decision::MoveBlock :md5sum-) "e344a651812b0bbffc3452f20f9ea415")
(setf (get hrca_decision::MoveBlock :datatype-) "hrca_decision/MoveBlock")
(setf (get hrca_decision::MoveBlock :request) hrca_decision::MoveBlockRequest)
(setf (get hrca_decision::MoveBlock :response) hrca_decision::MoveBlockResponse)

(defmethod hrca_decision::MoveBlockRequest
  (:response () (instance hrca_decision::MoveBlockResponse :init)))

(setf (get hrca_decision::MoveBlockRequest :md5sum-) "e344a651812b0bbffc3452f20f9ea415")
(setf (get hrca_decision::MoveBlockRequest :datatype-) "hrca_decision/MoveBlockRequest")
(setf (get hrca_decision::MoveBlockRequest :definition-)
      "
int32 block_number
int32 block_zone
---
bool success

")

(setf (get hrca_decision::MoveBlockResponse :md5sum-) "e344a651812b0bbffc3452f20f9ea415")
(setf (get hrca_decision::MoveBlockResponse :datatype-) "hrca_decision/MoveBlockResponse")
(setf (get hrca_decision::MoveBlockResponse :definition-)
      "
int32 block_number
int32 block_zone
---
bool success

")



(provide :hrca_decision/MoveBlock "e344a651812b0bbffc3452f20f9ea415")


