import 'package:app/models/instructors-response-model.dart';
import 'package:app/services/user-services.dart';
import 'package:app/utils/constraints.dart';
import 'package:http/http.dart';
class InstructorServices{
   static Future<Response> getInstructors({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "instructor",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

   static Future<Response> getInstructorById({String token, String instructorId}) {
    var response = doGetRequest(
      url_api: URL_API + "instructor/detail/$instructorId",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }
}

void main() async {
  var a = await loginService(email: "smile.vinhnt@gmail.com", password: "2");


  var z = InstructorServices.getInstructors();
  print(z.then((data) => {print(instructorsResponseModelFromJson(data.body).payload[1].intro)}, onError: (e) {}));
}
