// Auto-generated. Do not edit!

// (in-package cws_planning.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrafficLight {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.block_selected = null;
      this.block_status = null;
      this.zone_selected = null;
      this.zone_status = null;
    }
    else {
      if (initObj.hasOwnProperty('block_selected')) {
        this.block_selected = initObj.block_selected
      }
      else {
        this.block_selected = 0;
      }
      if (initObj.hasOwnProperty('block_status')) {
        this.block_status = initObj.block_status
      }
      else {
        this.block_status = 0;
      }
      if (initObj.hasOwnProperty('zone_selected')) {
        this.zone_selected = initObj.zone_selected
      }
      else {
        this.zone_selected = 0;
      }
      if (initObj.hasOwnProperty('zone_status')) {
        this.zone_status = initObj.zone_status
      }
      else {
        this.zone_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrafficLight
    // Serialize message field [block_selected]
    bufferOffset = _serializer.int32(obj.block_selected, buffer, bufferOffset);
    // Serialize message field [block_status]
    bufferOffset = _serializer.int32(obj.block_status, buffer, bufferOffset);
    // Serialize message field [zone_selected]
    bufferOffset = _serializer.int32(obj.zone_selected, buffer, bufferOffset);
    // Serialize message field [zone_status]
    bufferOffset = _serializer.int32(obj.zone_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrafficLight
    let len;
    let data = new TrafficLight(null);
    // Deserialize message field [block_selected]
    data.block_selected = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [block_status]
    data.block_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [zone_selected]
    data.zone_selected = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [zone_status]
    data.zone_status = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cws_planning/TrafficLight';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5a4682048736e7ecf53045e87035b77';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 block_selected
    int32 block_status
    int32 zone_selected
    int32 zone_status
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrafficLight(null);
    if (msg.block_selected !== undefined) {
      resolved.block_selected = msg.block_selected;
    }
    else {
      resolved.block_selected = 0
    }

    if (msg.block_status !== undefined) {
      resolved.block_status = msg.block_status;
    }
    else {
      resolved.block_status = 0
    }

    if (msg.zone_selected !== undefined) {
      resolved.zone_selected = msg.zone_selected;
    }
    else {
      resolved.zone_selected = 0
    }

    if (msg.zone_status !== undefined) {
      resolved.zone_status = msg.zone_status;
    }
    else {
      resolved.zone_status = 0
    }

    return resolved;
    }
};

module.exports = TrafficLight;
