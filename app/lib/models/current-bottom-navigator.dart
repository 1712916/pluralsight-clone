import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CurrentBottomNavigatorProvider with ChangeNotifier{
  int currentIndex=0;
  bool isHidden=false;
  void changeHidden(bool value){
    isHidden=value;
    notifyListeners();
  }

  void update(int index) {
    currentIndex=index;
    notifyListeners();
  }
}