// To parse this JSON data, do
//
//     final coursesFavoriteResponseModel = coursesFavoriteResponseModelFromJson(jsonString);

import 'dart:convert';

CoursesFavoriteResponseModel coursesFavoriteResponseModelFromJson(String str) => CoursesFavoriteResponseModel.fromJson(json.decode(str));

String coursesFavoriteResponseModelToJson(CoursesFavoriteResponseModel data) => json.encode(data.toJson());

class CoursesFavoriteResponseModel {
  CoursesFavoriteResponseModel({
    this.message,
    this.payload,
  });

  String message;
  List<Payload> payload;

  factory CoursesFavoriteResponseModel.fromJson(Map<String, dynamic> json) => CoursesFavoriteResponseModel(
    message: json["message"],
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class Payload {
  Payload({
    this.id,
    this.courseTitle,
    this.coursePrice,
    this.courseImage,
    this.instructorId,
    this.instructorName,
    this.courseSoldNumber,
    this.courseContentPoint,
    this.courseFormalityPoint,
    this.coursePresentationPoint,
    this.courseAveragePoint,
  });

  String id;
  String courseTitle;
  int coursePrice;
  String courseImage;
  String instructorId;
  String instructorName;
  int courseSoldNumber;
  double courseContentPoint;
  double courseFormalityPoint;
  double coursePresentationPoint;
  double courseAveragePoint;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    courseTitle: json["courseTitle"],
    coursePrice: json["coursePrice"],
    courseImage: json["courseImage"],
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    courseSoldNumber: json["courseSoldNumber"],
    courseContentPoint: json["courseContentPoint"].toDouble(),
    courseFormalityPoint: json["courseFormalityPoint"].toDouble(),
    coursePresentationPoint: json["coursePresentationPoint"].toDouble(),
    courseAveragePoint: json["courseAveragePoint"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseTitle": courseTitle,
    "coursePrice": coursePrice,
    "courseImage": courseImage,
    "instructorId": instructorId,
    "instructorName": instructorName,
    "courseSoldNumber": courseSoldNumber,
    "courseContentPoint": courseContentPoint,
    "courseFormalityPoint": courseFormalityPoint,
    "coursePresentationPoint": coursePresentationPoint,
    "courseAveragePoint": courseAveragePoint,
  };
}
