import 'package:app/downloads/item.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/Expandable.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  static const String routeName='/author';
  final Author _author;
  final List<Course> _courses = Courses;

  AuthorDetail(this._author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Author')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(this._author.avt),
            ),
            SizedBox(
              height: 8,
            ),
            buildTextHeader(this._author.name),
            SizedBox(
              height: 8,
            ),
            Text('Pluralsight Author'),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FlatButton(
                onPressed: () {},
                minWidth: double.infinity,
                child: Text('FOLLOW'),
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            buildSubTextTitle(
                'Follow t be notified when new courses are published.'),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextExpandable(this._author.description),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.tag_faces_sharp),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    child: Icon(Icons.tag_faces_sharp),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    child: Icon(Icons.tag_faces_sharp),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 32,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: buildTextHeader('Courses'),
                    ),
                    SizedBox(
                      height: 32,
                    )
                  ] +
                  _courses
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
            ),
          ],
        ),
      ),
    );
  }
}
