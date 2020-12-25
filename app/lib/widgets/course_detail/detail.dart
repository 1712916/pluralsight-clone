import 'dart:convert';
import 'package:app/models/course-with-lesson-response-model.dart';
import 'package:app/models/courses-response-model.dart';

import 'package:app/models/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/payment-services.dart';


import 'package:app/utils/app-color.dart';

import 'package:app/widgets/course_detail/infomation.dart';
import 'package:app/widgets/customs/custom-videoplayer.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../customs/text-type.dart';

class CourseDetail extends StatefulWidget {
  static const routeName = '/course-detail';
  //Data here
  final Course course;
  CourseDetail(this.course);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool isBought = false;
  bool isLoading = false;
  int buyStatus = -1;
  List<Section> sections;
  @override
  Widget build(BuildContext context) {
    String token = Provider.of<LoginProvider>(context).userResponseModel.token;
    (() async {
      Response res = await PaymentServices.getCourseInfo(
          token: token, courseId: this.widget.course.id);
      if (res.statusCode == 200) {
        bool isBoughtStatus = jsonDecode(res.body)["didUserBuyCourse"];
        if (isBoughtStatus) {
          Response res1 = await CourseServices.getDetailWithLesson(
              token: token, courseId: this.widget.course.id);
          if (res1.statusCode == 200) {
            List<Section> a = courseWithLessonResponseModelFromJson(res1.body)
                .payload
                .section;

            setState(() {
              isBought = true;
              sections = a;
            });
          } else {
            setState(() {
              isBought = true;
            });
          }
        }
      }
    })();
    return Scaffold(
      backgroundColor: AppColors.backgroundItemTypeA,
      body: Column(
        children: [
          // Stack(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Colors.blueGrey,
          //       ),
          //       // child: Center(child: Text('Video area')),
          //       child: CustomVideoPlayer(),
          //     ),
          //     // SafeArea(
          //     //     child: IconButton(
          //     //   onPressed: () {
          //     //     Navigator.pop(context);
          //     //   },
          //     //   icon: Icon(Icons.arrow_back_ios),
          //     // ))
          //   ],
          // ),
          CustomVideoPlayer(url: widget.course.promoVidUrl,),
          DefaultTabController(
            length: 2,
            child: Flexible(
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverList(
                          delegate: SliverChildListDelegate(
                              [Information(course: this.widget.course)])),
                    ),
                    isBought
                        ? SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverAppBar(
                              elevation: 0,
                              backgroundColor: AppColors.backgroundItemTypeA,
                              pinned: true,
                              toolbarHeight: 0,
                              bottom: TabBar(
                                tabs: [
                                  Tab(text: "CONTENTS"),
                                  Tab(text: "TRANSCRIPTS"),
                                ],
                              ),
                            ),
                          )
                        : SliverPadding(
                            padding: EdgeInsets.all(0),
                          ),
                  ];
                },
                body: isBought == false
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              (() {
                                if (buyStatus == -1) {
                                  return Container();
                                }
                                if (buyStatus == 400) {
                                  return errorText(
                                      "Người dùng đã từng đăng ký khóa học này hoặc khóa học này không miễn phí");
                                } else {
                                  return errorText("Đã xảy ra lỗi!");
                                }
                              })(),
                              RaisedButton(
                                color: AppColors.secondaryColor,
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Response res =
                                      await PaymentServices.getFreeCourses(
                                          token: token,
                                          courseId: this.widget.course.id);
                                  if (res.statusCode == 200) {
                                    //  if(res.statusCode==200){
                                    //   setState(() {
                                    //     isBought=true;
                                    //   });
                                    // }
                                    setState(() {
                                      isBought = true;
                                    });
                                  } else if (res.statusCode == 400) {
                                    setState(() {
                                      buyStatus = 400;
                                    });
                                  }
                                  buyStatus = res.statusCode;
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                child: isLoading
                                    ? Center(
                                        child: circleLoading(),
                                      )
                                    : Text((() {
                                        if (buyStatus == -1) {
                                          return "JOIN TO THIS COURSE";
                                        }
                                        return "Thử lại";
                                      })()),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TabBarView(
                            children: [
                              sections != null
                                  ? Container(
                                      child: ListView.builder(
                                          itemCount: sections.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                SectionHeader(
                                                  number: index + 1,
                                                  title: sections[index].name,
                                                  hours:
                                                      sections[index].sumHours,
                                                ),
                                                Column(
                                                  children: sections[index]
                                                      .lesson
                                                      .map((e) => LessonItem(
                                                            lesson: e,
                                                          ))
                                                      .toList(),
                                                ),
                                                Divider()
                                              ],
                                            );
                                          }))
                                  : Container(),
                              Container(height: 40, color: Colors.grey),
                            ],
                          ),
                        ),
                      )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final int number;
  final String title;
  final double hours;

  SectionHeader({this.number, this.title, this.hours});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 60,
              color: Colors.grey,
              child: Center(
                child: Text("$number"),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: buildTextTitle(this.title)),
                    buildSubTextTitle(double.parse((hours).toStringAsFixed(3)).toString()+" h")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatefulWidget {
  Lesson lesson;

  LessonItem({this.lesson});
  @override
  _LessonItemState createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isPlay
                    ? Icons.pause_circle_outline_outlined
                    : Icons.play_circle_filled_rounded,
                size: 10,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(child: buildSubTextTitle(this.widget.lesson.name)),
              SizedBox(
                width: 8,
              ),
              buildSubTextTitle(double.parse((widget.lesson.hours).toStringAsFixed(3)).toString()+" h"),
            ],
          ),
        ),
      ),
    );
  }
}
