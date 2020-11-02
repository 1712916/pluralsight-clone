import 'package:app/browse/browse.dart';
import 'package:app/browse/gridbutton/grid-button.dart';
import 'package:app/search/search-result.dart';
import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/authenticate/sign-in.dart';
import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/authenticate/sign-up.dart';
import 'package:flutter/material.dart';

import 'browse/coursedetail/detail.dart';
import 'main-navigate.dart';
import 'ulti/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.dark, //Change theme here

       home: MainNavigate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
