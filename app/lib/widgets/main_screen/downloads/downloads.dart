
import 'dart:convert';

import 'package:app/provider/download-proivder.dart';
import 'package:app/provider/login-provider.dart';

import 'package:app/sqlite/download-course.dart';
import 'package:app/widgets/authenticate/settings.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/main_screen/home/course-item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../customs/custom-appbar.dart';
import '../../authenticate/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      appBar: CustomAppBar(AppLocalizations.of(context).download),
      body: DownloadsPage(),
    );
  }
}

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {


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

                   Provider.of<DownloadProvider>(context).removeAllData();
                  }, child: Text(AppLocalizations.of(context).removeAll))
                ],
              ),
            ),
            Provider.of<DownloadProvider>(context).isDownloading?Container(
              child: Text("Đang tải một khóa học"),
            ):Container(),
            FutureBuilder(
              future: Provider.of<DownloadProvider>(context).getAllData(userId:Provider.of<LoginProvider>(context).userResponseModel.userInfo.id ),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                if(snapshot.hasData){
                //  print("downloads: ${ jsonEncode(snapshot.data[0].sections)}");
                  return Column(
                    children: snapshot.data
                        .map((e) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          HorizontalCourseItemDownload(course: e.data.toShownCourse(),courseDownload: e,),
                          Divider(
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ))
                        .toList(),
                  );
                }else if(snapshot.hasError){
                  return Container();
                }
                return Container();
              },

            )
          ],
        ));
  }
}
