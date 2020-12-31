// To parse this JSON data, do
//
//     final searchV2ResponseModel = searchV2ResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/search-response-model.dart';

SearchV2ResponseModel searchV2ResponseModelFromJson(String str) => SearchV2ResponseModel.fromJson(json.decode(str));

String searchV2ResponseModelToJson(SearchV2ResponseModel data) => json.encode(data.toJson());

class SearchV2ResponseModel {
  SearchV2ResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory SearchV2ResponseModel.fromJson(Map<String, dynamic> json) => SearchV2ResponseModel(
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
    this.courses,
    this.instructors,
  });

  Courses courses;
  Instructors instructors;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    courses: Courses.fromJson(json["courses"]),
    instructors: Instructors.fromJson(json["instructors"]),
  );

  Map<String, dynamic> toJson() => {
    "courses": courses.toJson(),
    "instructors": instructors.toJson(),
  };
}

class Courses {
  Courses({
    this.data,
    this.totalInPage,
    this.total,
  });

  List<CourseSearch> data;
  int totalInPage;
  int total;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    data: List<CourseSearch>.from(json["data"].map((x) => CourseSearch.fromJson(x))),
    totalInPage: json["totalInPage"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalInPage": totalInPage,
    "total": total,
  };
}



class Instructors {
  Instructors({
    this.data,
    this.totalInPage,
    this.total,
  });

  List<InstructorsDatum> data;
  int totalInPage;
  int total;

  factory Instructors.fromJson(Map<String, dynamic> json) => Instructors(
    data: List<InstructorsDatum>.from(json["data"].map((x) => InstructorsDatum.fromJson(x))),
    totalInPage: json["totalInPage"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalInPage": totalInPage,
    "total": total,
  };
}

class InstructorsDatum {
  InstructorsDatum({
    this.id,
    this.name,
    this.avatar,
    this.numcourses,
  });

  String id;
  String name;
  String avatar;
  String numcourses;

  factory InstructorsDatum.fromJson(Map<String, dynamic> json) => InstructorsDatum(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    numcourses: json["numcourses"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "numcourses": numcourses,
  };
}
