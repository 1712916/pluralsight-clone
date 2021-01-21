import 'package:app/models/instructor-detail-response-model.dart';

import 'package:app/widgets/customs/expandable.dart';

import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/widgets/cards/course-item.dart';

import '../../../customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AuthorDetail extends StatelessWidget {
  static const String routeName = '/author';
  final Instructor author;
  AuthorDetail(this.author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( AppLocalizations.of(context).author)),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(author.avatar),
              ),
              SizedBox(
                height: 8,
              ),
              buildTextHeader((() {
                return author.name != null ? author.name : 'unknown';
              })()),
              SizedBox(
                height: 8,
              ),
              Text('MeowSight Author'),
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
              SubTitle(
                  'Follow t be notified when new courses are published.'),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextExpandable(author.intro),
              ),
              SizedBox(
                height: 8,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         child: Icon(Icons.tag_faces_sharp),
              //         onTap: () {},
              //       ),
              //       SizedBox(
              //         width: 16,
              //       ),
              //       GestureDetector(
              //         child: Icon(Icons.tag_faces_sharp),
              //         onTap: () {},
              //       ),
              //       SizedBox(
              //         width: 16,
              //       ),
              //       GestureDetector(
              //         child: Icon(Icons.tag_faces_sharp),
              //         onTap: () {},
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 32,
              ),

              author.courses.length==0?Text("Chưa có khóa học."): Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: buildTextHeader('Courses (${author.courses.length})'),
                      ),
                      SizedBox(
                        height: 32,
                      )
                    ] +
                    author.courses
                        .map((course) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  HorizontalCourseItem(
                                    course: (() {
                                      course.instructorUserName = author.name;
                                      return course.toShownCourse();
                                    })(),
                                  ),
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
