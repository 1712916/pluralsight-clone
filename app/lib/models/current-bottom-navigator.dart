import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CurrentBottomNavigatorProvider with ChangeNotifier{
  int currentIndex=0;

  void update(int index) {
    currentIndex=index;
    notifyListeners();
  }
}