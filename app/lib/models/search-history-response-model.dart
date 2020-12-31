// To parse this JSON data, do
//
//     final searchHistoryResponseModel = searchHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

SearchHistoryResponseModel searchHistoryResponseModelFromJson(String str) => SearchHistoryResponseModel.fromJson(json.decode(str));

String searchHistoryResponseModelToJson(SearchHistoryResponseModel data) => json.encode(data.toJson());

class SearchHistoryResponseModel {
  SearchHistoryResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory SearchHistoryResponseModel.fromJson(Map<String, dynamic> json) => SearchHistoryResponseModel(
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
    this.data,
  });

  List<HistoryContent> data;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    data: List<HistoryContent>.from(json["data"].map((x) => HistoryContent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class HistoryContent {
  HistoryContent({
    this.id,
    this.content,
  });

  String id;
  String content;

  factory HistoryContent.fromJson(Map<String, dynamic> json) => HistoryContent(
    id: json["id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
  };
}
