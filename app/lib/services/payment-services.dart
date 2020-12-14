import 'dart:convert';

import '../utils/constraints.dart';
import 'package:http/http.dart';
import './user-services.dart';

Future<Response> getFreeCourses({String token,String courseId}) {
  var response = doPostRequest(
    url_api: URL_API + "payment/get-free-courses",
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      "courseId":courseId
    })
  );
  return response;
  //200
  //400 lĩnh vực đã tồn tại
}

Future<Response> getCourseInfo({String token,String courseId}) {
  var response =  doGetRequest(
    url_api: URL_API + "payment/get-course-info/$courseId",
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