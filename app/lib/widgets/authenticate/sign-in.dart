import 'package:app/models/bookmark-provider.dart';
import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/models/user-response-model.dart';
import 'package:app/services/user-services.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/forgot-password.dart';
import 'package:app/widgets/authenticate/sign-up.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main-navigate.dart';

class SignIn extends StatefulWidget {
  bool requiredSavePassword;
  @override
  _LoginState createState() => _LoginState();

  SignIn({this.requiredSavePassword});
}

class _LoginState extends State<SignIn> {
  bool isSavePassword =false;
  int loginState;
  bool isLoading;
  // Initially password is obscure
  bool _obscureText;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSavePassword = false;
    loginState = -1;
    isLoading = false;
    // Initially password is obscure
    _obscureText = true;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    loadAccount();

  }
  void loadAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final emailKey = 'email';
    final passwordKey = 'password';
    final isLoginKey = 'isLogin';
    final isSavePassword='isSavePassword';
    String email = prefs.getString(emailKey);
    List<String> password = prefs.getStringList(passwordKey);
    bool isLogin= prefs.getBool(isSavePassword);
    print('email: $email + pass: $password');

    if( isLogin!=null && isLogin){
      if (email != null && password.isNotEmpty) {
        setState(() {
          _passwordController.text = decodePassword(password);
          _emailController.text = email;
        });
        loginProcess();
      }
    }else{
      setState(() {
        _passwordController.text = "";
        _emailController.text = email;
      });
    }

  }



  void saveAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final emailKey = 'email';
    final passwordKey = 'password';
    final isLoginKey = 'isLogin';
    prefs.setString(emailKey, this._emailController.text);
    prefs.setString(passwordKey, this._passwordController.text);
    prefs.setBool(isLoginKey,isSavePassword );
    prefs.setStringList(
        passwordKey, hashPassword(this._passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myTextField(labelname:"Email",controller: _emailController),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: AppColors.secondaryColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText ? Icons.lock : Icons.lock_open,
                                color: AppColors.secondaryColor,
                              ),
                            )),
                        obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      !isLoading ? Container() : circleLoading(),
                      Container(
                        child: (() {
                          if (loginState == 400) {
                            return Container(
                              alignment: Alignment.topLeft,
                              child: failureText(
                                loginFailedStatus,
                              ),
                            );
                          }
                          if (loginState == 1) {
                            return Container(
                              alignment: Alignment.topLeft,
                              child: successText(
                                checkEmailActive,
                              ),
                            );
                          }
                          return Container();
                        })(),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Checkbox(

                                activeColor: AppColors.secondaryColor,

                                value: isSavePassword,
                                onChanged: (value) {
                                  setState(() {
                                    isSavePassword = value;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Lưu mật khẩu."),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: FlatButton(
                            onPressed: () async {
                              //bật indicator
                              //Xu ly dang nhap
                              loginProcess();
                            },
                            child: Center(
                              child: Text(
                                'SIGN IN',
                              ),
                            )),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text('FORGOT PASSWORD?',
                              style:
                                  TextStyle(color: AppColors.secondaryColor))),
                    ],
                  ),
                )),
                TextButton(
                    onPressed: () async {
                      final result = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));

                      if (result != null) {
                        print(result);
                        setState(() {
                          _emailController.text = result['email'];
                          _passwordController.text = result['password'];
                          loginState = 1;
                        });
                      }
                    },
                    child: Text(
                      'CREATE NEW ACCOUNT',
                      style: TextStyle(color: AppColors.secondaryColor),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> hashPassword(String text) {
    List<String> rs = [];
    for (int i = 0; i < text.length; i++) {
      rs.add(text[i].codeUnitAt(i).toString());
    }

    return rs;
  }



  void loginProcess() async {
    setState(() {
      isLoading = true;
      loginState = -1;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    var response = await UserServices.loginService(email: email, password: password);

    if (response.statusCode == 200) {
      // if(isSavePassword){
      //   saveAccount();
      // }else{
      //   setState(() {
      //     _passwordController.text="";
      //   });
      //   saveAccount();
      // }
      saveAccount();
      var userResponse = userResponseModelFromJson(response.body);
      Provider.of<LoginProvider>(context).setUserResponse(userResponse);
      Provider.of<LoginProvider>(context).changeState();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Provider.of<CurrentBottomNavigatorProvider>(context).currentIndex = 0;

      String userId= userResponse.userInfo.id;
      Provider.of<BookmarkProvider>(context).userId=userId;
      BookmarkSQL bookmarkSQL=new BookmarkSQL(databaseName: database_name);
      await bookmarkSQL.open();

      List<dynamic> bookmarkFromSqlite=await bookmarkSQL.getData(userId);
      Provider.of<BookmarkProvider>(context).bookmarkSQL=bookmarkSQL;
      Provider.of<BookmarkProvider>(context).courseIds=[];
      for(int i=0;i<bookmarkFromSqlite.length;i++){
        Provider.of<BookmarkProvider>(context).courseIds.add(bookmarkFromSqlite[i].courseId);
      }
      // ignore: invalid_use_of_visible_for_testing_member
      Provider.of<BookmarkProvider>(context).notifyListeners();

      setState(() {
        isLoading = false;
        loginState = 200;
      });
    } else {
      setState(() {
        isLoading = false;
        loginState = 400;
      });
    }
  }
}

Widget myTextField({String labelname, TextEditingController controller, int maxLines}) {
  return TextField(
    minLines:  maxLines??1,
    maxLines: maxLines??1,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryColor,
        ),
      ),
      labelStyle: TextStyle(
        color: AppColors.secondaryColor,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.clear,
          color: AppColors.secondaryColor,
        ),
        onPressed: () {
          controller.clear();
        },
      ),
      labelText: labelname,
    ),
  );
}
String decodePassword(List<String> texts) {
  String rs = "";
  for (int i = 0; i < texts.length; i++) {
    rs += String.fromCharCode(int.parse(texts[i]));
  }

  return rs;
}