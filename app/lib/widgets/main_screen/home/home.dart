import 'dart:convert';
 import 'package:app/models/courses-favorite-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/provider/bookmark-provider.dart';
import 'package:app/provider/login-provider.dart';
 import 'package:app/services/course-services.dart';
import 'package:app/widgets/authenticate/profile.dart';
import 'package:app/widgets/authenticate/settings.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/customs/custom-appbar.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:app/widgets/main_screen/home/builderlist.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line

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
                  return CourseDetail();
                case Profile.routeName:
                  return Profile();
                case ListCourse.routeName:
                  return ListCourse();
                case Settings.routeName:
                  return Settings();
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
    var loginState = Provider.of<LoginProvider>(context ).isLogin;


    return Scaffold(
      appBar: CustomAppBar("Home"),
      body: loginState
          ? RefreshIndicator(
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

                  buildRowOfCourses(
                      "TOP NEW",
                      CourseServicesFactory.dictonary["TOP NEW"](
                          limit: 10, page: 1)),
                  SizedBox(
                    height: 16,
                  ),
                  buildRowOfCourses(
                      "TOP SELL",
                      CourseServicesFactory.dictonary["TOP SELL"](
                          limit: 10, page: 1)),
                  SizedBox(
                    height: 16,
                  ),
                  buildRowOfCourses(
                      "TOP RATE",
                      CourseServicesFactory.dictonary["TOP SELL"](
                          limit: 10, page: 1)),
                  SizedBox(
                    height: 16,
                  ),
                  FutureBuilder(
                      future: Provider.of<BookmarkProvider>(context).courses,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Course>> snapshot) {
                        if (snapshot.hasData) {
                          return BuilderListBookmark(snapshot.data);
                        }
                        return Container();
                      })

                  //add here
                  //     Column(
                  //       children: courseProvider.categories.map((c) => BuilderList(
                  //             category: c,
                  //             courses: courseProvider.findCourseByCategoryId(c.id, -1),
                  //           )).toList(),
                  //     ),
                  // //    BuilderListMyPath(bookmarkProvider.courses),
                  //     BuilderListBookmark(bookmarkProvider.courses),
                ],
              ),
            )
          : HomeSignOut( ),
    );
  }
}

class HomeSignOut extends StatefulWidget {
  @override
  _HomeSignOutState createState() => _HomeSignOutState();
}

class _HomeSignOutState extends State<HomeSignOut> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          SizedBox(
            height: 72,
          ),
          Center(child: buildTextHeader1(AppLocalizations.of(context).getStart)),
          SizedBox(
            height: 72,
          ),
          GestureDetector(
            onTap: () {
              //navigate to browse
              Provider.of<CurrentBottomNavigatorProvider>(context).update(2);
            },
            child: Icon(
              Icons.apps_sharp,
              size: 30,
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Center(
              child:
              TextTitle(AppLocalizations.of(context).browseIntroLogout)),
          SizedBox(
            height: 72,
          ),
          GestureDetector(
            onTap: () {
              //navigate to search
              //navigate to browse
              Provider.of<CurrentBottomNavigatorProvider>(context).update(3);
            },
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Center(
              child:
              TextTitle(AppLocalizations.of(context).searchIntroLogout)),
        ],
      ),
    );
  }
}


Widget buildRowOfCourses(String title, Future future) {
  return FutureBuilder<Response>(
    future: future,
    builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
      if (snapshot.hasData) {
        List<Course> courses =
            coursesResponseModelFromJson(snapshot.data.body).courses;
        return Container(
            child: BuilderListHorizontal(
          title: title,
          courses: courses,
          canSeAll: true,
        ));
      } else if (snapshot.hasError) {
        return Center(
          child: Container(
            child: Text(AppLocalizations.of(context).responseError),
          ),
        );
      }

      return Center(child: circleLoading());
    },
  );
}

Widget buildRowOfFavoriteCourses(String title, Future future) {
  return FutureBuilder<Response>(
    future: future,
    builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
      if (snapshot.hasData) {
        List<CourseFavorite> courseFavorites =
            coursesFavoriteResponseModelFromJson(snapshot.data.body).payload;
        List<Course> courses = [];
        getCoursesFromFavorite(
                courseFavorites,
                Provider.of<LoginProvider>(context)
                    .userResponseModel
                    .userInfo
                    .id)
            .then((value) => null);

        return Container(
            child: BuilderListHorizontal(title: title, courses: courses));
      } else if (snapshot.hasError) {
        return Center(
          child: Container(
            child: Text(AppLocalizations.of(context).responseError),
          ),
        );
      }

      return Center(child: circleLoading());
    },
  );
}

Future<List<Course>> getCoursesFromFavorite(
    List<CourseFavorite> courseFavorites, String userId) async {
  List<Course> courses = [];
  for (int i = 0; i < courseFavorites.length; i++) {
    var response = await CourseServices.getCourseDetail(
        courseId: courseFavorites[i].id, userId: userId);
    // print("Data: ${courseDetailResponseModelFromJson(  response.body )}");
    Course course = Course.fromJson(jsonDecode(response.body)["payload"]);
    courses.add(course);
  }
  return courses;
}
