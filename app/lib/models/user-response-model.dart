// To parse this JSON data, do
//
//     final userResponseModel = userResponseModelFromJson(jsonString);

import 'dart:convert';

UserResponseModel userResponseModelFromJson(String str) => UserResponseModel.fromJson(json.decode(str));

String userResponseModelToJson(UserResponseModel data) => json.encode(data.toJson());

class UserResponseModel {
  UserResponseModel({
    this.message,
    this.userInfo,
    this.token,
  });

  String message;
  UserInfo userInfo;
  String token;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
    message: json["message"],
    userInfo: UserInfo.fromJson(json["userInfo"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userInfo": userInfo.toJson(),
    "token": token,
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.email,
    this.avatar,
    this.name,
    this.favoriteCategories,
    this.point,
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
  int point;
  String phone;
  String type;
  bool isDeleted;
  bool isActivated;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    email: json["email"],
    avatar: json["avatar"],
    name: json["name"],
    favoriteCategories: List<String>.from(json["favoriteCategories"].map((x) => x)),
    point: json["point"],
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
    "point": point,
    "phone": phone,
    "type": type,
    "isDeleted": isDeleted,
    "isActivated": isActivated,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}



UserProfileResponse userProfileResponseFromJson(String str) => UserProfileResponse.fromJson(json.decode(str));

String userProfileResponseToJson(UserProfileResponse data) => json.encode(data.toJson());

class UserProfileResponse {
  UserProfileResponse({
    this.message,
    this.userInfo,
  });

  String message;
  UserInfo userInfo;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => UserProfileResponse(
    message: json["message"],
    userInfo: UserInfo.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": userInfo.toJson(),
  };
}
