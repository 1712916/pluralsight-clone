import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatefulWidget {
  static const routeName = '/extractArguments';
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<CourseDetail> {
  //Data here
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    print('Hello: $args');
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   brightness: Brightness.light,
      //   elevation: 0,
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.white,
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Center(child: Text('Video area')),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'C# Fundamentals',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
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
                                        backgroundImage:
                                            AssetImage('assets/avt.jpg'),
                                        radius: 4.0,
                                      )),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Scott Ailen',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white))
                                ],
                              ),
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
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '(1512)',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 80,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.white38,
                                          ),
                                          child: Icon(Icons.bookmark_border),
                                          height: 40,
                                          width: 40,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Bookmark',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 80,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.white38,
                                          ),
                                          child: Icon(Icons.bookmark_border),
                                          height: 40,
                                          width: 40,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Bookmark',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 80,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.white38,
                                          ),
                                          child: Icon(Icons.bookmark_border),
                                          height: 40,
                                          width: 40,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Bookmark',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                              height: 40,
                              color: Colors.grey,
                              onPressed: () {},
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Take a learning check',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          FlatButton(
                              height: 40,
                              color: Colors.grey,
                              onPressed: () {},
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Take a learning check',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          _tabSection(context),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(tabs: [
            Tab(text: "CONTENTS"),
            Tab(text: "TRANSCRIPTS"),
          ]),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            Container(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Text("Home Body"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Home Body"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Home Body"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Home Body"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Home Body"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ),
            Container(
              child: Text("Articles Body"),
            ),
          ]),
        ),
      ],
    ),
  );
}
