// To parse this JSON data, do
//
//     final instructorDetailResponseModel = instructorDetailResponseModelFromJson(jsonString);

import 'dart:convert';

InstructorDetailResponseModel instructorDetailResponseModelFromJson(String str) => InstructorDetailResponseModel.fromJson(json.decode(str));

String instructorDetailResponseModelToJson(InstructorDetailResponseModel data) => json.encode(data.toJson());

class InstructorDetailResponseModel {
  InstructorDetailResponseModel({
    this.author,
  });

  Author author;

  factory InstructorDetailResponseModel.fromJson(Map<String, dynamic> json) => InstructorDetailResponseModel(
    author: Author.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "payload": author.toJson(),
  };
}

class Author {
  Author({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.avatar,
    this.phone,
    this.major,
    this.intro,
    this.skills,
    this.createdAt,
    this.updatedAt,
    this.totalCourse,
    this.averagePoint,
    this.countRating,
    this.ratedNumber,
    this.soldNumber,
    this.courses,
  });

  String id;
  String userId;
  String name;
  String email;
  String avatar;
  String phone;
  String major;
  String intro;
  List<String> skills;
  DateTime createdAt;
  DateTime updatedAt;
  int totalCourse;
  int averagePoint;
  int countRating;
  int ratedNumber;
  int soldNumber;
  List<Course> courses;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    userId: json["userId"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    phone: json["phone"],
    major: json["major"],
    intro: json["intro"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    totalCourse: json["totalCourse"],
    averagePoint: json["averagePoint"],
    countRating: json["countRating"],
    ratedNumber: json["ratedNumber"],
    soldNumber: json["soldNumber"],
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "name": name,
    "email": email,
    "avatar": avatar,
    "phone": phone,
    "major": major,
    "intro": intro,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "totalCourse": totalCourse,
    "averagePoint": averagePoint,
    "countRating": countRating,
    "ratedNumber": ratedNumber,
    "soldNumber": soldNumber,
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.requirement,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.isDeleted,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.typeUploadVideoLesson,
  });

  String id;
  String title;
  String subtitle;
  int price;
  String description;
  List<String> requirement;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  int videoNumber;
  int totalHours;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  bool isDeleted;
  bool isHidden;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  int typeUploadVideoLesson;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    price: json["price"],
    description: json["description"],
    requirement: List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"],
    ratedNumber: json["ratedNumber"],
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"],
    formalityPoint: json["formalityPoint"],
    contentPoint: json["contentPoint"],
    presentationPoint: json["presentationPoint"],
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    isHidden: json["isHidden"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    typeUploadVideoLesson: json["typeUploadVideoLesson"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "price": price,
    "description": description,
    "requirement": List<dynamic>.from(requirement.map((x) => x)),
    "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "imageUrl": imageUrl,
    "promoVidUrl": promoVidUrl,
    "status": status,
    "isDeleted": isDeleted,
    "isHidden": isHidden,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "typeUploadVideoLesson": typeUploadVideoLesson,
  };
}
