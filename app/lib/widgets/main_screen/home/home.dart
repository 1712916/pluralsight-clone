import 'package:app/models/course-provider.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/widgets/authenticate/settings.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../customs/custom-appbar.dart';
import '../../authenticate/profile.dart';
import 'builderlist.dart';
import 'package:provider/provider.dart';
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
                  return  MyHome();
                // case CourseDetail.routeName:
                //   return CourseDetail(null);
                case Profile.routeName:
                  return Profile();
                // case ListCourse.routeName:
                //   return ListCourse();
                case Settings.routeName:
                  return Settings();
              // setting
              //  send feedback
              // contact support
                default:
                  return  MyHome();
              }
            });
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginState=Provider.of<LoginProvider>(context, listen: true).isLogin;
    // var courseProvider=Provider.of<CourseProvider>(context);
    // var bookmarkProvider=Provider.of<BookmarkProvider>(context);
  
    return Scaffold(
      appBar: CustomAppBar('Home'),
      body: loginState?RefreshIndicator(
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

            buildRowOfCourses("TOP NEW"),
            SizedBox(
              height: 16,
            ),
            buildRowOfCourses("TOP SELL"),
            SizedBox(
              height: 16,
            ),
            buildRowOfCourses("TOP RATE"),
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
      ):HomeSignOut(context),
    );
  }
}

Widget HomeSignOut(BuildContext context){
  return RefreshIndicator(
    onRefresh: () async{},
    child: ListView(

      children: [
        SizedBox(height: 72,),
        Center(child: buildTextHeader1(get_started_in_home_logout)),
        SizedBox(height: 72,),
        GestureDetector(

          onTap: (){
            //navigate to browse
            Provider.of<CurrentBottomNavigatorProvider>(context).update(2);

          },
          child: Icon(Icons.apps_sharp,size: 30,),
        ),
        SizedBox(height: 36,),
        Center(child: buildTextTitle(browse_intro_in_home_logout)),
        SizedBox(height: 72,),
        GestureDetector(
          onTap: (){
            //navigate to search
            //navigate to browse
            Provider.of<CurrentBottomNavigatorProvider>(context).update(3);
          },
          child: Icon(Icons.search,
            size: 30,),
        ),
        SizedBox(height: 36,),
        Center(child: buildTextTitle(search_in_home_logout)),

      ],
    ),
  );
}



Widget buildRowOfCourses(String title){

  return FutureBuilder<Response>(
    future: CourseServicesFactory.dictonary[title](limit: 10,page:1),
    builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
      if(snapshot.hasData){
        List<Course> courses=coursesResponseModelFromJson(snapshot.data.body).courses;
        return  Container(
            child: BuilderListHorizontal(title: title,courses: courses,));
      }else if(snapshot.hasError){
        return Center(
          child: Container(
            child: Text("Có lỗi ở server"),
          ),
        );
      }

      return circleLoading();
    },
  );
}
