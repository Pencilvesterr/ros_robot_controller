// Auto-generated. Do not edit!

// (in-package speech_recognition_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PhraseRule = require('./PhraseRule.js');
let Vocabulary = require('./Vocabulary.js');

//-----------------------------------------------------------

class Grammar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.rules = null;
      this.categories = null;
      this.vocabularies = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('rules')) {
        this.rules = initObj.rules
      }
      else {
        this.rules = [];
      }
      if (initObj.hasOwnProperty('categories')) {
        this.categories = initObj.categories
      }
      else {
        this.categories = [];
      }
      if (initObj.hasOwnProperty('vocabularies')) {
        this.vocabularies = initObj.vocabularies
      }
      else {
        this.vocabularies = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Grammar
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [rules]
    // Serialize the length for message field [rules]
    bufferOffset = _serializer.uint32(obj.rules.length, buffer, bufferOffset);
    obj.rules.forEach((val) => {
      bufferOffset = PhraseRule.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [categories]
    bufferOffset = _arraySerializer.string(obj.categories, buffer, bufferOffset, null);
    // Serialize message field [vocabularies]
    // Serialize the length for message field [vocabularies]
    bufferOffset = _serializer.uint32(obj.vocabularies.length, buffer, bufferOffset);
    obj.vocabularies.forEach((val) => {
      bufferOffset = Vocabulary.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Grammar
    let len;
    let data = new Grammar(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rules]
    // Deserialize array length for message field [rules]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rules = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rules[i] = PhraseRule.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [categories]
    data.categories = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [vocabularies]
    // Deserialize array length for message field [vocabularies]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.vocabularies = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.vocabularies[i] = Vocabulary.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    object.rules.forEach((val) => {
      length += PhraseRule.getMessageSize(val);
    });
    object.categories.forEach((val) => {
      length += 4 + val.length;
    });
    object.vocabularies.forEach((val) => {
      length += Vocabulary.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'speech_recognition_msgs/Grammar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8653cae3429492cb944a813429e7151';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name  # register this grammar with the name
    PhraseRule[] rules
    
    string[] categories
    Vocabulary[] vocabularies
    
    ================================================================================
    MSG: speech_recognition_msgs/PhraseRule
    string symbol
    string[] definition
    
    ================================================================================
    MSG: speech_recognition_msgs/Vocabulary
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
    const resolved = new Grammar(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.rules !== undefined) {
      resolved.rules = new Array(msg.rules.length);
      for (let i = 0; i < resolved.rules.length; ++i) {
        resolved.rules[i] = PhraseRule.Resolve(msg.rules[i]);
      }
    }
    else {
      resolved.rules = []
    }

    if (msg.categories !== undefined) {
      resolved.categories = msg.categories;
    }
    else {
      resolved.categories = []
    }

    if (msg.vocabularies !== undefined) {
      resolved.vocabularies = new Array(msg.vocabularies.length);
      for (let i = 0; i < resolved.vocabularies.length; ++i) {
        resolved.vocabularies[i] = Vocabulary.Resolve(msg.vocabularies[i]);
      }
    }
    else {
      resolved.vocabularies = []
    }

    return resolved;
    }
};

module.exports = Grammar;
