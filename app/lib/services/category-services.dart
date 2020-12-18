import 'dart:convert';

import 'package:app/models/categories-response-model.dart';

import '../utils/constraints.dart';
import 'package:http/http.dart';
import './user-services.dart';
class CategoryServices{

  static Future<Response> getAllCategory({String token}) {
    var response = doGetRequest(
      url_api: URL_API + "category/all",
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

  static Future<Response> getCategoryById({String token,String categoryId}) {
    var response =  doGetRequest(
      url_api: URL_API + "category/$categoryId",
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
  var response=CategoryServices.getAllCategory();
  response.then((value) => print(jsonDecode(value.body)["payload"][0]["id"]));
}