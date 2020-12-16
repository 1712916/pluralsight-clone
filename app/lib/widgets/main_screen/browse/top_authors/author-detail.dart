
import 'package:app/models/course-provider.dart';
import 'package:app/models/course.dart';
import 'package:app/models/instructor-detail-response-model.dart';
import 'package:app/models/instructors-response-model.dart';
import 'package:app/services/instructor-services.dart';
import 'package:app/widgets/customs/expandable.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/main_screen/home/course-item.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../../customs/text-type.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  static const String routeName='/author';
  final Author author;

  AuthorDetail(this.author);

  @override
  Widget build(BuildContext context) {


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
                backgroundImage: NetworkImage(author.avatar),
              ),
              SizedBox(
                height: 8,
              ),
              buildTextHeader(((){
                return author.name!=null?author.name:'unknown';
              })()),
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
                child: TextExpandable(author.intro),
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
              Container(
                child: Text("Số khóa học của người này là ${author.courses.length}"),
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16),
              //       child: buildTextHeader('Courses'),
              //     ),
              //     SizedBox(
              //       height: 32,
              //     )
              //   ] +
              //       data.payload.courses
              //           .map((course) => Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 16),
              //         child: Column(
              //           children: [
              //             HorizontalCourseItem(course: course),
              //             Divider(
              //               color: Colors.grey,
              //             )
              //           ],
              //         ),
              //       ))
              //           .toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}