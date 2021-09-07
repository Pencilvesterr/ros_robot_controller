// Auto-generated. Do not edit!

// (in-package robohub_object_tracking.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TrackedObjectPose = require('./TrackedObjectPose.js');

//-----------------------------------------------------------

class TrackedObjectPoseList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_list = null;
    }
    else {
      if (initObj.hasOwnProperty('object_list')) {
        this.object_list = initObj.object_list
      }
      else {
        this.object_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackedObjectPoseList
    // Serialize message field [object_list]
    // Serialize the length for message field [object_list]
    bufferOffset = _serializer.uint32(obj.object_list.length, buffer, bufferOffset);
    obj.object_list.forEach((val) => {
      bufferOffset = TrackedObjectPose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackedObjectPoseList
    let len;
    let data = new TrackedObjectPoseList(null);
    // Deserialize message field [object_list]
    // Deserialize array length for message field [object_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object_list[i] = TrackedObjectPose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.object_list.forEach((val) => {
      length += TrackedObjectPose.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robohub_object_tracking/TrackedObjectPoseList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '426728e80dadb19a5b9479f4048ea61c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    robohub_object_tracking/TrackedObjectPose[] object_list
    ================================================================================
    MSG: robohub_object_tracking/TrackedObjectPose
    # Used to hold data for each message. The '...List' message is the one actually used.
    string id
    geometry_msgs/PoseStamped pose
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
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
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackedObjectPoseList(null);
    if (msg.object_list !== undefined) {
      resolved.object_list = new Array(msg.object_list.length);
      for (let i = 0; i < resolved.object_list.length; ++i) {
        resolved.object_list[i] = TrackedObjectPose.Resolve(msg.object_list[i]);
      }
    }
    else {
      resolved.object_list = []
    }

    return resolved;
    }
};

module.exports = TrackedObjectPoseList;