import 'dart:convert';

import 'package:app/services/user-services.dart';
import 'package:app/utils/constraints.dart';
import 'package:http/http.dart';

class LessonServices{
  static  Future<Response> getLessonDetail({String token,String courseId,String lessonId}) {
    var response = doGetRequest(
      url_api: URL_API + "lesson/detail/$courseId/$lessonId",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  static  Future<Response> getVideoProgress({String token,String courseId,String lessonId}) {
    var response = doGetRequest(
      url_api: URL_API + "lesson/video/$courseId/$lessonId",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  static  Future<Response> getSubTitle({String token,String courseId,String lessonId}) {
    var response = doGetRequest(
      url_api: URL_API + "lesson/subtitle/$courseId/$lessonId",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
  static  Future<Response> getSubTitleUrl({String token,String courseId,String lessonId}) {
    var response = doGetRequest(
      url_api: URL_API + "lesson/subtitle-url/$courseId/$lessonId",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
  static  Future<Response> updateStatus({String token,String lessonId}) {
    var response = doPostRequest(
      url_api: URL_API + "lesson/update-status",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "lessonId" :lessonId
      })
    );
    return response;
  }
  static  Future<Response> updateCurrentTimeLearnVideo({String token,String lessonId,int currentTime}) {
    var response = doPostRequest(
        url_api: URL_API + "lesson/update-status",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "lessonId" :lessonId,
          "currentTime" :currentTime
        })
    );
    return response;
  }

}