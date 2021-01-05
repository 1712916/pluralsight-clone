// To parse this JSON data, do
//
//     final exerciseQuestionResponseModel = exerciseQuestionResponseModelFromJson(jsonString);

import 'dart:convert';

ExerciseQuestionResponseModel exerciseQuestionResponseModelFromJson(String str) => ExerciseQuestionResponseModel.fromJson(json.decode(str));

String exerciseQuestionResponseModelToJson(ExerciseQuestionResponseModel data) => json.encode(data.toJson());

class ExerciseQuestionResponseModel {
  ExerciseQuestionResponseModel({
    this.message,
    this.payload,
  });

  String message;
  Payload payload;

  factory ExerciseQuestionResponseModel.fromJson(Map<String, dynamic> json) => ExerciseQuestionResponseModel(
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
    this.exercises,
  });

  Exercises exercises;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    exercises: Exercises.fromJson(json["exercises"]),
  );

  Map<String, dynamic> toJson() => {
    "exercises": exercises.toJson(),
  };
}

class Exercises {
  Exercises({
    this.id,
    this.title,
    this.time,
    this.lessonId,
    this.courseId,
    this.exercisesQuestions,
  });

  String id;
  String title;
  int time;
  String lessonId;
  String courseId;
  List<ExercisesQuestion> exercisesQuestions;

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
    id: json["id"],
    title: json["title"],
    time: json["time"],
    lessonId: json["lessonId"],
    courseId: json["courseId"],
    exercisesQuestions: List<ExercisesQuestion>.from(json["exercises_questions"].map((x) => ExercisesQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "time": time,
    "lessonId": lessonId,
    "courseId": courseId,
    "exercises_questions": List<dynamic>.from(exercisesQuestions.map((x) => x.toJson())),
  };
}

class ExercisesQuestion {
  ExercisesQuestion({
    this.id,
    this.content,
    this.isMultipleChoice,
    this.contentHtml,
    this.exercisesAnswers,
  });

  String id;
  String content;
  bool isMultipleChoice;
  String contentHtml;
  List<ExercisesAnswer> exercisesAnswers;

  factory ExercisesQuestion.fromJson(Map<String, dynamic> json) => ExercisesQuestion(
    id: json["id"],
    content: json["content"],
    isMultipleChoice: json["isMultipleChoice"],
    contentHtml: json["contentHtml"],
    exercisesAnswers: List<ExercisesAnswer>.from(json["exercises_answers"].map((x) => ExercisesAnswer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "isMultipleChoice": isMultipleChoice,
    "contentHtml": contentHtml,
    "exercises_answers": List<dynamic>.from(exercisesAnswers.map((x) => x.toJson())),
  };
}

class ExercisesAnswer {
  ExercisesAnswer({
    this.id,
    this.content,
  });

  String id;
  String content;

  factory ExercisesAnswer.fromJson(Map<String, dynamic> json) => ExercisesAnswer(
    id: json["id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
  };
}
