import 'package:flutter/foundation.dart';

class DownloadProvider  extends ChangeNotifier{
  bool isDownloading;
  int downloadProgress;

  bool isDownloaded({String userId,String courseId}){
    return false;
  }

}