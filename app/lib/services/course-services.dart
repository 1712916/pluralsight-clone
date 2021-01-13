import 'dart:convert';
import 'package:app/models/user-response-model.dart';
import 'package:app/services/lesson-services.dart';
import '../utils/constraints.dart';
import 'package:http/http.dart';
import './user-services.dart';
class CourseServicesFactory{
  static Map dictonary={
    "TOP NEW":CourseServices.getTopNew,
    "TOP SELL":CourseServices.getTopSell,
    "TOP RATE":CourseServices.getTopRate,
  };
  static Map dictonary2={
    "FAVORITE":CourseServices.getByFavoriteCategories,
    "RECOMMEND": UserServices.recommendCourse,
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
      url_api: URL_API + "course/get-course-info?id=$courseId",
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
        double formalityPoint,
        double contentPoint,
        double presentationPoint,
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
        body: jsonEncode({
          "courseId": courseId,
          "content": content,
          "subject": subject
        })
    );
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }

//chuwa xong search
  static Future<Response> search({String token, String keyword,List<String> categories}) {
    var response = doPostRequest(
        url_api: URL_API + "course/search",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "keyword": keyword,
          "opt": {
            "sort": {
              "attribute": "price",
              "rule": "ASC"
            },
            "category": categories,
            "time": [
              {
                "min": 0,
                "max": 1
              },
              {
                "min": 3,
                "max": 6
              }
            ],
            "price": [
              {
                "max": 0
              },
              {
                "min": 0,
                "max": 200000
              },
              {
                "min": 500000,
                "max": 1000000
              }
            ]
          },
          "limit": 10,
          "offset": 1
        }
        )
    );
    return response;
    //200
    //400 lĩnh vực đã tồn tại
  }
  static Future<Response> searchV2({String token, String courseId,String keyword}) {
    var response = doPostRequest(
        url_api: URL_API + "course/searchV2",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "token": token,
          "keyword": keyword,
          "limit": 10,
          "offset": 1
        })
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
void main() async{

  // String courseId="486a0f3e-09f7-4b4d-a140-7cee4c60be41";
  // var a = await UserServices.loginService(email: "kieuphong2840@gmail.com", password: "123456789");
  // UserResponseModel userResponseModel = userResponseModelFromJson(a.body);
  // print("id: ${userResponseModel.userInfo.id}");
  // var c=await LessonServices.getVideoProgress(courseId: courseId, token: userResponseModel.token,lessonId: "98896765-1041-4179-b404-03c78f9ff65a");
  // print("data ${c.body}");
  //userID="

  // print(CourseDownload(id:courseId,userId: userResponseModel.userInfo.id,data:d.payload).toMap());

  //  PaymentServices.getOwnCourse(token:userResponseModel.token ).then((value) => print(value.body));

}

// void main() async{
//   print("Hello");
//   String courseId="5b69ea4b-ef3c-4ab5-b9fb-2ec50c03f849";
//   List<String> categories=[  "847dce36-f43b-4714-982d-e65812b40b5e","4eb0c150-8212-44ef-a90b-fcd40130ac01"];
//   //
//   //   var c=await CourseServices.getCourseDetail(courseId: courseId);
//   // print("body 0: ${c.body}");
//
//   //    // "4eb0c150-8212-44ef-a90b-fcd40130ac01"
//   // //String courseId="7844e73e-f61b-4f1b-82ce-f98f120a7c46";
//   var a = await UserServices.loginService(email: "smile.vinhnt@gmail.com", password: "1");
//   UserResponseModel userResponseModel = userResponseModelFromJson(a.body);
//   print("body: ${userResponseModel.token}");
//   PaymentServices.getOwnCourse(token:userResponseModel.token ).then((value) => print(value.body));
//   // print("List 1: ${userResponseModel.userInfo.favoriteCategories}");
//   // var e=await UserServices.updateFavoriteCategories(token: userResponseModel.token,categoryIds: categories);
//   // var b= await CourseServices.searchV2(token: userResponseModel.token,keyword: "data");
//   // print("data: ${b.body}");
//   // var res1= await  PaymentServices.getFreeCourses(token:userResponseModel.token ,courseId: courseId);
//   // var res= await  CourseServices.search(categories: [],keyword: "Di động");
//  //  var response = await  CourseServices.getCourseDetail(courseId: courseId ,userId: userResponseModel.userInfo.id);
//  // // print("Data: ${courseDetailResponseModelFromJson(  response.body )}");
//  //   Course course=Course.fromJson(jsonDecode(response.body)["payload"]);
//  //  // print("Data: ${course.id}");
//
//   //var response = await CourseServices.search(keyword: "data");
//
//   //List<SearchItem> searchItems=searchResponseModelFromJson(response.body).payload.rows;
//   // print("lengt: ${searchItems.length}");
//   // // Course course=Course.fromJson(searchItems[0].toJson());
//   // print(searchItems[0].toJson());
//   //
//   //   var response= await UserServices.getFavoriteCourses(token: userResponseModel.token);
//   //   print("DATA : ${coursesResponseModelFromJson(response.body).courses[0].title}");
//   // print("course is : ${courseDetailResponseModelFromJson(response.body).payload.title}");
//
// }