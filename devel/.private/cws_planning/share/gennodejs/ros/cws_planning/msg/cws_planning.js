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

class cws_planning {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hello = null;
    }
    else {
      if (initObj.hasOwnProperty('hello')) {
        this.hello = initObj.hello
      }
      else {
        this.hello = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cws_planning
    // Serialize message field [hello]
    bufferOffset = _serializer.int32(obj.hello, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cws_planning
    let len;
    let data = new cws_planning(null);
    // Deserialize message field [hello]
    data.hello = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cws_planning/cws_planning';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9d9ca1866b512db488ffb6bed585ed1b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This is needed just to make rosbridge happy, else it wont find TrafficLight.msg (idk why???)
    int32 hello
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cws_planning(null);
    if (msg.hello !== undefined) {
      resolved.hello = msg.hello;
    }
    else {
      resolved.hello = 0
    }

    return resolved;
    }
};

module.exports = cws_planning;
