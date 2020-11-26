import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  String email;
  String password;
  // Initially password is obscure
  bool _obscureText = true;
  var _controllerEmail = TextEditingController();
  var _controllerName = TextEditingController();
  var _controllerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _controllerEmail.clear();
                            this.email = '';
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple[700])),
                        labelText: 'Email',
                      ),
                      onChanged: (text) {
                        setState(() {
                          this.email = text;
                          print('Email la: $email');
                        });
                      },
                      onSubmitted: (v){
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _controllerName,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _controllerName.clear();
                            this.email = '';
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple[700])),
                        labelText: 'Name',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _controllerPhone,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _controllerPhone.clear();
                            this.email = '';
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.deepPurple[700])),
                        labelText: 'Phone number',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.lock
                                : Icons.lock_open),
                          )),
                      obscureText: _obscureText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.lock
                                : Icons.lock_open),
                          )),
                      obscureText: _obscureText,
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
              )),
            ),
          ),
        ),
      ),
    );
  }
}
