import 'package:app/coursedetail/detail.dart';
import 'package:app/home/seeall.dart';
import 'package:app/profile.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'builderlist.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return MyHome();
                case CourseDetail.routeName:
                  return CourseDetail(null);
                case Profile.routeName:
                  return Profile();
                case ListCourse.routeName:
                  return ListCourse();
              // setting
              //  send feedback
              // contact support
                default:
                  return MyHome();
              }
            });
      },
    );
  }
}

class MyHome extends StatelessWidget {
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
