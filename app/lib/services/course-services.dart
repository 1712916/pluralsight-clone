import 'dart:convert';

import 'package:app/models/courses-response-model.dart';

import '../utils/constraints.dart';
import 'package:http/http.dart';
import './user-services.dart';
class CourseServicesFactory{
  static Map dictonary={
    "TOP NEW":CourseServices.getTopNew ,
    "TOP SELL":CourseServices.getTopSell ,
    "TOP RATE":CourseServices.getTopRate ,
    "FAVORITE":CourseServices.getByFavoriteCategories,
  };
}

class CourseServices{

  static Future<Response> getTotalCourse({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "course/total-number",
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

  static Future<Response> getTopSell({String token, int limit, int page}) {
    var response = doPostRequest(
        url_api: URL_API + "course/top-sell",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"limit": limit, "page": page}));
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

  static Future<Response> getTopNew({String token, int limit, int page}) {
    var response = doPostRequest(
        url_api: URL_API + "course/top-new",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"limit": limit, "page": page}));
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

  static  Future<Response> getTopRate({String token, int limit, int page}) {
    var response = doPostRequest(
        url_api: URL_API + "course/top-rate",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"limit": limit, "page": page}));
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

  static Future<Response> getByFavoriteCategories({String token, String userId}) {
    var response = doPostRequest(
        url_api: URL_API + "course/courses-user-favorite-categories",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "userId": userId,
        }));
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

  static Future<Response> getCourseInfo({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "course/get-course-info/$courseId",
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

  static Future<Response> getCourseDetail(
      {String token, String courseId, String userId}) {
    var response = doGetRequest(
      url_api: URL_API + "course/get-course-detail/$courseId/$userId",
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

  static Future<Response> getDetailWithLesson({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "course/detail-with-lesson/$courseId",
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

  static Future<Response> getProcessCourse({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "course/process-course/$courseId",
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

  static Future<Response> getLastWatchedLesson({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "course/last-watched-lesson/$courseId",
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

  static Future<Response> ratingCourse(
      {String token,
        String courseId,
        int formalityPoint,
        int contentPoint,
        int presentationPoint,
        String content}) {
    var response = doPostRequest(
        url_api: URL_API + "course/rating-course",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "courseId": courseId,
          "formalityPoint": formalityPoint,
          "contentPoint": contentPoint,
          "presentationPoint": presentationPoint,
          "content": content
        }));
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }


  static Future<Response> getRating({String token, String courseId}) {
    var response = doGetRequest(
      url_api: URL_API + "course/get-rating/$courseId",
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
  static Future<Response> reportCourse({String token, String courseId,String content,String subject}) {
    var response = doPostRequest(
        url_api: URL_API + "course/report-course",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({{
          "courseId": courseId,
          "content": content,
          "subject": subject
        }})
    );
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

//chuwa xong search
  static Future<Response> search({String token, String courseId,String content,String subject}) {
    var response = doPostRequest(
        url_api: URL_API + "course/search",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({{
          "courseId": courseId,
          "content": content,
          "subject": subject
        }})
    );
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }
  static Future<Response> searchV2({String token, String courseId,String content,String subject}) {
    var response = doPostRequest(
        url_api: URL_API + "course/searchV2",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({{
          "courseId": courseId,
          "content": content,
          "subject": subject
        }})
    );
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }
  static Future<Response> getSearchHistory({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "course/search-history",
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
  static Future<Response> deleteSearchHistory({String token,String historyId}) {
    var response = doDeleteRequest(
      url_api: URL_API + "course/delete-search-history/$historyId",
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

main(){
  var res=CourseServices.getTotalCourse();
  res.then((value) => print(value.body));
}