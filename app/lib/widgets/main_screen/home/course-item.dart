import 'dart:convert';

import 'package:app/models/course-detail-response-model.dart';
import 'package:app/models/courses-favorite-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/models/search-response-model.dart';
import 'package:app/services/course-services.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/customs/rating-star.dart';
import 'package:intl/intl.dart';
import 'package:app/models/courses-response-model.dart' as myCourse;
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../customs/text-type.dart';

class VerticalCourseItem extends StatefulWidget {
  final myCourse.Course course;

  VerticalCourseItem({this.course});

  @override
  _VerticalCourseItemState createState() => _VerticalCourseItemState();
}

class _VerticalCourseItemState extends State<VerticalCourseItem> {

  List<String> _choices = <String>[
    "Bookmark",
    "Add to channel",
    "Download",
    "Share"
  ];

  void _select(int choiceIndex, BuildContext context, myCourse.Course course) {
    switch (choiceIndex) {
      case 0:
        {

          // var bookmarkProvider=Provider.of<BookmarkProvider>(context);
          // bookmarkProvider.add(course);

          // setState(() {
          //
          // });
          // _choices[0]=Provider.of<BookmarkProvider>(context).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";

        }
        break;
      case 1:
        {


        }
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
      //   _choices[0]=Provider.of<BookmarkProvider>(context,listen:false ).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";
    });

  }

  @override
  Widget build(BuildContext context) {
    //  var bookmarkProvider=Provider.of<BookmarkProvider>(context);
    return GestureDetector(
        onTap: () {
          //Navigator.pushReplacementNamed(context, '/profile');
          // Navigator.pushNamed(context, CourseDetail.routeName,
          //     arguments: widget.course.title);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CourseDetail(this.widget.course)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors. backgroundItemTypeA
          ),
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
                    Container(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                          offset: Offset(200,100),
                          tooltip: 'Setting More',
                          onSelected: (index)=>{
                            _select(index, context, widget.course)
                          },
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
                            // bookmarkProvider.isInBookmark(widget.course.id)
                            //     ? Container(
                            //         padding: EdgeInsets.all(16),
                            //         alignment: Alignment.bottomRight,
                            //         child: Icon(Icons.bookmark_border),
                            //       )
                            //     : Container(),
                            Container(
                                alignment: Alignment.bottomCenter,
                                child: LinearProgressIndicator(
                                  value: 0.1,
                                )),
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
                      buildTextTitle(widget.course.title),
                    buildSubTextTitle( widget.course.instructorUserName),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildSubTextTitle(widget.course.level),
                          buildSubTextTitle(widget.course.status.toString().split('.').last),
                          buildSubTextTitle(DateFormat('yyyy-MM-dd').format(widget.course.createdAt)),
                          buildSubTextTitle(double.parse((widget.course.totalHours).toStringAsFixed(3)).toString()+" h"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStar(rateNumber: widget.course.ratedNumber,),
                          SizedBox(width: 20,),
                       //   buildSubTextTitle('(SL Đánh giá: ${this.widget.course.ratedNumber})')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }


}



class HorizontalCourseItem extends StatefulWidget {
  final myCourse.Course course;

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
  void _select(int choiceIndex, BuildContext context, myCourse.Course course) {
    switch (choiceIndex) {
      case 0:
        {

          // var bookmarkProvider=Provider.of<BookmarkProvider>(context);
          // bookmarkProvider.add(course);

          // setState(() {
          //
          // });
          //  _choices[0]=Provider.of<BookmarkProvider>(context).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";

        }
        break;
      case 1:
        {


        }
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
      //_choices[0]=Provider.of<BookmarkProvider>(context,listen:false ).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";
    });

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CourseDetail(this.widget.course)),
          );

        },

        child: Container(
          padding: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(

          ),
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
                            image: this.widget.course.imageUrl!=null?NetworkImage(this.widget.course.imageUrl):AssetImage('assets/imgPlaceHolder.png'),
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
                      buildTextTitle(this.widget.course.title),
                      buildSubTextTitle( widget.course.instructorUserName),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildSubTextTitle(this.widget.course.level),
                          // buildSubTextTitle(this.widget.course.dateRelease),
                          // buildSubTextTitle(this.widget.course.hourLearning),
                          buildSubTextTitle(DateFormat('yyyy-MM-dd').format(widget.course.createdAt)+""),
                          buildSubTextTitle(double.parse((widget.course.totalHours).toStringAsFixed(3)).toString()+" h"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStar(rateNumber: widget.course.ratedNumber,),
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
                  onSelected: (index)=>{
                    _select(index, context, widget.course)
                  },
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

class HorizontalCourseItemSearch extends StatefulWidget {
  final SearchItem course;


  HorizontalCourseItemSearch({this.course});

  @override
  _HorizontalCourseItemSearchState createState() => _HorizontalCourseItemSearchState();
}

class _HorizontalCourseItemSearchState extends State<HorizontalCourseItemSearch> {

  List<String> _choices = <String>[
    "Bookmark",
    "Add to channel",
    "Download",
    "Share"
  ];
  void _select(int choiceIndex, BuildContext context, myCourse.Course course) {
    switch (choiceIndex) {
      case 0:
        {

          // var bookmarkProvider=Provider.of<BookmarkProvider>(context);
          // bookmarkProvider.add(course);

          // setState(() {
          //
          // });
          //  _choices[0]=Provider.of<BookmarkProvider>(context).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";

        }
        break;
      case 1:
        {


        }
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
      //_choices[0]=Provider.of<BookmarkProvider>(context,listen:false ).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";
    });

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: ()async {
          var response= await CourseServices.getCourseInfo(courseId: this.widget.course.id);

          print("Context is : $context");
          Course course=courseDetailResponseModelFromJson(response.body).payload;
          print("course is : ${course.title}");

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CourseDetail(course)),
          );

        },

        child: Container(
          padding: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(

          ),
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
                            image: this.widget.course.imageUrl!=null?NetworkImage(this.widget.course.imageUrl):AssetImage('assets/imgPlaceHolder.png'),
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
                      buildTextTitle(this.widget.course.title),
                      buildSubTextTitle( widget.course.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildSubTextTitle(this.widget.course.level),
                          // buildSubTextTitle(this.widget.course.dateRelease),
                          // buildSubTextTitle(this.widget.course.hourLearning),
                          buildSubTextTitle(widget.course.price.toString()),
                          buildSubTextTitle(double.parse((widget.course.totalHours).toStringAsFixed(3)).toString()+" h"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStar(rateNumber: widget.course.ratedNumber,),
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
                  onSelected: (index)=>{
                    // _select(index, context, widget.course)
                  },
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



