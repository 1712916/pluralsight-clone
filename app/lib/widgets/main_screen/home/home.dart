import 'package:app/models/course-provider.dart';
import 'package:app/models/course.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/main_screen/home/home-signout.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';
import '../../customs/custom-appbar.dart';
import '../../authenticate/profile.dart';
import 'builderlist.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        var loginState=Provider.of<LoginProvider>(context).isLogin;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return !loginState?HomeSignOut():MyHome();
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
                  return !loginState?HomeSignOut():MyHome();
              }
            });
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var courseProvider=Provider.of<CourseProvider>(context);
    var bookmarkProvider=Provider.of<BookmarkProvider>(context);
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
              children: courseProvider.categories.map((c) => BuilderList(
                    category: c,
                    courses: courseProvider.findCourseByCategoryId(c.id, -1),
                  )).toList(),
            ),
        //    BuilderListMyPath(bookmarkProvider.courses),
            BuilderListBookmark(bookmarkProvider.courses),
          ],
        ),
      ),
    );
  }
}
