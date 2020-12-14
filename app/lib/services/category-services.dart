import '../utils/constraints.dart';
import 'package:http/http.dart';
import './user-services.dart';

Future<Response> getAllCategory({String token}) {
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

Future<Response> getCategoryById({String token,String categoryId}) {
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