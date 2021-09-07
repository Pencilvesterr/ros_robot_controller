// Auto-generated. Do not edit!

// (in-package posedetection_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let Object6DPose = require('../msg/Object6DPose.js');

//-----------------------------------------------------------

class TargetObjRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TargetObjRequest
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TargetObjRequest
    let len;
    let data = new TargetObjRequest(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.type.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'posedetection_msgs/TargetObjRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dc67331de85cf97091b7d45e5c64ab75';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # service that returns posedetection_msgs/Object6DPose
    string type
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TargetObjRequest(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    return resolved;
    }
};

class TargetObjResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('object_pose')) {
        this.object_pose = initObj.object_pose
      }
      else {
        this.object_pose = new Object6DPose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TargetObjResponse
    // Serialize message field [object_pose]
    bufferOffset = Object6DPose.serialize(obj.object_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TargetObjResponse
    let len;
    let data = new TargetObjResponse(null);
    // Deserialize message field [object_pose]
    data.object_pose = Object6DPose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Object6DPose.getMessageSize(object.object_pose);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'posedetection_msgs/TargetObjResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e3e0d9a56ba420ae5c3854c1194abf0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    posedetection_msgs/Object6DPose object_pose
    
    
    ================================================================================
    MSG: posedetection_msgs/Object6DPose
    # 6D pose of object
    geometry_msgs/Pose pose
    # reliability
    float32 reliability
    
    # type of object, usually contains the filename of the object that allows the receiving side to visualize it
    # can also be used as a unique type id
    string type 
    
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
    const resolved = new TargetObjResponse(null);
    if (msg.object_pose !== undefined) {
      resolved.object_pose = Object6DPose.Resolve(msg.object_pose)
    }
    else {
      resolved.object_pose = new Object6DPose()
    }

    return resolved;
    }
};

module.exports = {
  Request: TargetObjRequest,
  Response: TargetObjResponse,
  md5sum() { return 'ef30370054b38413dfbfa16532d6fb84'; },
  datatype() { return 'posedetection_msgs/TargetObj'; }
};
