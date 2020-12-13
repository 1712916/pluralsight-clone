import 'package:app/models/user-response-model.dart';
import 'package:flutter/foundation.dart';
class LoginProvider with ChangeNotifier {
  bool isLogin=false;
  UserResponseModel userResponseModel;

  void changeState(){
    isLogin=!isLogin;
    notifyListeners();
  }

  void setUserResponse(UserResponseModel userResponseModel){
    this.userResponseModel=userResponseModel;
  }
}