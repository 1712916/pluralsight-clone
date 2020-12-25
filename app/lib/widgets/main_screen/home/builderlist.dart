
import 'package:app/models/courses-favorite-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/utils/constraints.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';


import '../../customs/text-type.dart';
import 'course-item.dart';

class BuilderListHorizontal extends StatelessWidget {
  @required
  final String title;
  final List<Course> courses;


  BuilderListHorizontal({this.title,this.courses});


  Widget buildList(BuildContext context) {

    return courses.isNotEmpty?Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTextHeader(this.title),
            TextButton(
                onPressed: () {
                  //truyen data vao navigte
                  //goi navigate here
                  // Navigator.pushNamed(context, CourseDetail.routeName,
                  //     arguments: widget.course.title);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListCourse(
                                 title: title,
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
        height: heightVertical,
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

// class BuilderListBookmark extends BuilderList {
//   @override
//   BuilderListBookmark(List<Course> data)
//       : super(category: CourseCategory(title: 'Bookmarks'), courses: data);
//
// }
//
// class BuilderListMyPath extends BuilderList {
//   BuilderListMyPath(List<Course> data)
//       : super(category: CourseCategory(title: 'My Paths'), courses: data);
//
//   @override
//   List<Course> searchAll() {
//     //find by
//     return null;
//   }
// }

