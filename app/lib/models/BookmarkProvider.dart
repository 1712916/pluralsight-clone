
import 'package:app/models/course-detail-response-model.dart';
import 'package:app/services/course-services.dart';
import 'package:flutter/foundation.dart';

import 'courses-response-model.dart';

class BookmarkProvider extends ChangeNotifier{
  List<String> courseIds=[];

  /// List of course in the bookmark.
  Future<List<Course>> get courses   async {
    List<Course> courses=[];
    for(var i=0;i<courseIds.length;i++){
      Future<Course> course=  (()  async {
        var response= await CourseServices.getCourseInfo(courseId: courseIds[i]);
        return courseDetailResponseModelFromJson(response.body).payload;
      })();
      await course.then((value) => courses.add(value));
    }
    return courses;
  }

  void add(String  id) {
    var condition=courseIds.indexOf(id);
    if(condition>=0){
      courseIds.remove(id);
    }else{
      courseIds.add(id);
    }
    notifyListeners();
  }

  bool isInBookmark(String id){
    var condition=courseIds.indexOf(id);
    return condition>=0?true:false;
  }
}

Future<void> main() async {
  var bookmark=BookmarkProvider();
  bookmark.courses.then((value) => print("data: ${value.length}"));
  print(bookmark.courseIds);



}
