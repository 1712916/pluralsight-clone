import 'package:app/models/course.dart';
import 'package:flutter/foundation.dart';

class CourseProvider {
  static List<Course> courses=Courses;
  List<CourseCategory> categories=Categories;

  Course getById(String id){
    return courses.firstWhere((element) => element.id==id);
  }
  List<Course> findCoursesByTitle(String title){
    return courses.where((course)=>course.title.toLowerCase().contains(title.toLowerCase())).toList();
  }

  List<Course> findCourseByCategoryId(String id, int size) {

    var data = courses.where((course) => course.categoryId == id).toList();
    if (size == -1 || data.length < size) {
      return data;
    }
    return data.sublist(0, size);
  }


  List<Course> findCourseByAuthorId(String id) {
    var data = courses.where((course) => course.authors.contains(id)).toList();
    return data;
  }



}

class BookmarkProvider extends ChangeNotifier{
  CourseProvider _courseProvider;

  final List<String> _courseIds=[];
  CourseProvider get courseProvider =>_courseProvider;

  set courseProvider(CourseProvider newCourseProvider) {
    assert(newCourseProvider != null);
    assert(_courseIds.every((id) => newCourseProvider.getById(id) != null),
    'The catalog $newCourseProvider does not have one of $_courseIds in it.');
    _courseProvider = newCourseProvider;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of course in the bookmark.
  List<Course> get courses => _courseIds.map((id) => _courseProvider.getById(id)).toList();

  void add(Course course) {
    var condition=_courseIds.indexOf(course.id);
    if(condition>=0){
      _courseIds.remove(course.id);
    }else{
      _courseIds.add(course.id);
    }

    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  bool isInBookmark(String id){
    var condition=_courseIds.indexOf(id);
    return condition>=0?true:false;
  }
}