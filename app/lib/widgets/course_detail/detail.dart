// class CourseDetail extends StatefulWidget {
//   static const routeName = '/course-detail';
//   final Course course;
//   CourseDetail({this.course});
//   @override
//   _CourseDetailState createState() => _CourseDetailState();
// }
//
// class _CourseDetailState extends State<CourseDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Text("Hello"),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:app/models/course-response-all-data.dart';
import 'package:app/models/course-with-lesson-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/provider/video-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/payment-services.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/course_detail/infomation.dart';
import 'package:app/widgets/course_detail/lesson.dart';
import 'package:app/widgets/customs/custom-videoplayer.dart';
import 'package:app/widgets/customs/custom-youtube-videoplayer.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class CourseDetail extends StatefulWidget {
  static const routeName = '/course-detail';
  //Data here
  final Course course;
  CourseDetail({this.course});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool isBought = false;
  bool isLoading = false;
  int buyStatus = -1;
  List<Section> sections = [];
  String token = "";
  String currentVideo = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = Provider.of<LoginProvider>(context, listen: false)
        .userResponseModel
        .token;

    Provider.of<VideoProvider>(context, listen: false)
        .changeUrl(widget.course.promoVidUrl);

    PaymentServices.getCourseInfo(token: token, courseId: this.widget.course.id)
        .then((value) {
      if (value.statusCode == 200) {
        bool isBoughtStatus = jsonDecode(value.body)["didUserBuyCourse"];
        if (isBoughtStatus) {
          CourseServices.getDetailWithLesson(
                  token: token, courseId: this.widget.course.id)
              .then((value2) {
            if (value2.statusCode == 200) {
              List<Section> sectionsResponse =
                  courseWithLessonResponseModelFromJson(value2.body)
                      .payload
                      .section;
            setState(() {
              isBought = true;
              sections = sectionsResponse;
            });

            } else {
              setState(() {
                isBought = true;

              });
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundCardCourse,
      body: Column(
        children: [
          checkYoutubeUrl(Provider.of<VideoProvider>(context).videoUrl)
              ? new CustomYoutubeVideoPlayer(
                  youtube_url: Provider.of<VideoProvider>(context).videoUrl,
                )
              : new CustomVideoPlayer(
                  url: Provider.of<VideoProvider>(context).videoUrl,
                ),

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
                              backgroundColor:
                                  AppColors.darkBackgroundCardCourse,
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
