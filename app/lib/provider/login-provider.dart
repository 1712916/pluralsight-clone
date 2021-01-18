import 'package:app/models/courses-response-model.dart';
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
    notifyListeners();
    print("Token: ${userResponseModel.token}");
  }
  void addNewFavoriteCategory(String id){
    if(this.userResponseModel.userInfo.favoriteCategories.contains(id)){
      this.userResponseModel.userInfo.favoriteCategories.remove(id);
    }else{
      this.userResponseModel.userInfo.favoriteCategories.add(id);
    }

  }


}