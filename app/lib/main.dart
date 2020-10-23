
import 'package:app/browse/browse.dart';
import 'package:app/sign-in.dart';
import 'package:app/sign-up.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      home: SignUp(),

    );
  }
}
