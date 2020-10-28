import 'package:app/browse/browse.dart';
import 'package:app/browse/gridbutton/grid-button.dart';
import 'package:app/sign-in.dart';
import 'package:app/sign-up.dart';
import 'package:flutter/material.dart';

import 'browse/coursedetail/detail.dart';
import 'main-navigate.dart';
import 'ulti/app-color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      theme: myTheme,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData myTheme =
    ThemeData(accentColor: Colors.grey, primaryColor: AppColors.primary);
