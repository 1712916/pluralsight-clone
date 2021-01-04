import 'dart:convert';
import 'dart:io';

import 'package:app/models/courses-favorite-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/models/info-response-model.dart';
import 'package:app/models/user-response-model.dart';
import 'package:app/utils/constraints.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<Response> doPostRequest({var url_api, var body, var headers}) {
  if (headers == null) {
    headers = {"Content-Type": "application/json"};
  }
  return http.post(url_api, body: body, headers: headers);
}

Future<Response> doGetRequest({var url_api, var headers}) {
  if (headers == null) {
    headers = {"Content-Type": "application/json"};
  }
  return http.get(url_api, headers: headers);
}

Future<Response> doPutRequest({var url_api, var headers, var body}) {
  if (headers == null) {
    headers = {"Content-Type": "application/json"};
  }
  return http.put(url_api, headers: headers, body: body);
}

Future<Response> doDeleteRequest({var url_api, var headers}) {
  if (headers == null) {
    headers = {"Content-Type": "application/json"};
  }
  return http.delete(url_api, headers: headers);
}

class UserServices {
  static Future<Response> registerService(
      {String username, String email, String phone, String password}) {
    return doPostRequest(
        url_api: URL_API + "user/register",
        body: jsonEncode({
          "username": username,
          "email": email,
          "phone": phone,
          "password": password,
        }));
  }

  static Future<Response> loginService({String email, String password}) {
    return doPostRequest(
        url_api: URL_API + "user/login",
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
  }

  static Future<Response> loginGoogleService({String email, String googleId}) {
    return doPostRequest(
        url_api: URL_API + "user/login-google-mobile",
        body: jsonEncode({
          "user": {
            "email": email,
            "id": googleId,
          }
        }));
  }

  static Future<Response> forgotPasswordService({String email}) {
    return doPostRequest(
        url_api: URL_API + "user/forget-pass/send-email",
        body: jsonEncode({
          "email": email,
        }));
  }

  static Future<Response> profileService({String token}) {
    var response = doGetRequest(url_api: URL_API + "user/me", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Response> changePassword(
      {String token, String id, String oldPass, String newPass}) {
    var response = doPostRequest(
        url_api: URL_API + "user/change-password",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"id": id, "oldPass": oldPass, "newPass": newPass}));

    return response;
  }

  static Future<Response> updateProfile(
      {String token, String name, String avatar, String phone}) {
    var response = doPutRequest(
        url_api: URL_API + "user/update-profile",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"name": name, "avatar": avatar, "phone": phone}));

    return response;
  }

  static Future<Response> changeUserEmail({String token, String email}) {
    var response = doPutRequest(
        url_api: URL_API + "user/change-user-email",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "email": email,
        }));

    return response;
    //200 ok
    //400 email đã tồn tại
  }

  static Future<Response> updateFavoriteCategories(
      {String token, List<String> categoryIds}) {
    var response = doPutRequest(
        url_api: URL_API + "user/update-favorite-categories",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "categoryIds": categoryIds,
        }));

    return response;
    //200 ok
    //400 lĩnh vực đã tồn tại
  }

//chưa xong cái recommend
  static Future<Response> recommendCourse({String id, int limit, int offset}) {
    var response = doGetRequest(
      url_api: URL_API + "user/recommend-course/$id/$limit/$offset",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

  static Future<Response> likeCourse({String token, String courseId}) {
    var response = doPostRequest(
        url_api: URL_API + "user/like-course",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "courseId": courseId,
        }));

    return response;
  }

  static Future<Response> getCourseLikeStatus({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "user/get-course-like-status/$courseId",
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

  static Future<Response> getProcessCourses({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "user/get-process-courses",
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

  static Future<Response> getFavoriteCourses({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "user/get-favorite-courses",
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

  static Future<Response> introPage({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "user/intro-page",
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

  static Future<Response> checkOwnCourse({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "user/check-own-course/$courseId",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }
}

void main() async {
  var a = await UserServices.loginService(
      email: "smile.vinhnt@gmail.com", password: "1");
  UserResponseModel userResponseModel = userResponseModelFromJson(a.body);
  print("body: ${userResponseModel.token}");
  var z = await UserServices.getFavoriteCourses(token: userResponseModel.token);
  print(coursesFavoriteResponseModelFromJson(z.body).payload);
}
