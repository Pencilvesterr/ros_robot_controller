// Auto-generated. Do not edit!

// (in-package posedetection_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Curve1D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pts = null;
    }
    else {
      if (initObj.hasOwnProperty('pts')) {
        this.pts = initObj.pts
      }
      else {
        this.pts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Curve1D
    // Serialize message field [pts]
    bufferOffset = _arraySerializer.float32(obj.pts, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Curve1D
    let len;
    let data = new Curve1D(null);
    // Deserialize message field [pts]
    data.pts = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.pts.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'posedetection_msgs/Curve1D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5367ca89dc9a58670f8f288e2c52f5d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] pts # 2xN points in the image
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Curve1D(null);
    if (msg.pts !== undefined) {
      resolved.pts = msg.pts;
    }
    else {
      resolved.pts = []
    }

    return resolved;
    }
};

module.exports = Curve1D;
