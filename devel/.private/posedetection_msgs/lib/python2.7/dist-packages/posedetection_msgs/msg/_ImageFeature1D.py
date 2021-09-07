# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from posedetection_msgs/ImageFeature1D.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import posedetection_msgs.msg
import sensor_msgs.msg
import std_msgs.msg

class ImageFeature1D(genpy.Message):
  _md5sum = "bfd3a262e6342c55b7e11fccf00d8b2c"
  _type = "posedetection_msgs/ImageFeature1D"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# synchronized image and features message
sensor_msgs/Image image
sensor_msgs/CameraInfo info
posedetection_msgs/Feature1D features

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/CameraInfo
# This message defines meta information for a camera. It should be in a
# camera namespace on topic "camera_info" and accompanied by up to five
# image topics named:
#
#   image_raw - raw data from the camera driver, possibly Bayer encoded
#   image            - monochrome, distorted
#   image_color      - color, distorted
#   image_rect       - monochrome, rectified
#   image_rect_color - color, rectified
#
# The image_pipeline contains packages (image_proc, stereo_image_proc)
# for producing the four processed image topics from image_raw and
# camera_info. The meaning of the camera parameters are described in
# detail at http://www.ros.org/wiki/image_pipeline/CameraInfo.
#
# The image_geometry package provides a user-friendly interface to
# common operations using this meta information. If you want to, e.g.,
# project a 3d point into image coordinates, we strongly recommend
# using image_geometry.
#
# If the camera is uncalibrated, the matrices D, K, R, P should be left
# zeroed out. In particular, clients may assume that K[0] == 0.0
# indicates an uncalibrated camera.

#######################################################################
#                     Image acquisition info                          #
#######################################################################

# Time of image acquisition, camera coordinate frame ID
Header header    # Header timestamp should be acquisition time of image
                 # Header frame_id should be optical frame of camera
                 # origin of frame should be optical center of camera
                 # +x should point to the right in the image
                 # +y should point down in the image
                 # +z should point into the plane of the image


#######################################################################
#                      Calibration Parameters                         #
#######################################################################
# These are fixed during camera calibration. Their values will be the #
# same in all messages until the camera is recalibrated. Note that    #
# self-calibrating systems may "recalibrate" frequently.              #
#                                                                     #
# The internal parameters can be used to warp a raw (distorted) image #
# to:                                                                 #
#   1. An undistorted image (requires D and K)                        #
#   2. A rectified image (requires D, K, R)                           #
# The projection matrix P projects 3D points into the rectified image.#
#######################################################################

# The image dimensions with which the camera was calibrated. Normally
# this will be the full camera resolution in pixels.
uint32 height
uint32 width

# The distortion model used. Supported models are listed in
# sensor_msgs/distortion_models.h. For most cameras, "plumb_bob" - a
# simple model of radial and tangential distortion - is sufficient.
string distortion_model

# The distortion parameters, size depending on the distortion model.
# For "plumb_bob", the 5 parameters are: (k1, k2, t1, t2, k3).
float64[] D

# Intrinsic camera matrix for the raw (distorted) images.
#     [fx  0 cx]
# K = [ 0 fy cy]
#     [ 0  0  1]
# Projects 3D points in the camera coordinate frame to 2D pixel
# coordinates using the focal lengths (fx, fy) and principal point
# (cx, cy).
float64[9]  K # 3x3 row-major matrix

# Rectification matrix (stereo cameras only)
# A rotation matrix aligning the camera coordinate system to the ideal
# stereo image plane so that epipolar lines in both stereo images are
# parallel.
float64[9]  R # 3x3 row-major matrix

