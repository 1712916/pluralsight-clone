// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
  Info({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
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
    this.id,
    this.email,
    this.avatar,
    this.name,
    this.favoriteCategories,
    this.phone,
    this.type,
    this.isDeleted,
    this.isActivated,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String email;
  String avatar;
  String name;
  List<String> favoriteCategories;
  String phone;
  String type;
  bool isDeleted;
  bool isActivated;
  DateTime createdAt;
  DateTime updatedAt;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    email: json["email"],
    avatar: json["avatar"],
    name: json["name"],
    favoriteCategories: List<String>.from(json["favoriteCategories"].map((x) => x)),
    phone: json["phone"],
    type: json["type"],
    isDeleted: json["isDeleted"],
    isActivated: json["isActivated"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "avatar": avatar,
    "name": name,
    "favoriteCategories": List<dynamic>.from(favoriteCategories.map((x) => x)),
    "phone": phone,
    "type": type,
    "isDeleted": isDeleted,
    "isActivated": isActivated,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}