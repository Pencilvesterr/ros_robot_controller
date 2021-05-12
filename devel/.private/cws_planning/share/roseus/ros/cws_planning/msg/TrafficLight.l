;; Auto-generated. Do not edit!


(when (boundp 'cws_planning::TrafficLight)
  (if (not (find-package "CWS_PLANNING"))
    (make-package "CWS_PLANNING"))
  (shadow 'TrafficLight (find-package "CWS_PLANNING")))
(unless (find-package "CWS_PLANNING::TRAFFICLIGHT")
  (make-package "CWS_PLANNING::TRAFFICLIGHT"))

(in-package "ROS")
;;//! \htmlinclude TrafficLight.msg.html


(defclass cws_planning::TrafficLight
  :super ros::object
  :slots (_block_selected _block_status _zone_selected _zone_status ))

(defmethod cws_planning::TrafficLight
  (:init
   (&key
    ((:block_selected __block_selected) 0)
    ((:block_status __block_status) 0)
    ((:zone_selected __zone_selected) 0)
    ((:zone_status __zone_status) 0)
    )
   (send-super :init)
   (setq _block_selected (round __block_selected))
   (setq _block_status (round __block_status))
   (setq _zone_selected (round __zone_selected))
   (setq _zone_status (round __zone_status))
   self)
  (:block_selected
   (&optional __block_selected)
   (if __block_selected (setq _block_selected __block_selected)) _block_selected)
  (:block_status
   (&optional __block_status)
   (if __block_status (setq _block_status __block_status)) _block_status)
  (:zone_selected
   (&optional __zone_selected)
   (if __zone_selected (setq _zone_selected __zone_selected)) _zone_selected)
  (:zone_status
   (&optional __zone_status)
   (if __zone_status (setq _zone_status __zone_status)) _zone_status)
  (:serialization-length
   ()
   (+
    ;; int32 _block_selected
    4
    ;; int32 _block_status
    4
    ;; int32 _zone_selected
    4
    ;; int32 _zone_status
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _block_selected
       (write-long _block_selected s)
     ;; int32 _block_status
       (write-long _block_status s)
     ;; int32 _zone_selected
       (write-long _zone_selected s)
     ;; int32 _zone_status
       (write-long _zone_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _block_selected
     (setq _block_selected (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _block_status
     (setq _block_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _zone_selected
     (setq _zone_selected (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _zone_status
     (setq _zone_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cws_planning::TrafficLight :md5sum-) "a5a4682048736e7ecf53045e87035b77")
(setf (get cws_planning::TrafficLight :datatype-) "cws_planning/TrafficLight")
(setf (get cws_planning::TrafficLight :definition-)
      "int32 block_selected
int32 block_status
int32 zone_selected
int32 zone_status
")



(provide :cws_planning/TrafficLight "a5a4682048736e7ecf53045e87035b77")


