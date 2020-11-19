import 'package:app/models/acount.dart';
import 'package:flutter/foundation.dart';
class LoginProvider with ChangeNotifier {
  bool isLogin=false;
  Acount acount;

  void changeState(){
    isLogin=!isLogin;
    notifyListeners();
  }
}