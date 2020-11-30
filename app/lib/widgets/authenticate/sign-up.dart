import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignUp> {


  // Initially password is obscure
  bool _obscureText;
  bool _obscureText2;
  TextEditingController _emailCotroller;
  TextEditingController _nameController ;
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText2=true;
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
                  myTextField("Email",_emailCotroller),
                  SizedBox(
                    height: 20,
                  ),
                  myTextField("Name",_nameController),
                  SizedBox(
                    height: 20,
                  ),
                  myTextField("Phone number",_phoneController),
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
                    controller: _passwordController,
                    decoration: InputDecoration(
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[700],
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: FlatButton(
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
