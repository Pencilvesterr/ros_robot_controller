// Auto-generated. Do not edit!

// (in-package speech_recognition_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PhraseRule {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.symbol = null;
      this.definition = null;
    }
    else {
      if (initObj.hasOwnProperty('symbol')) {
        this.symbol = initObj.symbol
      }
      else {
        this.symbol = '';
      }
      if (initObj.hasOwnProperty('definition')) {
        this.definition = initObj.definition
      }
      else {
        this.definition = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PhraseRule
    // Serialize message field [symbol]
    bufferOffset = _serializer.string(obj.symbol, buffer, bufferOffset);
    // Serialize message field [definition]
    bufferOffset = _arraySerializer.string(obj.definition, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PhraseRule
    let len;
    let data = new PhraseRule(null);
    // Deserialize message field [symbol]
    data.symbol = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [definition]
    data.definition = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.symbol.length;
    object.definition.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'speech_recognition_msgs/PhraseRule';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8184f0f93fdc3a6768ac26cd56040fdd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string symbol
    string[] definition
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PhraseRule(null);
    if (msg.symbol !== undefined) {
      resolved.symbol = msg.symbol;
    }
    else {
      resolved.symbol = ''
    }

    if (msg.definition !== undefined) {
      resolved.definition = msg.definition;
    }
    else {
      resolved.definition = []
    }

    return resolved;
    }
};

module.exports = PhraseRule;
