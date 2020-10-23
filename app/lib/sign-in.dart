import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  String email;
  String password;
  // Initially password is obscure
  bool _obscureText = true;
  var _controller = TextEditingController();

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
                      Theme(
                          data: ThemeData(primaryColor: Colors.deepPurple[700]),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: (){

                                  _controller.clear();
                                  this.email='';
                                },
                              ),

                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple[700])),
                              labelText: 'Email',

                            ),
                            onChanged: (text){
                              setState(() {
                                this.email=text;
                                print('Email la: $email');
                              });
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Theme(
                          data: ThemeData(primaryColor: Colors.deepPurple[700]),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _obscureText=!_obscureText;
                                });
                              },
                              icon: Icon(_obscureText ? Icons.lock : Icons.lock_open) ,
                            )),
                            obscureText: _obscureText,

                          )),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: FlatButton(
                            child: Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                      ),
                      TextButton(
                          onPressed: null, child: Text('FORGOT PASSWORD?')),
                    ],
                  ),
                )),
                TextButton(onPressed: null, child: Text('CREATE NEW ACCOUNT')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
