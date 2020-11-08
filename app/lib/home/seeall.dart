import 'package:app/downloads/item.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCourse extends StatelessWidget {
  static const String routeName='/see-all';

  final String categoryName;
  final List<Course> courses;


  ListCourse({this.categoryName, this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.all(16),
              height: 70,
              child: buildTextHeader1(categoryName),
            ),
            Expanded(child: ListView(
              children: courses
                  .map((course) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CourseItemTypeB(course: course),

                    Divider(

                      color: Colors.grey,
                    )
                  ],
                ),
              ))
                  .toList(),
            ), )


          ],
        ),
      ),
    );
  }
}
