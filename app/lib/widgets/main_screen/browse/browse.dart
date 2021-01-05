
import 'package:app/models/data.dart';
import 'package:app/provider/login-provider.dart';

import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/settings.dart';
import 'package:app/widgets/authenticate/sign-in.dart';

import 'package:app/widgets/customs/text-type.dart';
import 'package:app/widgets/main_screen/browse/paths/path-row.dart';

import 'package:app/widgets/main_screen/browse/popular_skills/popular-skills.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-detail.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-list.dart';
import 'package:provider/provider.dart';
import '../../customs/custom-appbar.dart';
import '../../authenticate/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'grid_button/button.dart';
import 'grid_button/grid-button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line

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
              //   case CourseDetail.routeName:
              //     return CourseDetail(null);
                case Profile.routeName:
                  return Profile();
                case AuthorDetail.routeName:
                  return AuthorDetail(null);
                // case AllPath.routeName:
                //   return AllPath();
                case Settings.routeName:
                  return Settings();
              // // setting
              // //  send feedback
              // // contact support
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
    var loginState=Provider.of<LoginProvider>(context);
    return Scaffold(

      appBar: CustomAppBar('Browse'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              !loginState.isLogin?SignInIntro(context):Container(),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MyButton(
                  title: 'YOUR COURSE',
                  route: 'hello',
                  type: "YOUR COURSE",
                  img: 'assets/like.jpg',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MyButton(
                  title: 'LIKED',
                  route: 'hello',
                  type: "LIKED",
                  img: 'assets/like.jpg',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MyButton(
                  title: 'RECOMMEND',
                  route: 'hello',
                  type: "RECOMMEND",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:GridButton(),
              ),

              !loginState.isLogin? SizedBox():PopularSkills(),
              // PathRow(pathCategory: null,paths: Paths,),
              AuthorList(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SignInIntro(BuildContext context){
  return Padding(
    padding: EdgeInsets.all(16),
    child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextHeader1(AppLocalizations.of(context).signInIntro),
          TextTitle(AppLocalizations.of(context).signInSubIntro),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: AppColors.secondaryColor,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn(requiredSavePassword: true,)));
              },
              child: Text(AppLocalizations.of(context).signInIntro2),
            ),
          )

        ],
      ),
    ),
  );
}
