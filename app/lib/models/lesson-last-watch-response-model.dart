// To parse this JSON data, do
//
//     final lessonLastWatchResponseModel = lessonLastWatchResponseModelFromJson(jsonString);

import 'dart:convert';

LessonLastWatchResponseModel lessonLastWatchResponseModelFromJson(String str) => LessonLastWatchResponseModel.fromJson(json.decode(str));

String lessonLastWatchResponseModelToJson(LessonLastWatchResponseModel data) => json.encode(data.toJson());

class LessonLastWatchResponseModel {
  LessonLastWatchResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory LessonLastWatchResponseModel.fromJson(Map<String, dynamic> json) => LessonLastWatchResponseModel(
    message: json["message"],
    payload: Payload.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": payload.toJson(),
  };
}

class Payload {
  Payload({
    this.lessonId,
    this.videoUrl,
    this.currentTime,
    this.isFinish,
  });

  String lessonId;
  String videoUrl;
  double currentTime;
  bool isFinish;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    lessonId: json["lessonId"],
    videoUrl: json["videoUrl"],
    currentTime: json["currentTime"].toDouble(),
    isFinish: json["isFinish"],
  );

  Map<String, dynamic> toJson() => {
    "lessonId": lessonId,
    "videoUrl": videoUrl,
    "currentTime": currentTime,
    "isFinish": isFinish,
  };
}
