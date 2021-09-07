// Auto-generated. Do not edit!

// (in-package posedetection_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Curve1D = require('./Curve1D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Feature1D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lines = null;
      this.descriptors = null;
      this.confidences = null;
      this.descriptor_dim = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lines')) {
        this.lines = initObj.lines
      }
      else {
        this.lines = [];
      }
      if (initObj.hasOwnProperty('descriptors')) {
        this.descriptors = initObj.descriptors
      }
      else {
        this.descriptors = [];
      }
      if (initObj.hasOwnProperty('confidences')) {
        this.confidences = initObj.confidences
      }
      else {
        this.confidences = [];
      }
      if (initObj.hasOwnProperty('descriptor_dim')) {
        this.descriptor_dim = initObj.descriptor_dim
      }
      else {
        this.descriptor_dim = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Feature1D
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lines]
    // Serialize the length for message field [lines]
    bufferOffset = _serializer.uint32(obj.lines.length, buffer, bufferOffset);
    obj.lines.forEach((val) => {
      bufferOffset = Curve1D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [descriptors]
    bufferOffset = _arraySerializer.float32(obj.descriptors, buffer, bufferOffset, null);
    // Serialize message field [confidences]
    bufferOffset = _arraySerializer.float32(obj.confidences, buffer, bufferOffset, null);
    // Serialize message field [descriptor_dim]
    bufferOffset = _serializer.int32(obj.descriptor_dim, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Feature1D
    let len;
    let data = new Feature1D(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lines]
    // Deserialize array length for message field [lines]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lines = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lines[i] = Curve1D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [descriptors]
    data.descriptors = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [confidences]
    data.confidences = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [descriptor_dim]
    data.descriptor_dim = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.lines.forEach((val) => {
      length += Curve1D.getMessageSize(val);
    });
    length += 4 * object.descriptors.length;
    length += 4 * object.confidences.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'posedetection_msgs/Feature1D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4568f21f2dd0840ca2d658d4d1710f33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    Curve1D[] lines # N, 0-indexed
    float32[] descriptors # N*descriptor_dim
    float32[] confidences # optional
    int32 descriptor_dim
    
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
    MSG: posedetection_msgs/Curve1D
    float32[] pts # 2xN points in the image
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Feature1D(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lines !== undefined) {
      resolved.lines = new Array(msg.lines.length);
      for (let i = 0; i < resolved.lines.length; ++i) {
        resolved.lines[i] = Curve1D.Resolve(msg.lines[i]);
      }
    }
    else {
      resolved.lines = []
    }

    if (msg.descriptors !== undefined) {
      resolved.descriptors = msg.descriptors;
    }
    else {
      resolved.descriptors = []
    }

    if (msg.confidences !== undefined) {
      resolved.confidences = msg.confidences;
    }
    else {
      resolved.confidences = []
    }

    if (msg.descriptor_dim !== undefined) {
      resolved.descriptor_dim = msg.descriptor_dim;
    }
    else {
      resolved.descriptor_dim = 0
    }

    return resolved;
    }
};

module.exports = Feature1D;
