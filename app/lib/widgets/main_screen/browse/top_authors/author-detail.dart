import 'package:app/models/author-provider.dart';
import 'package:app/models/author.dart';
import 'package:app/models/course-provider.dart';
import 'package:app/models/course.dart';
import 'package:app/widgets/customs/expandable.dart';
import 'package:app/widgets/main_screen/home/course-item.dart';
import 'package:provider/provider.dart';
import '../../../customs/text-type.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  static const String routeName='/author';
  final Author author;


  AuthorDetail(this.author);

  @override
  Widget build(BuildContext context) {

    List<Course> _courses=Provider.of<CourseProvider>(context).findCourseByAuthorId(author.id) ;
    return Scaffold(
      appBar: AppBar(title: Text('Author')),
      body:  Container(
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(author.avt),
              ),
              SizedBox(
                height: 8,
              ),
              buildTextHeader(author.name),
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
                child: TextExpandable(author.description),
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
                          HorizontalCourseItem(course: course),
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
      ),
    );
  }
}