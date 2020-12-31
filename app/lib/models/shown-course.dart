class ShownCourse{
  String id;
  String imageUrl;
  String  title;
  String instructorUserName;
  DateTime createdAt;
  double totalHours;
  int ratedNumber;

  ShownCourse({this.id, this.imageUrl, this.title, this.instructorUserName,
    this.createdAt, this.totalHours, this.ratedNumber});
}

class ToShownCourse{
  ShownCourse toShownCourse(){}
}