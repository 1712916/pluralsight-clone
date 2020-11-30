import 'package:app/models/account.dart';
import 'package:flutter/foundation.dart';
class LoginProvider with ChangeNotifier {
  bool isLogin=false;
  Account account=MyAccount;

  void changeState(){
    isLogin=!isLogin;
    notifyListeners();
  }
}