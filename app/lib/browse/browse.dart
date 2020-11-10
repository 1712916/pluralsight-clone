import 'package:app/browse/gridbutton/grid-button.dart';
import 'package:app/browse/paths/path-row.dart';
import 'package:app/browse/paths/seeall.dart';
import 'package:app/browse/popularskills/popular-skills.dart';
import 'package:app/browse/topauthors//author-list.dart';
import 'package:app/browse/topauthors/author-detail.dart';
import 'package:app/coursedetail/detail.dart';
import 'package:app/ulti/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../profile.dart';
import '../widget/custom-appbar.dart';
import 'button.dart';

class Browse  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return MyBrowse();
                case CourseDetail.routeName:
                  return CourseDetail(null);
                case Profile.routeName:
                  return Profile();
                case AuthorDetail.routeName:
                  return AuthorDetail(null);
                case AllPath.routeName:
                  return AllPath();
              // setting
              //  send feedback
              // contact support
                default:
                  return MyBrowse();
              }
            });
      },
    );
  }
}


class MyBrowse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar('Browse'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MyButton(
                  title: 'NEW\nRELEASES',
                  route: 'hello',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MyButton(
                  title: 'RECOMMENDED\nFOR YOU',
                  route: 'hello',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:GridButton(),
              ),

              PopularSkills(),
              PathRow(pathCategory: null,paths: Paths,),
              AuthorList(),
            ],
          ),
        ),
      ),
    );
  }
}
