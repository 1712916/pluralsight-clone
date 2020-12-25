import 'courses-response-model.dart';

class DataCourseItem{
  String id;
  String img;
  int rate;
  String title;
  String authorName;
  DateTime createdAt;
  double totalHours;
  Status status;
}

class GetDataForItem{
  DataCourseItem getDataForItem(){}
}