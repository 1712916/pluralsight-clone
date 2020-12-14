import 'package:app/services/user-services.dart';
import 'package:app/utils/constraints.dart';
import 'package:http/http.dart';

Future<Response> getInstructors({String token}) {
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

Future<Response> getInstructorById({String token, String instructorId}) {
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
void main() async {
  var a = await loginService(email: "smile.vinhnt@gmail.com", password: "2");


  var z = getInstructorById(instructorId: "9b068f9b-5efc-418c-8c74-6faddcd8fee0");
  print(z.then((data) => {print(data.body)}, onError: (e) {}));
}
