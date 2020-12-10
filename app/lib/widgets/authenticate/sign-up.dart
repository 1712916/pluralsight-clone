import 'dart:convert';

import 'package:app/strings/string-us.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constain.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  // Initially password is obscure
  bool _obscureText;
  bool _obscureText2;
  bool _validateConfirmPassword = false; //check password
  int _statusRegister;
  TextEditingController _emailCotroller;
  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  doRegister() async {
    //check password vs confirmPassword;
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _validateConfirmPassword = true;
      });
      return;
    }

    //
    print("usename: ${this._nameController.text}");
    var response = await http.post(API+"user/register", body: jsonEncode({
      "username": this._nameController.text,
      "email": this._emailCotroller.text,
      "phone":this._phoneController.text,
      "password": this._passwordController.text,
    }), headers: {"Content-Type": "application/json" });

    setState(() {
      _statusRegister=response.statusCode;
    });

    if(_statusRegister==200){
      Navigator.pop(context, {"email": this._emailCotroller.text, "password": this._passwordController.text});
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText2 = true;
    _obscureText = true;
    _emailCotroller = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  myTextField("Email", _emailCotroller),
                  SizedBox(
                    height: 20,
                  ),
                  myTextField("Name", _nameController),
                  SizedBox(
                    height: 20,
                  ),
                  myTextField("Phone number", _phoneController),
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
                    height: 20,
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    onChanged: (text){
                      if(_validateConfirmPassword){
                        setState(() {
                          _validateConfirmPassword=false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        errorText: _validateConfirmPassword
                            ? validate_confirm_password
                            : null,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        labelText: 'Confirm password',
                        labelStyle: TextStyle(
                          color: AppColors.secondaryColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                          },
                          icon: Icon(
                            _obscureText2 ? Icons.lock : Icons.lock_open,
                            color: AppColors.secondaryColor,
                          ),
                        )),
                    obscureText: _obscureText2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _statusRegister==400?Text(failed_register):(_statusRegister==200?Text(succeed_register):Container()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[700],
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: FlatButton(
                        onPressed: () => {this.doRegister()},
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
