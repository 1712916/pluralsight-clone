import 'dart:convert';

import 'package:app/models/course-detail-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/models/shown-course.dart';
import 'package:app/provider/bookmark-provider.dart';
import 'package:app/provider/download-proivder.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/provider/theme-provider.dart';
import 'package:app/provider/video-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/sqlite/download-course.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/customs/label.dart';
import 'package:app/widgets/customs/rating-star.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:app/models/courses-response-model.dart' as myCourse;
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../customs/text-type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line
class VerticalCourseItem extends StatefulWidget {
  final myCourse.Course course;

  VerticalCourseItem({this.course});

  @override
  _VerticalCourseItemState createState() => _VerticalCourseItemState();
}

class _VerticalCourseItemState extends State<VerticalCourseItem> {
  List<String> _choices = ["","",""];


  @override
  void initState() {
  //  setChoiceSetting();
    super.initState();
  }
  setChoiceSetting ()async{

    setState(() {
      _choices[0] = Provider.of<BookmarkProvider>(context, listen: false)
          .isInBookmark(this.widget.course.id)
          ? AppLocalizations.of(context).unBookmark
          : AppLocalizations.of(context).bookmark;
      _choices[1] = AppLocalizations.of(context).download;
      _choices[2] = AppLocalizations.of(context).share;
    });
  }
  void _select(int choiceIndex, BuildContext context, myCourse.Course course) {
    switch (choiceIndex) {
      case 0:
        {
          var bookmarkProvider = Provider.of<BookmarkProvider>(context);
          bookmarkProvider.add(course.id);
          setState(() {
            _choices[0] = Provider.of<BookmarkProvider>(context, listen: false)
                .isInBookmark(this.widget.course.id)
                ? AppLocalizations.of(context).unBookmark
                : AppLocalizations.of(context).bookmark;
          });
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      default:
        {}
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _choices[0] = Provider.of<BookmarkProvider>(context)
          .isInBookmark(this.widget.course.id)
          ? AppLocalizations.of(context).unBookmark
          : AppLocalizations.of(context).bookmark;
      _choices[1] = AppLocalizations.of(context).download;
      _choices[2] = AppLocalizations.of(context).share;
    });
    var bookmarkProvider = Provider.of<BookmarkProvider>(context);
    return GestureDetector(
        onTap: () {
          Provider.of<VideoProvider>(context).changeToNotIsDownload();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetail(course: this.widget.course)),
          );
        },
        child: Card(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                  ),
                ],
                color: Provider.of<ThemeProvider>(context).getThemeMode() ==
                    ThemeMode.dark
                    ? AppColors.darkBackgroundCardCourse
                    : AppColors.lightBackgroundCardCourse),
            // margin: EdgeInsets.only(
            //     right: 16, left: widget.index == 0 ? 16 : 0, bottom: 16, top: 8),
            width: widthVertical,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [

                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.course.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                            alignment: Alignment.topLeft,
                            child: PriceLabel(this.widget.course.price )),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton(
                            offset: Offset(0, 36),
                            tooltip: 'Setting More',
                            onSelected: (index) =>
                            {_select(index, context, widget.course)},
                            itemBuilder: (BuildContext context) {
                              return _choices.map((String choice) {
                                return PopupMenuItem<int>(
                                  value: _choices.indexOf(choice),
                                  child: Text(choice),
                                );
                              }).toList();
                            }),
                      ),
                      Container(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              bookmarkProvider.isInBookmark(widget.course.id)
                                  ? Container(
                                padding: EdgeInsets.all(16),
                                alignment: Alignment.bottomRight,
                                child: Icon(Icons.bookmark),
                              )
                                  : Container(),
                              Container(
                                height: 4,
                                child: FutureBuilder<Response>(
                                  future:CourseServices.getProcessCourse(courseId: this.widget.course.id,token: Provider.of<LoginProvider>(context).userResponseModel.token),
                                  builder:(BuildContext context, AsyncSnapshot<Response> snapshot){
                                    if(snapshot.hasData){

                                      return Container(
                                          alignment: Alignment.bottomCenter,
                                          child: LinearProgressIndicator(
                                            value: jsonDecode(snapshot.data.body)["payload"]==null?0:jsonDecode(snapshot.data.body)["payload"].toDouble(),
                                          ));
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(widget.course.title),
                        SubTitle(widget.course.instructorUserName),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // buildSubTextTitle(widget.course.level),
                            SubTitle(widget.course.status
                                .toString()
                                .split('.')
                                .last),
                            SubTitle(DateFormat('yyyy-MM-dd')
                                .format(widget.course.createdAt)),
                            SubTitle(double.parse((widget.course.totalHours)
                                .toStringAsFixed(3))
                                .toString() +
                                " h"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RatingStar(
                              rateNumber: widget.course.ratedNumber,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            //   buildSubTextTitle('(SL Đánh giá: ${this.widget.course.ratedNumber})')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class HorizontalCourseItem extends StatefulWidget {
  final ShownCourse course;

  HorizontalCourseItem({this.course});

  @override
  _HorizontalCourseItemState createState() => _HorizontalCourseItemState();
}

class _HorizontalCourseItemState extends State<HorizontalCourseItem> {
  List<String> _choices = <String>[
    "Bookmark",
    "Add to channel",
    "Download",
    "Share"
  ];
  void _select(int choiceIndex, BuildContext context, ShownCourse course) {
    switch (choiceIndex) {
      case 0:
        {
          var bookmarkProvider = Provider.of<BookmarkProvider>(context);
          bookmarkProvider.add(course.id);

          setState(() {
            _choices[0] = bookmarkProvider.isInBookmark(this.widget.course.id)
                ? "Unbookmark"
                : "Bookmark";
          });
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      default:
        {}
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _choices[0] = Provider.of<BookmarkProvider>(context, listen: false)
          .isInBookmark(this.widget.course.id)
          ? "Unbookmark"
          : "Bookmark";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {

          Provider.of<VideoProvider>(context).changeToNotIsDownload();

          var response = await CourseServices.getCourseInfo(
              courseId: this.widget.course.id);

          Course course =
              courseDetailResponseModelFromJson(response.body).payload;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetail(course: course)),
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(),
          height: heightItem,
          child: Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                      height: heightItem * 2 / 3,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: this.widget.course.imageUrl != null
                                ? NetworkImage(this.widget.course.imageUrl)
                                : AssetImage('assets/imgPlaceHolder.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextTitle(this.widget.course.title),
                      SubTitle(((){
                        if(widget.course.price==0){
                          return "FREE";
                        }else{
                          return "${widget.course.price} VND";
                        }
                      })()),
                      SubTitle(widget.course.instructorUserName),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildSubTextTitle(this.widget.course.level),
                          // buildSubTextTitle(this.widget.course.dateRelease),
                          // buildSubTextTitle(this.widget.course.hourLearning),
                          widget.course.createdAt != null
                              ? SubTitle(DateFormat('yyyy-MM-dd')
                              .format(widget.course.createdAt) +
                              "")
                              : Container(),
                          widget.course.totalHours != null
                              ? SubTitle(double.parse((widget.course.totalHours)
                              .toStringAsFixed(3))
                              .toString() +
                              " h")
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStar(
                            rateNumber: widget.course.ratedNumber,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          //   buildSubTextTitle('(SL Đánh giá: ${this.widget.course.ratedNumber})')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                  offset: Offset(200, 100),
                  tooltip: 'Setting More',
                  onSelected: (index) =>
                  {_select(index, context, widget.course)},
                  itemBuilder: (BuildContext context) {
                    return _choices.map((String choice) {
                      return PopupMenuItem<int>(
                        value: _choices.indexOf(choice),
                        child: Text(choice),
                      );
                    }).toList();
                  }),
            ],
          ),
        ));
  }
}



class HorizontalCourseItemDownload extends StatefulWidget {
  final ShownCourse course;
  final CourseDownload courseDownload;

  HorizontalCourseItemDownload({this.course,this.courseDownload});

  @override
  _HorizontalCourseItemDownloadState createState() => _HorizontalCourseItemDownloadState();
}

class _HorizontalCourseItemDownloadState extends State<HorizontalCourseItemDownload> {
  List<String> _choices = <String>[
    "Bookmark",
    "Add to channel",
    "Download",
    "Share"
  ];
  void _select(int choiceIndex, BuildContext context, ShownCourse course) {
    switch (choiceIndex) {
      case 0:
        {
          var bookmarkProvider = Provider.of<BookmarkProvider>(context);
          bookmarkProvider.add(course.id);

          setState(() {
            _choices[0] = bookmarkProvider.isInBookmark(this.widget.course.id)
                ? "Unbookmark"
                : "Bookmark";
          });
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      default:
        {}
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _choices[0] = Provider.of<BookmarkProvider>(context, listen: false)
          .isInBookmark(this.widget.course.id)
          ? "Unbookmark"
          : "Bookmark";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {

          Provider.of<VideoProvider>(context).changeToIsDownload();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetail(course: this.widget.courseDownload.data,sections: this.widget.courseDownload.sections,)),
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(),
          height: heightItem,
          child: Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                      height: heightItem * 2 / 3,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: this.widget.course.imageUrl != null
                                ? NetworkImage(this.widget.course.imageUrl)
                                : AssetImage('assets/imgPlaceHolder.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextTitle(this.widget.course.title),
                      SubTitle(((){
                        if(widget.course.price==0){
                          return "FREE";
                        }else{
                          return "${widget.course.price} VND";
                        }
                      })()),
                      SubTitle(widget.course.instructorUserName),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildSubTextTitle(this.widget.course.level),
                          // buildSubTextTitle(this.widget.course.dateRelease),
                          // buildSubTextTitle(this.widget.course.hourLearning),
                          widget.course.createdAt != null
                              ? SubTitle(DateFormat('yyyy-MM-dd')
                              .format(widget.course.createdAt) +
                              "")
                              : Container(),
                          widget.course.totalHours != null
                              ? SubTitle(double.parse((widget.course.totalHours)
                              .toStringAsFixed(3))
                              .toString() +
                              " h")
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStar(
                            rateNumber: widget.course.ratedNumber,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          //   buildSubTextTitle('(SL Đánh giá: ${this.widget.course.ratedNumber})')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                  offset: Offset(200, 100),
                  tooltip: 'Setting More',
                  onSelected: (index) =>
                  {_select(index, context, widget.course)},
                  itemBuilder: (BuildContext context) {
                    return _choices.map((String choice) {
                      return PopupMenuItem<int>(
                        value: _choices.indexOf(choice),
                        child: Text(choice),
                      );
                    }).toList();
                  }),
            ],
          ),
        ));
  }
}