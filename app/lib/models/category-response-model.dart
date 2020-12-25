// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app/models/categories-response-model.dart';

CategoryResponseModel categoryResponseModelFromJson(String str) => CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  CategoryResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Category payload;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    message: json["message"],
    payload: Category.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": payload.toJson(),
  };
}
