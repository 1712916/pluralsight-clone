import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/utils/app-theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main-navigate.dart';
import 'models/login-provider.dart';

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
      home:
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>LoginProvider()),
            ChangeNotifierProvider(create: (context)=>CurrentBottomNavigatorProvider()),
          ],
          child: MainNavigate(),
        ),

      debugShowCheckedModeBanner: false,

    );
  }
}