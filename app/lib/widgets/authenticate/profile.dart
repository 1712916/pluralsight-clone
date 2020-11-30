import 'package:app/models/login-provider.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    var loginState=Provider.of<LoginProvider>(context);
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: loginState.isLogin?Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(loginState.account.avt),
                  radius: 40.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildTextHeader1(
                  loginState.account.name,
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Activity insights (last 30 days)',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'TOTAL ACTIVE DAYS',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    '0 day streak',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'MOST ACTIVE TIME OF DAY',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '10:00 PM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'MOST VIEWED SUBJECT',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Python',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ):ProfileSignOut(context),
    );
  }
}


Widget ProfileSignOut(BuildContext context){

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildTextTitle(profile_signout_intro),
        SizedBox(height: 16,),
        RaisedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
        },
          child: Text(profile_signout_button),
        color: AppColors.secondaryColor,)
      ],
    ),
  );
}
