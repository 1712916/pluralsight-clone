import 'dart:convert';

import 'package:app/models/account.dart';
import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constain.dart';
import 'package:app/widgets/authenticate/sign-up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  int isLogging = -1;
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
                      myTextField("Email",_emailController),
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
                      isLogging == -1
                          ? Container()
                          : (isLogging == 1
                              ? Container(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation(
                                        AppColors.accent),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "*Sai mật khẩu hoặc tài khoản",
                                    style: TextStyle(color: AppColors.error),
                                  ),
                                )),
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
                                isLogging = 1;
                              });
                              await Future.delayed(Duration(seconds: 1));
                              String email = _emailController.text;
                              String password = _passwordController.text;

                              var response = await http.post(API+"user/login", body: jsonEncode({
                                "email": email,
                                "password": password,
                              }), headers: {"Content-Type": "application/json" });

                              if(response.statusCode==200){
                                print("data về là: ${response.body}");

                                Provider.of<LoginProvider>(context)
                                    .changeState();
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Provider.of<CurrentBottomNavigatorProvider>(
                                    context)
                                    .currentIndex = 0;
                              }

                              setState(() {
                                isLogging = 0;
                              });

                            },
                            child: Center(
                              child: Text(
                                'SIGN IN',
                              ),
                            )),
                      ),
                      TextButton(
                          onPressed: () {},
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

                      if(result!=null){

                        print(result);
                        setState(() {
                          _emailController.text=result['email'];
                          _passwordController.text=result['password'];
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


Widget  myTextField(String labelname, TextEditingController controller){
  return  TextField(
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

