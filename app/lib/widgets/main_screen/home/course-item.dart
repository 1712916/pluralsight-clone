import 'package:app/models/course.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constain.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:flutter/material.dart';
import '../../customs/text-type.dart';


class VerticalCourseItem extends StatefulWidget {
  final Course course;

  VerticalCourseItem({this.course});

  @override
  _VerticalCourseItemState createState() => _VerticalCourseItemState();
}

class _VerticalCourseItemState extends State<VerticalCourseItem> {
  static List<String> _choices = <String>[
    "Bookmark",
    "Add to channel",
    "Download",
    "Share"
  ];

  @override
  Widget build(BuildContext context) {
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
          width: 210,
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
                          image: NetworkImage(widget.course.imgPlaceholder),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                          offset: Offset(200,100),
                          tooltip: 'Setting More',
                          onSelected: _select,
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
                            widget.course.isBookmarked
                                ? Container(
                                    padding: EdgeInsets.all(16),
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.bookmark_border),
                                  )
                                : Container(),
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
                      widget.course.authors.length == 1
                          ? buildSubTextTitle(widget.course.authors[0])
                          : buildSubTextTitle(widget.course.authors[0] +
                              ', +' +
                              (widget.course.authors.length - 1).toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSubTextTitle(widget.course.level),
                          buildSubTextTitle(widget.course.dateRelease),
                          buildSubTextTitle(widget.course.hourLearning),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star_half_outlined,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          SizedBox(width: 20,),
                          buildSubTextTitle('(${widget.course.numsVote})')
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

  void _select(int choiceIndex) {
    switch (choiceIndex) {
      case 0:
        {
          print('Ban da chon: {$choiceIndex}');
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
}



class HorizontalCourseItem extends StatelessWidget {
    static final List<String> _choices = <String>[
    "Unbookmark",
    "Add to channel",
    "Remove Download"
  ];

  final Course course;
  HorizontalCourseItem({this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
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
                            image: NetworkImage(course.imgPlaceholder),
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
                      buildTextTitle(course.title),
                      course.authors.length == 1
                          ? buildSubTextTitle(course.authors[0])
                          : buildSubTextTitle(course.authors[0] +
                          ', +' +
                          (course.authors.length - 1).toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSubTextTitle(course.level),
                          buildSubTextTitle(course.dateRelease),
                          buildSubTextTitle(course.hourLearning),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star_half_outlined,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          buildSubTextTitle('(${course.numsVote})')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                  color: Colors.green,
                  offset: Offset(200, 100),
                  tooltip: 'Setting More',
                  onSelected: _select,
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

  void _select(int choiceIndex) {
    switch (choiceIndex) {
      case 0:
        {
          print('Ban da chon: {$choiceIndex}');
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
}
