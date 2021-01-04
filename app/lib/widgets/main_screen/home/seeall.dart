 import 'package:app/models/courses-response-model.dart';
import 'package:app/provider/bookmark-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/main_screen/home/course-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../customs/text-type.dart';

// ignore: must_be_immutable
class ListCourse extends StatefulWidget {
  static const String routeName = '/see-all';

  String categoryId;
  String categoryName;
  String title;
  ListCourse({this.categoryId, this.categoryName, this.title});

  @override
  _ListCourseState createState() => _ListCourseState();
}

class _ListCourseState extends State<ListCourse> {
  Future<Response> future;
  List<Course> courses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = CourseServicesFactory.dictonary[widget.title](limit: 20, page: 1);
    future.then(
        (value) => courses = coursesResponseModelFromJson(value.body).courses);
  }

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
              child: buildTextHeader1(widget.title),
            ),
            Expanded(
              child: FutureBuilder(
                future:
                    future ?? Provider.of<BookmarkProvider>(context).courses,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return courses.isEmpty
                        ? Container()
                        : ListView.builder(
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    HorizontalCourseItem(
                                        course: courses[index].toShownCourse()),
                                    Divider(
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              );
                            });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        child: Text("Có lỗi ở server!"),
                      ),
                    );
                  }
                  return Center(child: circleLoading());
                },
              ),
            )
            // Expanded(child: ListView(
            //   children: courses
            //       .map((course) => Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     child: Column(
            //       children: [
            //         HorizontalCourseItem(course: course),
            //
            //         Divider(
            //
            //           color: Colors.grey,
            //         )
            //       ],
            //     ),
            //   ))
            //       .toList(),
            // ), ),
          ],
        ),
      ),
    );
  }
}
