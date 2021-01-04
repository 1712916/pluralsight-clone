import 'dart:convert';

import 'package:app/models/course-with-lesson-response-model.dart';
import 'package:app/models/user-response-model.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/user-services.dart';
import 'package:app/utils/constraints.dart';

class ExerciseServices{
  static getListExcerciseOfALesson({String token,String lessonId}){
    var response = doPostRequest(
      url_api: URL_API + "excercise/student/list-excercise-lesson",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
        body: jsonEncode({
          'lessonId':lessonId
        })

    );
    return response;
  }
}

Future<void> main() async {
  String courseId="7844e73e-f61b-4f1b-82ce-f98f120a7c46";

  var a = await UserServices.loginService(email: "smile.vinhnt@gmail.com", password: "1");
  UserResponseModel userResponseModel = userResponseModelFromJson(a.body);
  print("body: ${userResponseModel.token}");
  var c=await CourseServices.getDetailWithLesson(token: userResponseModel.token,courseId: courseId);
  CourseWithLessonResponseModel courseWithLessonResponseModel= courseWithLessonResponseModelFromJson(c.body);
   print("lesson: ${c.body}");
  String lessonId="5208d6ea-31f9-4c7e-98be-f1f859f785a7";

  var b= await ExerciseServices.getListExcerciseOfALesson(token: userResponseModel.token,lessonId: lessonId);
  print("exercise: ${b.body}");
}

