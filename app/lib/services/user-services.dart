import 'dart:convert';
import 'dart:io';

import 'package:app/models/info-response-model.dart';
import 'package:app/models/user-response-model.dart';
import 'package:app/utils/constraints.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<Response> doPostService({var url_api, var body, var headers}) {
  if (headers == null) {
    headers = {"Content-Type": "application/json"};
  }
  return http.post(url_api, body: body, headers: headers);
}
Future<Response> doGetService({var url_api, var headers}) {
  if (headers == null) {
    headers = {"Content-Type": "application/json"};
  }
  return http.get(url_api, headers: headers);
}

Future<Response> registerService(
    {String username, String email, String phone, String password}) {
  return doPostService(
      url_api: URL_API + "user/register",
      body: jsonEncode({
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      }));
}

Future<Response> loginService({String email, String password}) {
  return doPostService(
      url_api: URL_API + "user/login",
      body: jsonEncode({
        "email": email,
        "password": password,
      }));
}

Future<Response> loginGoogleService({String email, String googleId}) {
  return doPostService(
      url_api: URL_API + "user/login-google-mobile",
      body: jsonEncode({
        "user": {
          "email": email,
          "id": googleId,
        }
      }));
}

Future<Response> forgotPasswordService({String email}) {
  return doPostService(
      url_api: URL_API + "user/forget-pass/send-email",
      body: jsonEncode({
        "email": email,
      }));
}

Future<Response> profileService({String token})  {
  var response=   doGetService(url_api: URL_API + "user/me",headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
   });

  return response;

}

void main() async{
  var a=await loginService(email: "smile.vinhnt@gmail.com",password: "1");
  UserResponseModel userResponseModel=userResponseModelFromJson(a.body);
 print("body: ${userResponseModel.token}");
 var z=profileService(token: userResponseModel.token);
 print(z.then((data) => {
  print(data.body)
 },onError: (e){

 }));
}