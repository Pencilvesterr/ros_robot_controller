// Auto-generated. Do not edit!

// (in-package speech_recognition_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vocabulary = require('../msg/Vocabulary.js');
let Grammar = require('../msg/Grammar.js');

//-----------------------------------------------------------

let SpeechRecognitionCandidates = require('../msg/SpeechRecognitionCandidates.js');

//-----------------------------------------------------------

class SpeechRecognitionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vocabulary = null;
      this.grammar = null;
      this.grammar_name = null;
      this.duration = null;
      this.quiet = null;
      this.threshold = null;
    }
    else {
      if (initObj.hasOwnProperty('vocabulary')) {
        this.vocabulary = initObj.vocabulary
      }
      else {
        this.vocabulary = new Vocabulary();
      }
      if (initObj.hasOwnProperty('grammar')) {
        this.grammar = initObj.grammar
      }
      else {
        this.grammar = new Grammar();
      }
      if (initObj.hasOwnProperty('grammar_name')) {
        this.grammar_name = initObj.grammar_name
      }
      else {
        this.grammar_name = '';
      }
      if (initObj.hasOwnProperty('duration')) {
        this.duration = initObj.duration
      }
      else {
        this.duration = 0.0;
      }
      if (initObj.hasOwnProperty('quiet')) {
        this.quiet = initObj.quiet
      }
      else {
        this.quiet = false;
      }
      if (initObj.hasOwnProperty('threshold')) {
        this.threshold = initObj.threshold
      }
      else {
        this.threshold = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SpeechRecognitionRequest
    // Serialize message field [vocabulary]
    bufferOffset = Vocabulary.serialize(obj.vocabulary, buffer, bufferOffset);
    // Serialize message field [grammar]
    bufferOffset = Grammar.serialize(obj.grammar, buffer, bufferOffset);
    // Serialize message field [grammar_name]
    bufferOffset = _serializer.string(obj.grammar_name, buffer, bufferOffset);
    // Serialize message field [duration]
    bufferOffset = _serializer.float32(obj.duration, buffer, bufferOffset);
    // Serialize message field [quiet]
    bufferOffset = _serializer.bool(obj.quiet, buffer, bufferOffset);
    // Serialize message field [threshold]
    bufferOffset = _serializer.float32(obj.threshold, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SpeechRecognitionRequest
    let len;
    let data = new SpeechRecognitionRequest(null);
    // Deserialize message field [vocabulary]
    data.vocabulary = Vocabulary.deserialize(buffer, bufferOffset);
    // Deserialize message field [grammar]
    data.grammar = Grammar.deserialize(buffer, bufferOffset);
    // Deserialize message field [grammar_name]
    data.grammar_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [duration]
    data.duration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [quiet]
    data.quiet = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [threshold]
    data.threshold = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Vocabulary.getMessageSize(object.vocabulary);
    length += Grammar.getMessageSize(object.grammar);
    length += object.grammar_name.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a service object
    return 'speech_recognition_msgs/SpeechRecognitionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af5602408bd36e4d9a80cde6f4453023';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Vocabulary vocabulary  #  Specify isolated words candidates to be recognized (Enabled on isolated word mode)
    Grammar grammar        #  Or, specify grammar to be recognized
    string grammar_name    #  Or, simply specify grammar name which is already registered on the server
    
    float32 duration
    bool quiet
    float32 threshold
    
    ================================================================================
    MSG: speech_recognition_msgs/Vocabulary
    string name  # register vocabulary with the name.
    string[] words
    string[] phonemes
    
    ================================================================================
    MSG: speech_recognition_msgs/Grammar
    string name  # register this grammar with the name
    PhraseRule[] rules
    
    string[] categories
    Vocabulary[] vocabularies
    
    ================================================================================
    MSG: speech_recognition_msgs/PhraseRule
    string symbol
    string[] definition
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SpeechRecognitionRequest(null);
    if (msg.vocabulary !== undefined) {
      resolved.vocabulary = Vocabulary.Resolve(msg.vocabulary)
    }
    else {
      resolved.vocabulary = new Vocabulary()
    }

    if (msg.grammar !== undefined) {
      resolved.grammar = Grammar.Resolve(msg.grammar)
    }
    else {
      resolved.grammar = new Grammar()
    }

    if (msg.grammar_name !== undefined) {
      resolved.grammar_name = msg.grammar_name;
    }
    else {
      resolved.grammar_name = ''
    }

    if (msg.duration !== undefined) {
      resolved.duration = msg.duration;
    }
    else {
      resolved.duration = 0.0
    }

    if (msg.quiet !== undefined) {
      resolved.quiet = msg.quiet;
    }
    else {
      resolved.quiet = false
    }

    if (msg.threshold !== undefined) {
      resolved.threshold = msg.threshold;
    }
    else {
      resolved.threshold = 0.0
    }

    return resolved;
    }
};

class SpeechRecognitionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = new SpeechRecognitionCandidates();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SpeechRecognitionResponse
    // Serialize message field [result]
    bufferOffset = SpeechRecognitionCandidates.serialize(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SpeechRecognitionResponse
    let len;
    let data = new SpeechRecognitionResponse(null);
    // Deserialize message field [result]
    data.result = SpeechRecognitionCandidates.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += SpeechRecognitionCandidates.getMessageSize(object.result);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'speech_recognition_msgs/SpeechRecognitionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '46fe009ac10a19a0e861b8792ad42e0b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    speech_recognition_msgs/SpeechRecognitionCandidates result
    
    
    ================================================================================
    MSG: speech_recognition_msgs/SpeechRecognitionCandidates
    string[] transcript   # candidate words of speech-to-text API
    float32[] confidence  # confidence of transcript
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SpeechRecognitionResponse(null);
    if (msg.result !== undefined) {
      resolved.result = SpeechRecognitionCandidates.Resolve(msg.result)
    }
    else {
      resolved.result = new SpeechRecognitionCandidates()
    }

    return resolved;
    }
};

module.exports = {
  Request: SpeechRecognitionRequest,
  Response: SpeechRecognitionResponse,
  md5sum() { return 'fa1c2822647ba139ac562b2fdc05f1fb'; },
  datatype() { return 'speech_recognition_msgs/SpeechRecognition'; }
};
