import 'package:app/models/author.dart';
import 'package:app/models/course.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../customs/rating-star.dart';
import '../customs/text-type.dart';
import '../customs/expandable.dart';

class CourseDetail extends StatefulWidget {
  final Course course;

  CourseDetail(this.course);

  static const routeName = '/course-detail';
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<CourseDetail> {
  //Data here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundItemTypeA,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Center(child: Text('Video area')),
              ),
              SafeArea(
                  child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ))
            ],
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
                    SliverPadding(
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
                    ),
                  ];
                },
                body: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBarView(
                      children: [
                        Container(
                          child: ListView(
                            children: [
                              Container(height: 40, color: Colors.grey),
                              Container(height: 40, color: Colors.green),
                              Container(height: 40, color: Colors.pinkAccent),
                              Container(height: 40, color: Colors.blue),
                              Container(height: 40, color: Colors.grey),
                              Container(height: 40, color: Colors.green),
                              Container(height: 40, color: Colors.pinkAccent),
                              Container(height: 40, color: Colors.blue),
                              Container(height: 40, color: Colors.grey),
                              Container(height: 40, color: Colors.green),
                              Container(height: 40, color: Colors.pinkAccent),
                              Container(height: 40, color: Colors.blue)
                            ],
                          ),
                        ),
                        Container(height: 40, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Information extends StatefulWidget {
  Course course;
  Information({this.course});
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextHeader1(
            widget.course.title,
          ),
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              //suawr lai thanh buidler
              children: widget.course.authors
                  .map((e) => Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: authorChip(findAuthorById(e), context)))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'Beginner',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'thg 4 16 2019',
                style: TextStyle(color: Colors.white),
              ),
              Center(
                child: Text(
                  '.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                '6,1 h',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 8,
              ),
              RatingStar(widget.course.rating),
              Text(
                '(1512)',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: actionButton(
                    'Bookmark', Icon(Icons.bookmark_border), () {}),
              ),
              Expanded(
                child: actionButton(
                    'Add to Channel', Icon(Icons.wifi_tethering), () {}),
              ),
              Expanded(
                child: actionButton(
                    'Downloaded', Icon(Icons.arrow_circle_down), () {}),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          TextExpandable(widget.course.description),
          SizedBox(
            height: 16,
          ),
          actionButton2('Take a learning check', Icon(Icons.done), () {}),
          SizedBox(
            height: 8,
          ),
          actionButton2(
              'View related paths & courses', Icon(Icons.done), () {}),
        ],
      ),
    );
  }
}

Widget authorChip(Author author,BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AuthorDetail(author)),
      );
    },
    child: Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 26,
              width: 26,
              child: CircleAvatar(
                backgroundImage: NetworkImage(author.avt),
                radius: 4.0,
              )),
          SizedBox(
            width: 8,
          ),
          Text(author.name, style: TextStyle(fontSize: 14, color: Colors.white))
        ],
      ),
    ),
  );
}

Widget actionButton(String title, Icon icon, Function function) {
  return Container(
    height: 80,
    child: FlatButton(
      onPressed: () {
        function();
      },
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white38,
            ),
            child: icon, //Icons.bookmark_border
            height: 40,
            width: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget actionButton2(String title, Icon icon, Function function) {
  return FlatButton(
      height: 40,
      padding: EdgeInsets.zero,
      color: Colors.white24,
      onPressed: () {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ));
}
