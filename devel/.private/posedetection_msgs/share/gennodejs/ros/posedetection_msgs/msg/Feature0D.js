// Auto-generated. Do not edit!

// (in-package posedetection_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Feature0D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.positions = null;
      this.scales = null;
      this.orientations = null;
      this.confidences = null;
      this.descriptors = null;
      this.descriptor_dim = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('positions')) {
        this.positions = initObj.positions
      }
      else {
        this.positions = [];
      }
      if (initObj.hasOwnProperty('scales')) {
        this.scales = initObj.scales
      }
      else {
        this.scales = [];
      }
      if (initObj.hasOwnProperty('orientations')) {
        this.orientations = initObj.orientations
      }
      else {
        this.orientations = [];
      }
      if (initObj.hasOwnProperty('confidences')) {
        this.confidences = initObj.confidences
      }
      else {
        this.confidences = [];
      }
      if (initObj.hasOwnProperty('descriptors')) {
        this.descriptors = initObj.descriptors
      }
      else {
        this.descriptors = [];
      }
      if (initObj.hasOwnProperty('descriptor_dim')) {
        this.descriptor_dim = initObj.descriptor_dim
      }
      else {
        this.descriptor_dim = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Feature0D
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [positions]
    bufferOffset = _arraySerializer.float32(obj.positions, buffer, bufferOffset, null);
    // Serialize message field [scales]
    bufferOffset = _arraySerializer.float32(obj.scales, buffer, bufferOffset, null);
    // Serialize message field [orientations]
    bufferOffset = _arraySerializer.float32(obj.orientations, buffer, bufferOffset, null);
    // Serialize message field [confidences]
    bufferOffset = _arraySerializer.float32(obj.confidences, buffer, bufferOffset, null);
    // Serialize message field [descriptors]
    bufferOffset = _arraySerializer.float32(obj.descriptors, buffer, bufferOffset, null);
    // Serialize message field [descriptor_dim]
    bufferOffset = _serializer.int32(obj.descriptor_dim, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Feature0D
    let len;
    let data = new Feature0D(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [positions]
    data.positions = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [scales]
    data.scales = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [orientations]
    data.orientations = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [confidences]
    data.confidences = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [descriptors]
    data.descriptors = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [descriptor_dim]
    data.descriptor_dim = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.positions.length;
    length += 4 * object.scales.length;
    length += 4 * object.orientations.length;
    length += 4 * object.confidences.length;
    length += 4 * object.descriptors.length;
    length += object.type.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'posedetection_msgs/Feature0D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fcb3ba42a42cf972f3838cdb171f5e04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32[] positions # 2*N, 0-indexed
    float32[] scales # N, optional
    float32[] orientations # N, optional, along +X is 0
    float32[] confidences
    float32[] descriptors # N*descriptor_dim
    int32 descriptor_dim
    string type # type of feature
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Feature0D(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.positions !== undefined) {
      resolved.positions = msg.positions;
    }
    else {
      resolved.positions = []
    }

    if (msg.scales !== undefined) {
      resolved.scales = msg.scales;
    }
    else {
      resolved.scales = []
    }

    if (msg.orientations !== undefined) {
      resolved.orientations = msg.orientations;
    }
    else {
      resolved.orientations = []
    }

    if (msg.confidences !== undefined) {
      resolved.confidences = msg.confidences;
    }
    else {
      resolved.confidences = []
    }

    if (msg.descriptors !== undefined) {
      resolved.descriptors = msg.descriptors;
    }
    else {
      resolved.descriptors = []
    }

    if (msg.descriptor_dim !== undefined) {
      resolved.descriptor_dim = msg.descriptor_dim;
    }
    else {
      resolved.descriptor_dim = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    return resolved;
    }
};

module.exports = Feature0D;
