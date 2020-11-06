import 'package:app/coursedetail/detail.dart';
import 'package:app/profile.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/TextType.dart';
import 'package:app/widget/custom-appbar.dart';

import 'package:flutter/material.dart';

import 'item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return MyHome();
                case CourseDetail.routeName:
                  return CourseDetail();
                case Profile.routeName:
                  return Profile();
              }
            });
      },
    );
  }
}

class MyHome extends StatelessWidget {
  List<Course> bookmarks; //get tu provider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Home'),
      body: RefreshIndicator(
        onRefresh: () async {
          print('Hello');
          return;
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 200,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    'Banner here',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //add here
            Column(
              children: Categories.map((c) => BuilderList(
                    category: c,
                    data: findCourseByCategoryId(c.id, -1),
                  )).toList(),
            ),
            BuilderListMyPath(findCourseByBookmark(-1)),
            BuilderListBookmark(findCourseByBookmark(-1)),
          ],
        ),
      ),
    );
  }
}

class BuilderList extends StatelessWidget {
  @required
  final Category category;
   List<Course> data;

  BuilderList({this.category, this.data});
  List<Course> searchAll() {
    return findCourseByCategoryId(category.id, -1);
  }

  Widget buildList() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTextHeader(this.category.title),
            TextButton(
                onPressed: () {
                  List<Course> data = this.searchAll();
                  //truyen data vao navigte
                  //goi navigate here
                },
                child: Text(
                  'See all >',
                  style: TextStyle(color: Colors.white38),
                )),
          ],
        ),
      ),
      Center(
          child: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: data
              .map((course) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CourseItemTypeA(course: course),
                  ))
              .toList(),
        ),
      )),
      SizedBox(
        height: 20,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildList();
  }
}

class BuilderListBookmark extends BuilderList {
  BuilderListBookmark(List<Course> data)
      : super(category: Category(title: 'Bookmark'), data: data);

  @override
  List<Course> searchAll() {
    //find by
    return findCourseByBookmark(-1);
  }
}

class BuilderListMyPath extends BuilderList {
  BuilderListMyPath(List<Course> data)
      : super(category: Category(title: 'My Paths'), data: data);

  @override
  List<Course> searchAll() {
    //find by
    return null;
  }
}
