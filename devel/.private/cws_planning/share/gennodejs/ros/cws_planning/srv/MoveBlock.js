// Auto-generated. Do not edit!

// (in-package cws_planning.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MoveBlockRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.block_number = null;
      this.block_zone = null;
    }
    else {
      if (initObj.hasOwnProperty('block_number')) {
        this.block_number = initObj.block_number
      }
      else {
        this.block_number = 0;
      }
      if (initObj.hasOwnProperty('block_zone')) {
        this.block_zone = initObj.block_zone
      }
      else {
        this.block_zone = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveBlockRequest
    // Serialize message field [block_number]
    bufferOffset = _serializer.int32(obj.block_number, buffer, bufferOffset);
    // Serialize message field [block_zone]
    bufferOffset = _serializer.int32(obj.block_zone, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveBlockRequest
    let len;
    let data = new MoveBlockRequest(null);
    // Deserialize message field [block_number]
    data.block_number = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [block_zone]
    data.block_zone = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cws_planning/MoveBlockRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cd5be2e873780dd2607b31a5a728144a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    int32 block_number
    int32 block_zone
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveBlockRequest(null);
    if (msg.block_number !== undefined) {
      resolved.block_number = msg.block_number;
    }
    else {
      resolved.block_number = 0
    }

    if (msg.block_zone !== undefined) {
      resolved.block_zone = msg.block_zone;
    }
    else {
      resolved.block_zone = 0
    }

    return resolved;
    }
};

class MoveBlockResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.temp = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('temp')) {
        this.temp = initObj.temp
      }
      else {
        this.temp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveBlockResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [temp]
    bufferOffset = _serializer.int32(obj.temp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveBlockResponse
    let len;
    let data = new MoveBlockResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [temp]
    data.temp = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cws_planning/MoveBlockResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '64379aa9ffbb0f8771915781c7d12eac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    int32 temp
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveBlockResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.temp !== undefined) {
      resolved.temp = msg.temp;
    }
    else {
      resolved.temp = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: MoveBlockRequest,
  Response: MoveBlockResponse,
  md5sum() { return 'ce9e787312db48692e8fbbc8b03d8015'; },
  datatype() { return 'cws_planning/MoveBlock'; }
};
