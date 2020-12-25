// To parse this JSON data, do
//
//     final courseDetailResponseModel = courseDetailResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/courses-response-model.dart';

CourseDetailResponseModel courseDetailResponseModelFromJson(String str) => CourseDetailResponseModel.fromJson(json.decode(str));

String courseDetailResponseModelToJson(CourseDetailResponseModel data) => json.encode(data.toJson());

class CourseDetailResponseModel {
  CourseDetailResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Course payload;

  factory CourseDetailResponseModel.fromJson(Map<String, dynamic> json) => CourseDetailResponseModel(
    message: json["message"],
    payload: Course.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": payload.toJson(),
  };
}
