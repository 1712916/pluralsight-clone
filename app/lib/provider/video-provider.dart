
import 'package:flutter/material.dart';

class VideoProvider with ChangeNotifier {

  String videoUrl="";
  String lessonId="";
  double currentTime=0;

  void changeUrl({String url,String lessonId,double currentTime}){
    this.videoUrl=url;
    this.lessonId=lessonId;
    this.currentTime=currentTime;
    notifyListeners();
  }
  void clear(){
    this.videoUrl="";
    this.lessonId="";
    this.currentTime=0;
  }

}