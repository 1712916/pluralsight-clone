// To parse this JSON data, do
//
//     final coursePaymentResponseModel = coursePaymentResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/shown-course.dart';

CoursePaymentResponseModel coursePaymentResponseModelFromJson(String str) => CoursePaymentResponseModel.fromJson(json.decode(str));

String coursePaymentResponseModelToJson(CoursePaymentResponseModel data) => json.encode(data.toJson());

class CoursePaymentResponseModel {
  CoursePaymentResponseModel({
    this.message,
    this.payload,
  });

  String message;
  List<Payload> payload;

  factory CoursePaymentResponseModel.fromJson(Map<String, dynamic> json) => CoursePaymentResponseModel(
    message: json["message"],
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class Payload  implements ToShownCourse {
  Payload({
    this.paymentMethod,
    this.createdAt,
    this.payloadCourseId,
    this.payloadCourseTitle,
    this.payloadCoursePrice,
    this.instructorId,
    this.instructorName,
    this.courseId,
    this.courseTitle,
    this.coursePrice,
    this.courseInstructorId,
    this.courseInstructorUserId,
    this.courseInstructorUserName,
  });

  String paymentMethod;
  DateTime createdAt;
  String payloadCourseId;
  String payloadCourseTitle;
  int payloadCoursePrice;
  String instructorId;
  String instructorName;
  String courseId;
  String courseTitle;
  int coursePrice;
  String courseInstructorId;
  String courseInstructorUserId;
  String courseInstructorUserName;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    paymentMethod: json["paymentMethod"],
    createdAt: DateTime.parse(json["createdAt"]),
    payloadCourseId: json["courseId"],
    payloadCourseTitle: json["courseTitle"],
    payloadCoursePrice: json["coursePrice"],
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    courseId: json["course.id"],
    courseTitle: json["course.title"],
    coursePrice: json["course.price"],
    courseInstructorId: json["course.instructor.id"],
    courseInstructorUserId: json["course.instructor.user.id"],
    courseInstructorUserName: json["course.instructor.user.name"],
  );

  Map<String, dynamic> toJson() => {
    "paymentMethod": paymentMethod,
    "createdAt": createdAt.toIso8601String(),
    "courseId": payloadCourseId,
    "courseTitle": payloadCourseTitle,
    "coursePrice": payloadCoursePrice,
    "instructorId": instructorId,
    "instructorName": instructorName,
    "course.id": courseId,
    "course.title": courseTitle,
    "course.price": coursePrice,
    "course.instructor.id": courseInstructorId,
    "course.instructor.user.id": courseInstructorUserId,
    "course.instructor.user.name": courseInstructorUserName,
  };

  @override
  ShownCourse toShownCourse() {
    return ShownCourse(price: this.coursePrice,ratedNumber: null,totalHours: null,instructorUserName:this.instructorName ,imageUrl: null,createdAt:this.createdAt ,id:this.courseId ,title: this.courseTitle);
  }


}
