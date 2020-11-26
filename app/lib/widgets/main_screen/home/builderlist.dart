import 'package:app/models/course-provider.dart';
import 'package:app/models/course.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../customs/text-type.dart';
import 'course-item.dart';

class BuilderList extends StatelessWidget {
  @required
  final CourseCategory category;
  List<Course> courses;

  BuilderList({this.category, this.courses});


  Widget buildList(BuildContext context) {
    var coursesProvider=Provider.of<CourseProvider>(context);
    return !courses.isEmpty?Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTextHeader(this.category.title),
            TextButton(
                onPressed: () {
                  List<Course> data = coursesProvider.findCourseByCategoryId(this.category.id, -1);
                  //truyen data vao navigte
                  //goi navigate here
                  // Navigator.pushNamed(context, CourseDetail.routeName,
                  //     arguments: widget.course.title);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListCourse(
                                categoryName: this.category.title,
                                  courses: data,
                              )));
                },
                child: Text(
                  'See all >',
                  style: TextStyle(color: Colors.white38),
                )),
          ],
        ),
      ),
      Center(
          child: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: courses
              .map((course) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: VerticalCourseItem(course: course),
                  ))
              .toList(),
        ),
      )),
      SizedBox(
        height: 20,
      )
    ]):SizedBox(height: 0,);
  }

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }


}

class BuilderListBookmark extends BuilderList {
  BuilderListBookmark(List<Course> data)
      : super(category: CourseCategory(title: 'Bookmark'), courses: data);

}

class BuilderListMyPath extends BuilderList {
  BuilderListMyPath(List<Course> data)
      : super(category: CourseCategory(title: 'My Paths'), courses: data);

  @override
  List<Course> searchAll() {
    //find by
    return null;
  }
}
