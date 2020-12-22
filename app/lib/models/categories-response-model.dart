// To parse this JSON data, do
//
//     final categoriesResponseModel = categoriesResponseModelFromJson(jsonString);

import 'dart:convert';

CategoriesResponseModel categoriesResponseModelFromJson(String str) => CategoriesResponseModel.fromJson(json.decode(str));

String categoriesResponseModelToJson(CategoriesResponseModel data) => json.encode(data.toJson());

class CategoriesResponseModel {
  CategoriesResponseModel({
    this.message,
    this.payload,
  });

  String message;
  List<Category> payload;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => CategoriesResponseModel(
    message: json["message"],
    payload: List<Category>.from(json["payload"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
