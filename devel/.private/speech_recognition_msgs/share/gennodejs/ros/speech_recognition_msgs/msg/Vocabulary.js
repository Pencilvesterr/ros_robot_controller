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

class Vocabulary {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.words = null;
      this.phonemes = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('words')) {
        this.words = initObj.words
      }
      else {
        this.words = [];
      }
      if (initObj.hasOwnProperty('phonemes')) {
        this.phonemes = initObj.phonemes
      }
      else {
        this.phonemes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Vocabulary
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [words]
    bufferOffset = _arraySerializer.string(obj.words, buffer, bufferOffset, null);
    // Serialize message field [phonemes]
    bufferOffset = _arraySerializer.string(obj.phonemes, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Vocabulary
    let len;
    let data = new Vocabulary(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [words]
    data.words = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [phonemes]
    data.phonemes = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    object.words.forEach((val) => {
      length += 4 + val.length;
    });
    object.phonemes.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'speech_recognition_msgs/Vocabulary';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '20a1ff9e31d8f4dc29f230a64ed707d7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name  # register vocabulary with the name.
    string[] words
    string[] phonemes
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Vocabulary(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.words !== undefined) {
      resolved.words = msg.words;
    }
    else {
      resolved.words = []
    }

    if (msg.phonemes !== undefined) {
      resolved.phonemes = msg.phonemes;
    }
    else {
      resolved.phonemes = []
    }

    return resolved;
    }
};

module.exports = Vocabulary;