# Projection/camera matrix
#     [fx'  0  cx' Tx]
# P = [ 0  fy' cy' Ty]
#     [ 0   0   1   0]
# By convention, this matrix specifies the intrinsic (camera) matrix
#  of the processed (rectified) image. That is, the left 3x3 portion
#  is the normal camera intrinsic matrix for the rectified image.
# It projects 3D points in the camera coordinate frame to 2D pixel
#  coordinates using the focal lengths (fx', fy') and principal point
#  (cx', cy') - these may differ from the values in K.
# For monocular cameras, Tx = Ty = 0. Normally, monocular cameras will
#  also have R = the identity and P[1:3,1:3] = K.
# For a stereo pair, the fourth column [Tx Ty 0]' is related to the
#  position of the optical center of the second camera in the first
#  camera's frame. We assume Tz = 0 so both cameras are in the same
#  stereo image plane. The first camera always has Tx = Ty = 0. For
#  the right (second) camera of a horizontal stereo pair, Ty = 0 and
#  Tx = -fx' * B, where B is the baseline between the cameras.
# Given a 3D point [X Y Z]', the projection (x, y) of the point onto
#  the rectified image is given by:
#  [u v w]' = P * [X Y Z 1]'
#         x = u / w
#         y = v / w
#  This holds for both images of a stereo pair.
float64[12] P # 3x4 row-major matrix


#######################################################################
#                      Operational Parameters                         #
#######################################################################
# These define the image region actually captured by the camera       #
# driver. Although they affect the geometry of the output image, they #
# may be changed freely without recalibrating the camera.             #
#######################################################################

# Binning refers here to any camera setting which combines rectangular
#  neighborhoods of pixels into larger "super-pixels." It reduces the
#  resolution of the output image to
#  (width / binning_x) x (height / binning_y).
# The default values binning_x = binning_y = 0 is considered the same
#  as binning_x = binning_y = 1 (no subsampling).
uint32 binning_x
uint32 binning_y

# Region of interest (subwindow of full camera resolution), given in
#  full resolution (unbinned) image coordinates. A particular ROI
#  always denotes the same window of pixels on the camera sensor,
#  regardless of binning settings.
# The default setting of roi (all values 0) is considered the same as
#  full resolution (roi.width = width, roi.height = height).
RegionOfInterest roi

================================================================================
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the "raw"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify

================================================================================
MSG: posedetection_msgs/Feature1D
Header header
Curve1D[] lines # N, 0-indexed
float32[] descriptors # N*descriptor_dim
float32[] confidences # optional
int32 descriptor_dim

