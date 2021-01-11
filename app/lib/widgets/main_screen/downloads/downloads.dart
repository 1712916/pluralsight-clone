
import 'package:app/models/course-detail-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/sqlite/download-course.dart';
import 'package:app/widgets/authenticate/settings.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/main_screen/home/course-item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../customs/custom-appbar.dart';
import '../../authenticate/profile.dart';

class Downloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return MyDownloads();
                case CourseDetail.routeName:
                  return CourseDetail();
                case Profile.routeName:
                  return Profile();
                case Settings.routeName:
                  return Settings();
                default:
                  return MyDownloads();
              }
            });
      },
    );
  }
}

class MyDownloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Downloads'),
      body: DownloadsPage(),
    );
  }
}

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  List _downloads=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load();


  }
  load()async{
    CourseSQL courseSQL=CourseSQL(databaseName: CourseSQL.database_name);
    await courseSQL.open();
   var data=await courseSQL.getData( Provider.of<LoginProvider>(context).userResponseModel.userInfo.id);
   print("${data}");
    setState(()   {
      _downloads= data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          print('Hello');
          return;
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   // '${_downloads.length} courses',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  TextButton(onPressed: () {
                    load();
                  }, child: Text('REMOVE ALL'))
                ],
              ),
            ),
            Column(
              children: _downloads
                  .map((course) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            HorizontalCourseItem(course: course.toShownCourse()),
                            Divider(
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
