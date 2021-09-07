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

class SpeechRecognitionCandidates {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.transcript = null;
      this.confidence = null;
    }
    else {
      if (initObj.hasOwnProperty('transcript')) {
        this.transcript = initObj.transcript
      }
      else {
        this.transcript = [];
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SpeechRecognitionCandidates
    // Serialize message field [transcript]
    bufferOffset = _arraySerializer.string(obj.transcript, buffer, bufferOffset, null);
    // Serialize message field [confidence]
    bufferOffset = _arraySerializer.float32(obj.confidence, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SpeechRecognitionCandidates
    let len;
    let data = new SpeechRecognitionCandidates(null);
    // Deserialize message field [transcript]
    data.transcript = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [confidence]
    data.confidence = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.transcript.forEach((val) => {
      length += 4 + val.length;
    });
    length += 4 * object.confidence.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'speech_recognition_msgs/SpeechRecognitionCandidates';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8bf91ae2b1d4cbc38dce17013599f915';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] transcript   # candidate words of speech-to-text API
    float32[] confidence  # confidence of transcript
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SpeechRecognitionCandidates(null);
    if (msg.transcript !== undefined) {
      resolved.transcript = msg.transcript;
    }
    else {
      resolved.transcript = []
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = []
    }

    return resolved;
    }
};

module.exports = SpeechRecognitionCandidates;