================================================================================
MSG: posedetection_msgs/Curve1D
float32[] pts # 2xN points in the image
"""
  __slots__ = ['image','info','features']
  _slot_types = ['sensor_msgs/Image','sensor_msgs/CameraInfo','posedetection_msgs/Feature1D']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       image,info,features

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ImageFeature1D, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      if self.info is None:
        self.info = sensor_msgs.msg.CameraInfo()
      if self.features is None:
        self.features = posedetection_msgs.msg.Feature1D()
    else:
      self.image = sensor_msgs.msg.Image()
      self.info = sensor_msgs.msg.CameraInfo()
      self.features = posedetection_msgs.msg.Feature1D()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs))
      _x = self.image.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.image.height, _x.image.width))
      _x = self.image.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.image.is_bigendian, _x.image.step))
      _x = self.image.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.Struct('<I%sB'%length).pack(length, *_x))
      else:
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs))
      _x = self.info.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.info.height, _x.info.width))
      _x = self.info.distortion_model
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.info.D)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.info.D))
      buff.write(_get_struct_9d().pack(*self.info.K))
      buff.write(_get_struct_9d().pack(*self.info.R))
      buff.write(_get_struct_12d().pack(*self.info.P))
      _x = self
      buff.write(_get_struct_6IB3I().pack(_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.features.header.seq, _x.features.header.stamp.secs, _x.features.header.stamp.nsecs))
      _x = self.features.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.features.lines)
      buff.write(_struct_I.pack(length))
      for val1 in self.features.lines:
        length = len(val1.pts)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(struct.Struct(pattern).pack(*val1.pts))
      length = len(self.features.descriptors)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.features.descriptors))
      length = len(self.features.confidences)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.features.confidences))
      _x = self.features.descriptor_dim
      buff.write(_get_struct_i().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      if self.info is None:
        self.info = sensor_msgs.msg.CameraInfo()
      if self.features is None:
        self.features = posedetection_msgs.msg.Feature1D()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.image.height, _x.image.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.encoding = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.image.is_bigendian, _x.image.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.image.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.info.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.info.height, _x.info.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.distortion_model = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.info.distortion_model = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.info.D = s.unpack(str[start:end])
      start = end
      end += 72
      self.info.K = _get_struct_9d().unpack(str[start:end])
      start = end
      end += 72
      self.info.R = _get_struct_9d().unpack(str[start:end])
      start = end
      end += 96
      self.info.P = _get_struct_12d().unpack(str[start:end])
      _x = self
      start = end
      end += 37
      (_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.features.header.seq, _x.features.header.stamp.secs, _x.features.header.stamp.nsecs,) = _get_struct_6IB3I().unpack(str[start:end])
      self.info.roi.do_rectify = bool(self.info.roi.do_rectify)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.features.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.features.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.features.lines = []
      for i in range(0, length):
        val1 = posedetection_msgs.msg.Curve1D()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.pts = s.unpack(str[start:end])
        self.features.lines.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.features.descriptors = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.features.confidences = s.unpack(str[start:end])
      start = end
      end += 4
      (self.features.descriptor_dim,) = _get_struct_i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs))
      _x = self.image.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.image.height, _x.image.width))
      _x = self.image.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.image.is_bigendian, _x.image.step))
      _x = self.image.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.Struct('<I%sB'%length).pack(length, *_x))
      else:
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs))
      _x = self.info.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.info.height, _x.info.width))
      _x = self.info.distortion_model
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.info.D)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.info.D.tostring())
      buff.write(self.info.K.tostring())
      buff.write(self.info.R.tostring())
      buff.write(self.info.P.tostring())
      _x = self
      buff.write(_get_struct_6IB3I().pack(_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.features.header.seq, _x.features.header.stamp.secs, _x.features.header.stamp.nsecs))
      _x = self.features.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.features.lines)
      buff.write(_struct_I.pack(length))
      for val1 in self.features.lines:
        length = len(val1.pts)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(val1.pts.tostring())
      length = len(self.features.descriptors)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.features.descriptors.tostring())
      length = len(self.features.confidences)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.features.confidences.tostring())
      _x = self.features.descriptor_dim
      buff.write(_get_struct_i().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      if self.info is None:
        self.info = sensor_msgs.msg.CameraInfo()
      if self.features is None:
        self.features = posedetection_msgs.msg.Feature1D()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.image.height, _x.image.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.encoding = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.image.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.image.is_bigendian, _x.image.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.image.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.info.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.info.height, _x.info.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.distortion_model = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.info.distortion_model = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.info.D = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 72
      self.info.K = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      start = end
      end += 72
      self.info.R = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      start = end
      end += 96
      self.info.P = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=12)
      _x = self
      start = end
      end += 37
      (_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.features.header.seq, _x.features.header.stamp.secs, _x.features.header.stamp.nsecs,) = _get_struct_6IB3I().unpack(str[start:end])
      self.info.roi.do_rectify = bool(self.info.roi.do_rectify)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.features.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.features.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.features.lines = []
      for i in range(0, length):
        val1 = posedetection_msgs.msg.Curve1D()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.pts = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
        self.features.lines.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.features.descriptors = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.features.confidences = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (self.features.descriptor_dim,) = _get_struct_i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_12d = None
def _get_struct_12d():
    global _struct_12d
    if _struct_12d is None:
        _struct_12d = struct.Struct("<12d")
    return _struct_12d
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_6IB3I = None
def _get_struct_6IB3I():
    global _struct_6IB3I
    if _struct_6IB3I is None:
        _struct_6IB3I = struct.Struct("<6IB3I")
    return _struct_6IB3I
_struct_9d = None
def _get_struct_9d():
    global _struct_9d
    if _struct_9d is None:
        _struct_9d = struct.Struct("<9d")
    return _struct_9d
_struct_BI = None
def _get_struct_BI():
    global _struct_BI
    if _struct_BI is None:
        _struct_BI = struct.Struct("<BI")
    return _struct_BI
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
