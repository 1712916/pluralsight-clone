import 'package:app/models/info-response-model.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/services/user-services.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-field.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                          height: 16.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            color: AppColors.secondaryColor,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
                            },
                            child: Text("Chỉnh sửa trang cá nhân".toUpperCase()),
                          ),
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

  @override
  void dispose() {
    super.dispose();
    print("is dispose");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("is didChangeDependencies");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("is deactivate");
  }
}

Widget ProfileSignOut(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextTitle(AppLocalizations.of(context).profileIntroLogout),
        SizedBox(
          height: 16,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn(requiredSavePassword: false,)));
          },
          child: Text(AppLocalizations.of(context).signInButton),
          color: AppColors.secondaryColor,
        )
      ],
    ),
  );
}

class UpdateProfile extends StatefulWidget {
  String token;
  String userName;
  String phone;
  String imgUrl;
  String email;
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController;
  TextEditingController phoneController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController();
    phoneController=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(onPressed: (){}, child: CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/avt.jpg"),
                    // backgroundImage: NetworkImage( getProfile(loginState.userResponseModel.token).then((value) => value)),
                    radius: 40.0,
                  ),),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Email@gmail.com"),
                      TextButton(onPressed: (){}, child: Text("Thay ảnh đại diện")),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 16,),
              myTextField(labelname: "Name", controller: nameController),
              SizedBox(height: 16,),
              myTextField(labelname: "Phone", controller: phoneController),
              SizedBox(height: 16,),
              OutlineButton(onPressed: () async {
                var response=await UserServices.updateProfile(token: widget.token,phone: phoneController.text,name: nameController.text,avatar: "???");
                if(response.statusCode==200){
                  //Thông báo đã cập nhật thành công
                } else{
                  //Thông báo cn ko thành công
                }

              }, child: Text("Save")),

            ],
          ),
        ),
      ),
    );
  }
}

