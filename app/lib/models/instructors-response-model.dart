// To parse this JSON data, do
//
//     final instructorsResponseModel = instructorsResponseModelFromJson(jsonString);

import 'dart:convert';

InstructorsResponseModel instructorsResponseModelFromJson(String str) => InstructorsResponseModel.fromJson(json.decode(str));

String instructorsResponseModelToJson(InstructorsResponseModel data) => json.encode(data.toJson());

class InstructorsResponseModel {
  InstructorsResponseModel({
    this.message,
    this.payload,
  });

  String message;
  List<AuthorApart> payload;

  factory InstructorsResponseModel.fromJson(Map<String, dynamic> json) => InstructorsResponseModel(
    message: json["message"],
    payload: List<AuthorApart>.from(json["payload"].map((x) => AuthorApart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class AuthorApart {
  AuthorApart({
    this.id,
    this.userId,
    this.major,
    this.intro,
    this.skills,
    this.cumulativeTuition,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String userId;
  String major;
  String intro;
  List<String> skills;
  int cumulativeTuition;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory AuthorApart.fromJson(Map<String, dynamic> json) => AuthorApart(
    id: json["id"],
    userId: json["userId"],
    major: json["major"],
    intro: json["intro"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    cumulativeTuition: json["cumulativeTuition"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "major": major,
    "intro": intro,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "cumulativeTuition": cumulativeTuition,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
