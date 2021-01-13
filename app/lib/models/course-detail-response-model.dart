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

class Instructor {
  Instructor({
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
  dynamic intro;
  List<String> skills;
  DateTime createdAt;
  DateTime updatedAt;
  int totalCourse;
  double averagePoint;
  int countRating;
  int ratedNumber;
  int soldNumber;
  List<Course> courses;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
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
    averagePoint: json["averagePoint"].toDouble(),
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



class CoursesLikeCategory {
  CoursesLikeCategory({
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
    this.isHidden,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.typeUploadVideoLesson,
    this.instructorName,
    this.averagePoint,
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
  double totalHours;
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  bool isHidden;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  int typeUploadVideoLesson;
  String instructorName;
  double averagePoint;

  factory CoursesLikeCategory.fromJson(Map<String, dynamic> json) => CoursesLikeCategory(
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
    totalHours: json["totalHours"].toDouble(),
    formalityPoint: json["formalityPoint"].toDouble(),
    contentPoint: json["contentPoint"].toDouble(),
    presentationPoint: json["presentationPoint"].toDouble(),
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    status: json["status"],
    isHidden: json["isHidden"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    typeUploadVideoLesson: json["typeUploadVideoLesson"],
    instructorName: json["instructorName"],
    averagePoint: json["averagePoint"].toDouble(),
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
    "isHidden": isHidden,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "typeUploadVideoLesson": typeUploadVideoLesson,
    "instructorName": instructorName,
    "averagePoint": averagePoint,
  };
}

class Ratings {
  Ratings({
    this.ratingList,
    this.stars,
  });

  List<RatingList> ratingList;
  List<int> stars;

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
    ratingList: List<RatingList>.from(json["ratingList"].map((x) => RatingList.fromJson(x))),
    stars: List<int>.from(json["stars"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ratingList": List<dynamic>.from(ratingList.map((x) => x.toJson())),
    "stars": List<dynamic>.from(stars.map((x) => x)),
  };
}

class RatingList {
  RatingList({
    this.id,
    this.userId,
    this.courseId,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.averagePoint,
  });

  String id;
  String userId;
  String courseId;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  int averagePoint;

  factory RatingList.fromJson(Map<String, dynamic> json) => RatingList(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    formalityPoint: json["formalityPoint"],
    contentPoint: json["contentPoint"],
    presentationPoint: json["presentationPoint"],
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    user: User.fromJson(json["user"]),
    averagePoint: json["averagePoint"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "courseId": courseId,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "content": content,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "user": user.toJson(),
    "averagePoint": averagePoint,
  };
}

class User {
  User({
    this.id,
    this.email,
    this.password,
    this.avatar,
    this.name,
    this.favoriteCategories,
    this.point,
    this.phone,
    this.type,
    this.facebookId,
    this.googleId,
    this.isDeleted,
    this.isActivated,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String email;
  String password;
  String avatar;
  String name;
  List<dynamic> favoriteCategories;
  int point;
  String phone;
  String type;
  dynamic facebookId;
  String googleId;
  bool isDeleted;
  bool isActivated;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    avatar: json["avatar"],
    name: json["name"],
    favoriteCategories: List<dynamic>.from(json["favoriteCategories"].map((x) => x)),
    point: json["point"],
    phone: json["phone"],
    type: json["type"],
    facebookId: json["facebookId"],
    googleId: json["googleId"],
    isDeleted: json["isDeleted"],
    isActivated: json["isActivated"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "avatar": avatar,
    "name": name,
    "favoriteCategories": List<dynamic>.from(favoriteCategories.map((x) => x)),
    "point": point,
    "phone": phone,
    "type": type,
    "facebookId": facebookId,
    "googleId": googleId,
    "isDeleted": isDeleted,
    "isActivated": isActivated,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Section {
  Section({
    this.id,
    this.courseId,
    this.numberOrder,
    this.name,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.lesson,
    this.sumHours,
    this.sumLessonFinish,
  });

  String id;
  String courseId;
  int numberOrder;
  String name;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  List<Lesson> lesson;
  double sumHours;
  int sumLessonFinish;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    courseId: json["courseId"],
    numberOrder: json["numberOrder"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    lesson: List<Lesson>.from(json["lesson"].map((x) => Lesson.fromJson(x))),
    sumHours: json["sumHours"].toDouble(),
    sumLessonFinish: json["sumLessonFinish"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseId": courseId,
    "numberOrder": numberOrder,
    "name": name,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "lesson": List<dynamic>.from(lesson.map((x) => x.toJson())),
    "sumHours": sumHours,
    "sumLessonFinish": sumLessonFinish,
  };
}

class Lesson {
  Lesson({
    this.id,
    this.courseId,
    this.sectionId,
    this.numberOrder,
    this.name,
    this.content,
    this.videoName,
    this.videoUrl,
    this.captionName,
    this.hours,
    this.isPreview,
    this.isPublic,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String courseId;
  String sectionId;
  int numberOrder;
  String name;
  dynamic content;
  String videoName;
  dynamic videoUrl;
  dynamic captionName;
  double hours;
  bool isPreview;
  bool isPublic;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    courseId: json["courseId"],
    sectionId: json["sectionId"],
    numberOrder: json["numberOrder"],
    name: json["name"],
    content: json["content"],
    videoName: json["videoName"],
    videoUrl: json["videoUrl"],
    captionName: json["captionName"],
    hours: json["hours"].toDouble(),
    isPreview: json["isPreview"],
    isPublic: json["isPublic"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseId": courseId,
    "sectionId": sectionId,
    "numberOrder": numberOrder,
    "name": name,
    "content": content,
    "videoName": videoName,
    "videoUrl": videoUrl,
    "captionName": captionName,
    "hours": hours,
    "isPreview": isPreview,
    "isPublic": isPublic,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
