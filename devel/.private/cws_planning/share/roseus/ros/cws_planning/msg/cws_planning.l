;; Auto-generated. Do not edit!


(when (boundp 'cws_planning::cws_planning)
  (if (not (find-package "CWS_PLANNING"))
    (make-package "CWS_PLANNING"))
  (shadow 'cws_planning (find-package "CWS_PLANNING")))
(unless (find-package "CWS_PLANNING::CWS_PLANNING")
  (make-package "CWS_PLANNING::CWS_PLANNING"))

(in-package "ROS")
;;//! \htmlinclude cws_planning.msg.html


(defclass cws_planning::cws_planning
  :super ros::object
  :slots ())

(defmethod cws_planning::cws_planning
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

(setf (get cws_planning::cws_planning :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get cws_planning::cws_planning :datatype-) "cws_planning/cws_planning")
(setf (get cws_planning::cws_planning :definition-)
      "
")



(provide :cws_planning/cws_planning "d41d8cd98f00b204e9800998ecf8427e")


