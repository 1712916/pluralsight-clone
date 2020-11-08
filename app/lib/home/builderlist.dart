import 'package:app/home/seeall.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class BuilderList extends StatelessWidget {
  @required
  final Category category;
  List<Course> data;

  BuilderList({this.category, this.data});
  List<Course> searchAll() {
    return findCourseByCategoryId(category.id, -1);
  }

  Widget buildList(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTextHeader(this.category.title),
            TextButton(
                onPressed: () {
                  List<Course> data = this.searchAll();
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
          children: data
              .map((course) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CourseItemTypeA(course: course),
                  ))
              .toList(),
        ),
      )),
      SizedBox(
        height: 20,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }
}

class BuilderListBookmark extends BuilderList {
  BuilderListBookmark(List<Course> data)
      : super(category: Category(title: 'Bookmark'), data: data);

  @override
  List<Course> searchAll() {
    //find by
    return findCourseByBookmark(-1);
  }
}

class BuilderListMyPath extends BuilderList {
  BuilderListMyPath(List<Course> data)
      : super(category: Category(title: 'My Paths'), data: data);

  @override
  List<Course> searchAll() {
    //find by
    return null;
  }
}
