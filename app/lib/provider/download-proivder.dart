import 'package:app/models/courses-response-model.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/sqlite/download-course.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class DownloadProvider  extends ChangeNotifier{
  bool isDownloading=false;
  int downloadProgress=0;
  String courseTitle="Hello";
  CourseSQL courseSQL;

  DownloadProvider(){
    courseSQL=new CourseSQL(databaseName: CourseSQL.database_name);
    courseSQL.open();

  }
  Future<List> getAllData({String userId}){
    return courseSQL.getData(userId);
  }
  void removeAllData(){
    courseSQL.cleanDatabase();
    notifyListeners();
  }
  void changeToLoading(){
    isDownloading=true;
    notifyListeners();
  }
  void changeToStop(){
    isDownloading=false;
    notifyListeners();
  }
  Future<bool> isDownloaded({String userId,String courseId}){

    return courseSQL.findOne(userId: userId,id: courseId);

  }

}