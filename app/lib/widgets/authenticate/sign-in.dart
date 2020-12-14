import 'dart:convert';

import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/models/user-response-model.dart';
import 'package:app/services/user-services.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constraints.dart';
import 'package:app/widgets/authenticate/forgot-password.dart';
import 'package:app/widgets/authenticate/sign-up.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  int loginState = -1;
  bool isLoading = false;
  // Initially password is obscure
  bool _obscureText = true;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                      myTextField("Email", _emailController),
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
                        child: ((){
                          if(loginState==400){
                            return Container(
                              alignment: Alignment.topLeft,
                              child: failureText(
                                loginFailedStatus,
                              ),
                            );
                          }
                          if(loginState==1){
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
                              setState(() {
                                isLoading = true;
                                loginState = -1;
                              });

                              String email = _emailController.text;
                              String password = _passwordController.text;

                              var response = await loginService(
                                  email: email, password: password);

                              if (response.statusCode == 200) {
                                print("data về là: ${response.body}");

                                var userResponse =
                                    userResponseModelFromJson(response.body);
                                Provider.of<LoginProvider>(context)
                                    .setUserResponse(userResponse);
                                Provider.of<LoginProvider>(context)
                                    .changeState();
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Provider.of<CurrentBottomNavigatorProvider>(
                                        context)
                                    .currentIndex = 0;
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
                          loginState=1;
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
}

Widget myTextField(String labelname, TextEditingController controller) {
  return TextField(
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
