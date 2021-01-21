import 'package:app/models/course-detail-response-model.dart';
import 'package:app/models/course-payment-response-model.dart';
import 'package:app/models/courses-favorite-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/models/search-response-model.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/payment-services.dart';
import 'package:app/services/user-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/widgets/cards/course-item.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  final String title;
  final String route;
  final String type;
  final String img;
  final String categoryId;
  const MyButton(
      {Key key, this.title, this.route, this.type, this.img, this.categoryId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img == null ? 'assets/bg.jpg' : img),
          fit: BoxFit.cover,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuggestionCourse(
                    title: title, type: type, categoryId: categoryId),
              ));
        },
        child: Text(
          this.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SuggestionCourse extends StatefulWidget {
  final String title;
  final String type;
  final String categoryId;

  SuggestionCourse({this.title, this.type, this.categoryId});

  @override
  _SuggestionCourseState createState() => _SuggestionCourseState();
}

class _SuggestionCourseState extends State<SuggestionCourse> {
  List<Course> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future future;
    if (widget.type == "CATEGORY") {
      future =
          CourseServices.search(categories: [widget.categoryId], keyword: "");
    } else if (widget.type == "RECOMMEND") {

      future = CourseServicesFactory.dictonary2["RECOMMEND"](
          limit: 20,
          offset: 1,
          id: Provider.of<LoginProvider>(context)
              .userResponseModel
              .userInfo
              .id);
    } else if (widget.type == "LIKED") {

      future = UserServices.getFavoriteCourses(
          token: Provider.of<LoginProvider>(context).userResponseModel.token);
    } else if (widget.type == "YOUR COURSE") {
      future = PaymentServices.getOwnCourse(
          token: Provider.of<LoginProvider>(context).userResponseModel.token);
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
              ),
              SafeArea(
                  child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
              Container(
                  height: 160,
                  child: Center(child: buildTextHeader1(widget.title))),
            ],
          ),
          FutureBuilder<Response>(
              future: future,
              builder:
                  (BuildContext context, AsyncSnapshot<Response> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: (() {
                        if (widget.type == "RECOMMEND") {
                          print("RECOMMEND ${ snapshot.data.body}");
                          return coursesResponseModelFromJson(
                                  snapshot.data.body)
                              .courses
                              .map((e) => Column(
                                    children: [
                                      HorizontalCourseItem(
                                        course: e.toShownCourse(),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  ))
                              .toList();
                        } else if (widget.type == "LIKED") {
                          return coursesFavoriteResponseModelFromJson(
                                  snapshot.data.body)
                              .payload
                              .map((e) => Column(
                                    children: [
                                      HorizontalCourseItem(
                                        course: e.toShownCourse(),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  ))
                              .toList();
                        } else if (widget.type == "CATEGORY") {
                          return searchResponseModelFromJson(snapshot.data.body)
                              .payload
                              .rows
                              .map((e) => Column(
                                    children: [
                                      HorizontalCourseItem(
                                        course: e.toShownCourse(),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  ))
                              .toList();
                        } else if (widget.type == "YOUR COURSE") {
                          return coursePaymentResponseModelFromJson(snapshot.data.body)
                              .payload
                              .map((e) => Column(
                            children: [
                              HorizontalCourseItem(
                                course: e.toShownCourse(),
                              ),
                              Divider(
                                color: Colors.grey,
                              )
                            ],
                          ))
                              .toList();
                        }
                      })(),
                    ),
                  );
                }
                return Center(
                  child: circleLoading(),
                );
              })
          //build list
        ],
      ),
    ));
  }
}
