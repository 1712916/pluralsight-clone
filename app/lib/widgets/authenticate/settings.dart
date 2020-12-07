import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static const String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    var loginState=Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: loginState.isLogin?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/avt.jpg'),
                    radius: 20.0,
                  ),
                  Column(
                    children: [
                      buildTextHeader(loginState.account.name),
                      buildSubTextTitle(loginState.account.id)
                    ],
                  )
                ],
              ),

              FlatButton(
                minWidth: double.infinity,
                onPressed: () {
                  Provider.of<LoginProvider>(context).changeState();
                  Navigator.of(context).popUntil((route) => route.isFirst);

                },
                child: Text('SIGN OUT', style: TextStyle(
                    color: AppColors.secondaryColor
                ),),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: AppColors.secondaryColor)),
              ),
            ],
          ),
        ),
      ):SettingsSignOut(context),
    );
  }
}

Widget SettingsSignOut(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
           GestureDetector(
             child: buildTextHeader('Captions'),
           ),
          SizedBox(height: 8,),
          GestureDetector(
            child: buildTextHeader('Notifications'),
          ),
          SizedBox(height: 8,),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextHeader('App version'),
                SizedBox(height: 8,),
                buildSubTextTitle('2.40.0')
              ],
            ),
          ),
          SizedBox(height: 8,),
          Divider(),
          FlatButton(
            minWidth: double.infinity,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SignIn()));
            },
            child: Text('SIGN IN', style: TextStyle(
                color: AppColors.secondaryColor
            ),),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: BorderSide(color: AppColors.secondaryColor)),
          ),
        ],
      ),
    ),
  );
}