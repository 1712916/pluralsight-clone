
import 'package:flutter/material.dart';

class VideoProvider with ChangeNotifier {

  String videoUrl="";

  void changeUrl(String url){
    videoUrl=url;
    print("current url: $videoUrl");
    notifyListeners();
  }

}