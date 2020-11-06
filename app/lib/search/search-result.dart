import 'package:app/ulti/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../downloads/item.dart';

class SearchResult extends StatelessWidget {
  List<Course> _courses=Courses;
  // List<Author> _authors;
  // List<Path> _pahts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DefaultTabController(
          length: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: TabBar(tabs: [
                  Tab(
                    child: Text(
                      'ALL',
                    ),
                  ),
                  Tab(text: "COURSES"),
                  Tab(text: "PATHS"),
                  Tab(text: "AUTHORS"),
                ]),
              ),
              Expanded(
                //Add this to give height

                child: TabBarView(children: [
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                         Column(
                           children: buildCourseItem(_courses,4),
                         )

                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Articles Body"),
                      ],
                    ),
                  ),
                  Container(
                    child: Text("Articles Body"),
                  ),
                  Container(
                    child: Text("Articles Body"),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> buildCourseItem(List<Course> courses,int length) {
  List<Widget> list = [];
  list.add(Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Course'),
      TextButton(
          onPressed: () {},
          child: Text('${courses.length} Results')),
    ],
  ));


  for (var i = 0; i < courses.length && i <length; i++) {
    list.add(CourseItemTypeB(course: courses[i],));
    list.add(Divider(
      color: Colors.grey,

    ));
  }
  return list;
}


class ItemFactory{
  String type;

  Widget clone(){

  }

}
