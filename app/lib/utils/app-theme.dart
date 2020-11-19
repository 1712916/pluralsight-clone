import 'package:flutter/material.dart';

import 'app-color.dart';

class AppTheme {
  get darkTheme => ThemeData(
    // primaryColor: AppColors.primaryDark,
    //    appBarTheme: AppBarTheme(
    //       brightness: Brightness.dark ),
      inputDecorationTheme: InputDecorationTheme(
        // hintStyle: TextStyle(color: AppColors.textGrey),
        // labelStyle: TextStyle(color: AppColors.white),
      ),
      brightness: Brightness.dark, //text color
     canvasColor: AppColors.backgroundDark, //background
      // accentColor: AppColors.darkPink,
      accentIconTheme: IconThemeData(color: Colors.white),
      );

  get lightTheme => ThemeData(
      // primarySwatch: Colors.grey,
      // appBarTheme:
      //     AppBarTheme(brightness: Brightness.light, color: AppColors.grey2,),
      // inputDecorationTheme: InputDecorationTheme(
      //   hintStyle: TextStyle(color: AppColors.textGrey),
      //   labelStyle: TextStyle(color: AppColors.white),
      // ),
      // canvasColor: AppColors.white,
      // brightness: Brightness.light,
      // accentColor: AppColors.grey2,
      // accentIconTheme: IconThemeData(color: Colors.black),
      );
}
