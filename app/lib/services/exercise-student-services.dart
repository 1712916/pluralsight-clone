import 'dart:convert';

import 'package:app/models/course-with-lesson-response-model.dart';
import 'package:app/models/user-response-model.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/user-services.dart';
import 'package:app/utils/constraints.dart';

class ExerciseServices{
  static getListExerciseOfALesson({String token,String lessonId}){
    var response = doPostRequest(
      url_api: URL_API + "exercise/student/list-exercise-lesson",
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
  static submitExercise({String token, String exerciseId, List<Submit> submits}){
    var response = doPostRequest(
        url_api: URL_API + "exercise/student/submit-exercise",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'exerciseId':exerciseId,
          "submits": List<dynamic>.from(submits.map((x) => x.toJson())),
        })

    );

    print("Hellor::: ${jsonEncode({
      'exerciseId':exerciseId,
      "submits": List<dynamic>.from(submits.map((x) => x.toJson())),
    })}");
    return response;
  }
  static  getExerciseQuestion({String token, String exerciseId }){
    var response = doPostRequest(
        url_api: URL_API + "exercise/student/exercise-test",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'exerciseId':exerciseId,
        })

    );
    return response;
  }
}

class Submit{
  String id;
  List<String> answers;
  Submit({this.id, this.answers});
  Map<String, dynamic> toJson() => {
    "id": id,
    "answers": List<dynamic>.from(answers.map((x) => x)),
  };

}
Future<void> main() async {
  // String courseId="7844e73e-f61b-4f1b-82ce-f98f120a7c46";
  //
  var a = await UserServices.loginService(email: "kieuphong2840@gmail.com", password: "123456789");
  UserResponseModel userResponseModel = userResponseModelFromJson(a.body);
  // print("body: ${userResponseModel.token}");
  // var c=await CourseServices.getDetailWithLesson(token: userResponseModel.token,courseId: courseId);
  // CourseWithLessonResponseModel courseWithLessonResponseModel= courseWithLessonResponseModelFromJson(c.body);
  //  print("lesson: ${c.body}");
  // String lessonId="5208d6ea-31f9-4c7e-98be-f1f859f785a7";
  //
  // var b= await ExerciseServices.getListExerciseOfALesson(token: userResponseModel.token,lessonId: lessonId);
  // print("exercise: ${b.body}");
  //
  // List<Submit> submits=[];
  // Submit a=Submit(id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",answers:   [
  //     "3fa85f64-5717-4562-b3fc-2c963f66afa6"
  //     ]);
  // Submit b=Submit(id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",answers:   [
  //   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
  // ]);
  // submits..add(a)..add(b);
  // print(jsonEncode(submits));

  String exeId="df20988d-cb9d-4b1b-82fa-3805c5515c41";
  var c=await ExerciseServices.getExerciseQuestion(token:userResponseModel.token ,exerciseId: exeId);
  print("${c.body}");
}

