// To parse this JSON data, do
//
//     final courseResponseAllData = courseResponseAllDataFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/course-with-lesson-response-model.dart';

CourseResponseAllData courseResponseAllDataFromJson(String str) => CourseResponseAllData.fromJson(json.decode(str));

String courseResponseAllDataToJson(CourseResponseAllData data) => json.encode(data.toJson());

class CourseResponseAllData {
  CourseResponseAllData({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory CourseResponseAllData.fromJson(Map<String, dynamic> json) => CourseResponseAllData(
    message: json["message"],
    payload: Payload.fromJson(json["payload"]),
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
  String intro;
  List<String> skills;
  DateTime createdAt;
  DateTime updatedAt;
  int totalCourse;
  double averagePoint;
  int countRating;
  int ratedNumber;
  int soldNumber;
  List<Payload> courses;

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
    courses: List<Payload>.from(json["courses"].map((x) => Payload.fromJson(x))),
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

class Payload {
  Payload({
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
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.typeUploadVideoLesson,
    this.section,
    this.ratings,
    this.averagePoint,
    this.instructor,
    this.coursesLikeCategory,
  });

  String id;
  String title;
  String subtitle;
  int price;
  String description;
  dynamic requirement;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  int videoNumber;
  double totalHours;
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  String imageUrl;
  dynamic promoVidUrl;
  String status;
  bool isHidden;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  int typeUploadVideoLesson;
  List<Section> section;
  Ratings ratings;
  String averagePoint;
  Instructor instructor;
  List<CoursesLikeCategory> coursesLikeCategory;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    price: json["price"],
    description: json["description"],
    requirement: json["requirement"],
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"],
    ratedNumber: json["ratedNumber"],
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"].toDouble(),
    formalityPoint: json["formalityPoint"].toDouble(),
    contentPoint: json["contentPoint"] == null ? null : json["contentPoint"].toDouble(),
    presentationPoint: json["presentationPoint"].toDouble(),
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    status: json["status"],
    isHidden: json["isHidden"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    typeUploadVideoLesson: json["typeUploadVideoLesson"],
    section: json["section"] == null ? null : List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
    ratings: json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
    averagePoint: json["averagePoint"] == null ? null : json["averagePoint"],
    instructor: json["instructor"] == null ? null : Instructor.fromJson(json["instructor"]),
    coursesLikeCategory: json["coursesLikeCategory"] == null ? null : List<CoursesLikeCategory>.from(json["coursesLikeCategory"].map((x) => CoursesLikeCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "price": price,
    "description": description,
    "requirement": requirement,
    "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint == null ? null : contentPoint,
    "presentationPoint": presentationPoint,
    "imageUrl": imageUrl,
    "promoVidUrl": promoVidUrl,
    "status": status,
    "isHidden": isHidden,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "typeUploadVideoLesson": typeUploadVideoLesson,
    "section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
    "ratings": ratings == null ? null : ratings.toJson(),
    "averagePoint": averagePoint == null ? null : averagePoint,
    "instructor": instructor == null ? null : instructor.toJson(),
    "coursesLikeCategory": coursesLikeCategory == null ? null : List<dynamic>.from(coursesLikeCategory.map((x) => x.toJson())),
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
    requirement: json["requirement"] == null ? null : List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"],
    ratedNumber: json["ratedNumber"],
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"].toDouble(),
    formalityPoint: json["formalityPoint"].toDouble(),
    contentPoint: json["contentPoint"]==null?null:json["contentPoint"].toDouble(),
    presentationPoint: json["presentationPoint"].toDouble(),
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"] == null ? null : json["promoVidUrl"],
    status: json["status"],
    isHidden: json["isHidden"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    typeUploadVideoLesson: json["typeUploadVideoLesson"],
    instructorName: json["instructorName"],
    averagePoint: json["averagePoint"]==null?null:json["averagePoint"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "price": price,
    "description": description,
    "requirement": requirement == null ? null : List<dynamic>.from(requirement.map((x) => x)),
    "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "imageUrl": imageUrl,
    "promoVidUrl": promoVidUrl == null ? null : promoVidUrl,
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
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  double averagePoint;

  factory RatingList.fromJson(Map<String, dynamic> json) => RatingList(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    formalityPoint: json["formalityPoint"].toDouble(),
    contentPoint: json["contentPoint"].toDouble(),
    presentationPoint: json["presentationPoint"].toDouble(),
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    user: User.fromJson(json["user"]),
    averagePoint: json["averagePoint"].toDouble(),
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
  List<String> favoriteCategories;
  int point;
  String phone;
  Type type;
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
    favoriteCategories: List<String>.from(json["favoriteCategories"].map((x) => x)),
    point: json["point"],
    phone: json["phone"],
    type: typeValues.map[json["type"]],
    facebookId: json["facebookId"],
    googleId: json["googleId"] == null ? null : json["googleId"],
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
    "type": typeValues.reverse[type],
    "facebookId": facebookId,
    "googleId": googleId == null ? null : googleId,
    "isDeleted": isDeleted,
    "isActivated": isActivated,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Type { INSTRUCTOR, STUDENT }

final typeValues = EnumValues({
  "INSTRUCTOR": Type.INSTRUCTOR,
  "STUDENT": Type.STUDENT
});



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
  String content;
  dynamic videoName;
  String videoUrl;
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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
