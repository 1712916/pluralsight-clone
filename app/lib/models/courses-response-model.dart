// To parse this JSON data, do
//
//     final coursesResponseModel = coursesResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/shown-course.dart';

CoursesResponseModel coursesResponseModelFromJson(String str) => CoursesResponseModel.fromJson(json.decode(str));

String coursesResponseModelToJson(CoursesResponseModel data) => json.encode(data.toJson());

class CoursesResponseModel {
  CoursesResponseModel({
    this.message,
    this.courses,
  });

  String message;
  List<Course> courses;

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) => CoursesResponseModel(
    message: json["message"],
    courses: List<Course>.from(json["payload"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class Course implements ToShownCourse{
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
    this.isHidden,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.typeUploadVideoLesson,
    this.instructorUserId,
    this.instructorUserName,
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
  Status status;
  bool isHidden;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  int typeUploadVideoLesson;
  String instructorUserId;
  String instructorUserName;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: ((){
      if(json["title"]!=null){
        return json["title"];
      }else if(json["courseTitle"]!=null){
        return json["courseTitle"];
      }
      return null;
    })(),
    subtitle: json["subtitle"]??null,
    price:
      ((){
      if(json["price"]!=null){
        return json["price"];
      }else if(json["coursePrice"]!=null){
        return json["coursePrice"];
      }
      return null;
    })(),
    description: json["description"],
    requirement: json["requirement"] == null ? null : List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: json["learnWhat"] == null ? null :List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber:
      ((){
      if(json["soldNumber"]!=null){
        return json["soldNumber"];
      }else if(json["courseSoldNumber"]!=null){
        return json["courseSoldNumber"];
      }
      return null;
    })(),
    ratedNumber:
      ((){
      if(json["ratedNumber"]!=null){
        return json["ratedNumber"];
      }else if(json["courseRatedNumber"]!=null){
        return json["courseRatedNumber"];
      }
      return null;
    })(),
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"]==null?null:json["totalHours"].toDouble(),
    formalityPoint:
    ((){
      if(json["formalityPoint"]!=null){
        return json["formalityPoint"].toDouble();
      }else if(json["courseFormalityPoint"]!=null){
        return json["courseFormalityPoint"].toDouble();
      }
      return null;
    })(),
    contentPoint: ((){
      if(json["contentPoint"]!=null){
        return json["contentPoint"].toDouble();
      }else if(json["courseContentPoint"]!=null){
        return json["courseContentPoint"].toDouble();
      }
      return null;
    })(),
    presentationPoint:  ((){
      if(json["presentationPoint"]!=null){
        return json["presentationPoint"].toDouble();
      }else if(json["coursePresentationPoint"]!=null){
        return json["coursePresentationPoint"].toDouble();
      }
      return null;
    })(),
    imageUrl:
      ((){
      if(json["imageUrl"]!=null){
        return json["imageUrl"];
      }else if(json["courseImage"]!=null){
        return json["courseImage"];
      }
      return null;
    })(),
    promoVidUrl: json["promoVidUrl"] == null ? null : json["promoVidUrl"],
    status: statusValues.map[json["status"]],
    isHidden: json["isHidden"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"]==null?null:DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"]==null?null:DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    typeUploadVideoLesson: json["typeUploadVideoLesson"],
    instructorUserId: json["instructor.user.id"],
    instructorUserName:  ((){
      if(json["instructor.user.name"]!=null){
       return json["instructor.user.name"];
      }else if(json["instructorName"]!=null){
        return json["instructorName"];
      }
      return null;
    })(),
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
    "status": statusValues.reverse[status],
    "isHidden": isHidden,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "typeUploadVideoLesson": typeUploadVideoLesson,
    "instructor.user.id": instructorUserId,
    "instructor.user.name": instructorUserName,
  };

  @override
  ShownCourse toShownCourse() {
    // TODO: implement toShownCourse
    return ShownCourse(id: this.id,title: this.title,createdAt: this.createdAt,imageUrl: this.imageUrl,
    instructorUserName: this.instructorUserName,totalHours: this.totalHours,ratedNumber: this.ratedNumber,price: this.price);
  }


}

enum Status { COMPLETED }

final statusValues = EnumValues({
  "COMPLETED": Status.COMPLETED
});

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
