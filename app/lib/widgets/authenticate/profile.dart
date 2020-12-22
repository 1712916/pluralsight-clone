import 'package:app/models/info-response-model.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/services/user-services.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  static const String routeName = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  LoginProvider loginProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  Future<Info> loadProfile() async {
    var response =
    await UserServices.profileService(token: this.loginProvider.userResponseModel.token);
    return infoFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    setState(() {
      loginProvider = Provider.of<LoginProvider>(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: this.loginProvider.isLogin
          ? FutureBuilder<Info>(
              future: loadProfile(),
              builder: (BuildContext context, AsyncSnapshot<Info> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data.payload.avatar),
                              // backgroundImage: NetworkImage( getProfile(loginState.userResponseModel.token).then((value) => value)),
                              radius: 40.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text((() {
                              if (snapshot.data.payload.name != null) {
                                return snapshot.data.payload.name;
                              } else {
                                return snapshot.data.payload.email;
                              }
                            })()),
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
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Lỗi rồi man"),
                  );
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      circleLoading(),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Please wait for loading..")
                    ],
                  ),
                );
              })
          : ProfileSignOut(context),
    );
  }



}

Widget ProfileSignOut(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildTextTitle(profileIntroLogout),
        SizedBox(
          height: 16,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn(requiredSavePassword: false,)));
          },
          child: Text(signInButton),
          color: AppColors.secondaryColor,
        )
      ],
    ),
  );
}
