import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final Dio _dio = Dio();
final String _fileUrl = "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4";
final String _fileName = "DSCF0277.mp4";
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
Future<Directory> getDownloadDirectory() async {
  if (Platform.isAndroid) {
    return await DownloadsPathProvider.downloadsDirectory;
  }

  // in this example we are using only Android and iOS so I can assume
  // that you are not trying it for other platforms and the if statement
  // for iOS is unnecessary

  // iOS directory visible to user
  return await getApplicationDocumentsDirectory();
}
Future<void> _onSelectNotification(String json,BuildContext context) async {
  final obj = jsonDecode(json);

  if (obj['isSuccess']) {
    OpenFile.open(obj['filePath']);
  } else {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('${obj['error']}'),
      ),
    );
  }
}
Future<void> startDownload(String url,String savePath) async {
  Map<String, dynamic> result = {
    'isSuccess': false,
    'filePath': null,
    'error': null,
  };

  try {
    final response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: _onReceiveProgress
    );
    result['isSuccess'] = response.statusCode == 200;
    result['filePath'] = savePath;
  } catch (ex) {
    result['error'] = ex.toString();
    print("${ex.toString()}");
  }{
    print("down load xong!!!");
  }

}
void _onReceiveProgress(int received, int total) {
  if (total != -1) {
    // setState(() {
    //   _progress = (received / total * 100).toStringAsFixed(0) + "%";
    // });
  }
}
Future<bool> requestPermissions() async {
  var status = await Permission.storage.status;
  if (status.isUndetermined||status.isDenied) {
    final result = await Permission.storage.request();
    print(result);
    if (result == PermissionStatus.granted) {
      return true;
    }else {
      return false;
    }
  }
  return true;
}

Future<void> download(List<String> urls, List<String> fileName) async {


  final dir = await  getDownloadDirectory();
  final isPermissionStatusGranted = await requestPermissions();

  if (isPermissionStatusGranted) {
    for(int i=0;i<urls.length;i++){
      final savePath = path.join(dir.path, fileName[i]);
      await startDownload(urls[i],savePath);
    }
  } else {
    // handle the scenario when user declines the permissions
  }
}
Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
  final android = AndroidNotificationDetails(
    'channel id',
    'channel name',
    'channel description',
    priority: Priority.High,
    importance: Importance.Max,

  );

  final iOS = IOSNotificationDetails();
  final platform = NotificationDetails(android, iOS);
  final json = jsonEncode(downloadStatus);
  final isSuccess = downloadStatus['isSuccess'];

  await flutterLocalNotificationsPlugin.show(
    0, // notification id
    isSuccess ? 'Success' : 'Failure',
    isSuccess ? 'File has been downloaded successfully!' : 'There was an error while downloading the file.',
    platform,
    payload: json,

  );
}