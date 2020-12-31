// To parse this JSON data, do
//
//     final searchResponseModel = searchResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/shown-course.dart';

SearchResponseModel searchResponseModelFromJson(String str) => SearchResponseModel.fromJson(json.decode(str));

String searchResponseModelToJson(SearchResponseModel data) => json.encode(data.toJson());

class SearchResponseModel {
  SearchResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) => SearchResponseModel(
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
    this.rows,
    this.count,
  });

  List<CourseSearch> rows;
  int count;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    rows: List<CourseSearch>.from(json["rows"].map((x) => CourseSearch.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
    "count": count,
  };
}

class CourseSearch implements ToShownCourse {
  CourseSearch({
    this.title,
    this.id,
    this.price,
    this.description,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.videoNumber,
    this.totalHours,
    this.imageUrl,
    this.updatedAt,
    this.name,
  });

  String title;
  String id;
  int price;
  String description;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  int videoNumber;
  double totalHours;
  String imageUrl;
  DateTime updatedAt;
  String name;

  factory CourseSearch.fromJson(Map<String, dynamic> json) => CourseSearch(
    title: json["title"],
    id: json["id"],
    price: json["price"],
    description: json["description"],
    learnWhat: json["learnWhat"] == null ? null : List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"],
    ratedNumber: json["ratedNumber"],
    formalityPoint: json["formalityPoint"].toDouble(),
    contentPoint: json["contentPoint"] == null ? null : json["contentPoint"].toDouble(),
    presentationPoint: json["presentationPoint"].toDouble(),
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"].toDouble(),
    imageUrl: json["imageUrl"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
    "price": price,
    "description": description,
    "learnWhat": learnWhat == null ? null : List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint == null ? null : contentPoint,
    "presentationPoint": presentationPoint,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "imageUrl": imageUrl,
    "updatedAt": updatedAt.toIso8601String(),
    "name": name,
  };

  @override
  ShownCourse toShownCourse() {
    // TODO: implement toShownCourse
  return ShownCourse(id: this.id,title: this.title,ratedNumber: this.ratedNumber,totalHours: this.totalHours,
  instructorUserName: this.name,imageUrl: this.imageUrl,createdAt: null);
  }
}
