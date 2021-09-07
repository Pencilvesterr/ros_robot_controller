// Generated by gencpp from file speech_recognition_msgs/SpeechRecognition.msg
// DO NOT EDIT!


#ifndef SPEECH_RECOGNITION_MSGS_MESSAGE_SPEECHRECOGNITION_H
#define SPEECH_RECOGNITION_MSGS_MESSAGE_SPEECHRECOGNITION_H

#include <ros/service_traits.h>


#include <speech_recognition_msgs/SpeechRecognitionRequest.h>
#include <speech_recognition_msgs/SpeechRecognitionResponse.h>


namespace speech_recognition_msgs
{

struct SpeechRecognition
{

typedef SpeechRecognitionRequest Request;
typedef SpeechRecognitionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SpeechRecognition
} // namespace speech_recognition_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::speech_recognition_msgs::SpeechRecognition > {
  static const char* value()
  {
    return "fa1c2822647ba139ac562b2fdc05f1fb";
  }

  static const char* value(const ::speech_recognition_msgs::SpeechRecognition&) { return value(); }
};

template<>
struct DataType< ::speech_recognition_msgs::SpeechRecognition > {
  static const char* value()
  {
    return "speech_recognition_msgs/SpeechRecognition";
  }

  static const char* value(const ::speech_recognition_msgs::SpeechRecognition&) { return value(); }
};


// service_traits::MD5Sum< ::speech_recognition_msgs::SpeechRecognitionRequest> should match
// service_traits::MD5Sum< ::speech_recognition_msgs::SpeechRecognition >
template<>
struct MD5Sum< ::speech_recognition_msgs::SpeechRecognitionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::speech_recognition_msgs::SpeechRecognition >::value();
  }
  static const char* value(const ::speech_recognition_msgs::SpeechRecognitionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::speech_recognition_msgs::SpeechRecognitionRequest> should match
// service_traits::DataType< ::speech_recognition_msgs::SpeechRecognition >
template<>
struct DataType< ::speech_recognition_msgs::SpeechRecognitionRequest>
{
  static const char* value()
  {
    return DataType< ::speech_recognition_msgs::SpeechRecognition >::value();
  }
  static const char* value(const ::speech_recognition_msgs::SpeechRecognitionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::speech_recognition_msgs::SpeechRecognitionResponse> should match
// service_traits::MD5Sum< ::speech_recognition_msgs::SpeechRecognition >
template<>
struct MD5Sum< ::speech_recognition_msgs::SpeechRecognitionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::speech_recognition_msgs::SpeechRecognition >::value();
  }
  static const char* value(const ::speech_recognition_msgs::SpeechRecognitionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::speech_recognition_msgs::SpeechRecognitionResponse> should match
// service_traits::DataType< ::speech_recognition_msgs::SpeechRecognition >
template<>
struct DataType< ::speech_recognition_msgs::SpeechRecognitionResponse>
{
  static const char* value()
  {
    return DataType< ::speech_recognition_msgs::SpeechRecognition >::value();
  }
  static const char* value(const ::speech_recognition_msgs::SpeechRecognitionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SPEECH_RECOGNITION_MSGS_MESSAGE_SPEECHRECOGNITION_H
