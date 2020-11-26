import 'package:app/models/course-provider.dart';
import 'package:app/models/course.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constain.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../customs/text-type.dart';


class VerticalCourseItem extends StatefulWidget {
  final Course course;


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

  void _select(int choiceIndex, BuildContext context, Course course) {
    switch (choiceIndex) {
      case 0:
        {

          var bookmarkProvider=Provider.of<BookmarkProvider>(context);
          bookmarkProvider.add(course);

          // setState(() {
          //
          // });
          _choices[0]=Provider.of<BookmarkProvider>(context).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";

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
       _choices[0]=Provider.of<BookmarkProvider>(context,listen:false ).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";
     });

  }

  @override
  Widget build(BuildContext context) {
    var bookmarkProvider=Provider.of<BookmarkProvider>(context);
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
                            bookmarkProvider.isInBookmark(widget.course.id)
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


}


class HorizontalCourseItem extends StatefulWidget {
  final Course course;

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
  void _select(int choiceIndex, BuildContext context, Course course) {
    switch (choiceIndex) {
      case 0:
        {

          var bookmarkProvider=Provider.of<BookmarkProvider>(context);
          bookmarkProvider.add(course);

          // setState(() {
          //
          // });
          _choices[0]=Provider.of<BookmarkProvider>(context).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";

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
      _choices[0]=Provider.of<BookmarkProvider>(context,listen:false ).isInBookmark(this.widget.course.id)?"Unbookmark":"Bookmark";
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
                            image: NetworkImage(this.widget.course.imgPlaceholder),
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
                      this.widget.course.authors.length == 1
                          ? buildSubTextTitle(this.widget.course.authors[0])
                          : buildSubTextTitle(this.widget.course.authors[0] +
                          ', +' +
                          (this.widget.course.authors.length - 1).toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSubTextTitle(this.widget.course.level),
                          buildSubTextTitle(this.widget.course.dateRelease),
                          buildSubTextTitle(this.widget.course.hourLearning),
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
                          buildSubTextTitle('(${this.widget.course.numsVote})')
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

