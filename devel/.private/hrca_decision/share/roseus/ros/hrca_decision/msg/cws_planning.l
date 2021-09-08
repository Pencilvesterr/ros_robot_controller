;; Auto-generated. Do not edit!


(when (boundp 'hrca_decision::cws_planning)
  (if (not (find-package "HRCA_DECISION"))
    (make-package "HRCA_DECISION"))
  (shadow 'cws_planning (find-package "HRCA_DECISION")))
(unless (find-package "HRCA_DECISION::CWS_PLANNING")
  (make-package "HRCA_DECISION::CWS_PLANNING"))

(in-package "ROS")
;;//! \htmlinclude cws_planning.msg.html


(defclass hrca_decision::cws_planning
  :super ros::object
  :slots (_hello ))

(defmethod hrca_decision::cws_planning
  (:init
   (&key
    ((:hello __hello) 0)
    )
   (send-super :init)
   (setq _hello (round __hello))
   self)
  (:hello
   (&optional __hello)
   (if __hello (setq _hello __hello)) _hello)
  (:serialization-length
   ()
   (+
    ;; int32 _hello
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _hello
       (write-long _hello s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _hello
     (setq _hello (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hrca_decision::cws_planning :md5sum-) "9d9ca1866b512db488ffb6bed585ed1b")
(setf (get hrca_decision::cws_planning :datatype-) "hrca_decision/cws_planning")
(setf (get hrca_decision::cws_planning :definition-)
      "# This is needed just to make rosbridge happy, else it wont find TrafficLight.msg (idk why???)
int32 hello
")



(provide :hrca_decision/cws_planning "9d9ca1866b512db488ffb6bed585ed1b")


