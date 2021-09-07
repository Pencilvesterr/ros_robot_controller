; Auto-generated. Do not edit!


(cl:in-package posedetection_msgs-srv)


;//! \htmlinclude Feature1DDetect-request.msg.html

(cl:defclass <Feature1DDetect-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Feature1DDetect-request (<Feature1DDetect-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Feature1DDetect-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Feature1DDetect-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name posedetection_msgs-srv:<Feature1DDetect-request> is deprecated: use posedetection_msgs-srv:Feature1DDetect-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Feature1DDetect-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-srv:image-val is deprecated.  Use posedetection_msgs-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Feature1DDetect-request>) ostream)
  "Serializes a message object of type '<Feature1DDetect-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Feature1DDetect-request>) istream)
  "Deserializes a message object of type '<Feature1DDetect-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Feature1DDetect-request>)))
  "Returns string type for a service object of type '<Feature1DDetect-request>"
  "posedetection_msgs/Feature1DDetectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Feature1DDetect-request)))
  "Returns string type for a service object of type 'Feature1DDetect-request"
  "posedetection_msgs/Feature1DDetectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Feature1DDetect-request>)))
  "Returns md5sum for a message object of type '<Feature1DDetect-request>"
  "c07b4e71dbfbfe7a205001db734b6cdf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Feature1DDetect-request)))
  "Returns md5sum for a message object of type 'Feature1DDetect-request"
  "c07b4e71dbfbfe7a205001db734b6cdf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Feature1DDetect-request>)))
  "Returns full string definition for message of type '<Feature1DDetect-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Feature1DDetect-request)))
  "Returns full string definition for message of type 'Feature1DDetect-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Feature1DDetect-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Feature1DDetect-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Feature1DDetect-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude Feature1DDetect-response.msg.html

(cl:defclass <Feature1DDetect-response> (roslisp-msg-protocol:ros-message)
  ((features
    :reader features
    :initarg :features
    :type posedetection_msgs-msg:Feature1D
    :initform (cl:make-instance 'posedetection_msgs-msg:Feature1D)))
)

(cl:defclass Feature1DDetect-response (<Feature1DDetect-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Feature1DDetect-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Feature1DDetect-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name posedetection_msgs-srv:<Feature1DDetect-response> is deprecated: use posedetection_msgs-srv:Feature1DDetect-response instead.")))

(cl:ensure-generic-function 'features-val :lambda-list '(m))
(cl:defmethod features-val ((m <Feature1DDetect-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader posedetection_msgs-srv:features-val is deprecated.  Use posedetection_msgs-srv:features instead.")
  (features m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Feature1DDetect-response>) ostream)
  "Serializes a message object of type '<Feature1DDetect-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'features) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Feature1DDetect-response>) istream)
  "Deserializes a message object of type '<Feature1DDetect-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'features) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Feature1DDetect-response>)))
  "Returns string type for a service object of type '<Feature1DDetect-response>"
  "posedetection_msgs/Feature1DDetectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Feature1DDetect-response)))
  "Returns string type for a service object of type 'Feature1DDetect-response"
  "posedetection_msgs/Feature1DDetectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Feature1DDetect-response>)))
  "Returns md5sum for a message object of type '<Feature1DDetect-response>"
  "c07b4e71dbfbfe7a205001db734b6cdf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Feature1DDetect-response)))
  "Returns md5sum for a message object of type 'Feature1DDetect-response"
  "c07b4e71dbfbfe7a205001db734b6cdf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Feature1DDetect-response>)))
  "Returns full string definition for message of type '<Feature1DDetect-response>"
  (cl:format cl:nil "posedetection_msgs/Feature1D features~%~%~%================================================================================~%MSG: posedetection_msgs/Feature1D~%Header header~%Curve1D[] lines # N, 0-indexed~%float32[] descriptors # N*descriptor_dim~%float32[] confidences # optional~%int32 descriptor_dim~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: posedetection_msgs/Curve1D~%float32[] pts # 2xN points in the image~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Feature1DDetect-response)))
  "Returns full string definition for message of type 'Feature1DDetect-response"
  (cl:format cl:nil "posedetection_msgs/Feature1D features~%~%~%================================================================================~%MSG: posedetection_msgs/Feature1D~%Header header~%Curve1D[] lines # N, 0-indexed~%float32[] descriptors # N*descriptor_dim~%float32[] confidences # optional~%int32 descriptor_dim~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: posedetection_msgs/Curve1D~%float32[] pts # 2xN points in the image~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Feature1DDetect-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'features))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Feature1DDetect-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Feature1DDetect-response
    (cl:cons ':features (features msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Feature1DDetect)))
  'Feature1DDetect-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Feature1DDetect)))
  'Feature1DDetect-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Feature1DDetect)))
  "Returns string type for a service object of type '<Feature1DDetect>"
  "posedetection_msgs/Feature1DDetect")