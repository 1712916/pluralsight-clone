import 'package:flutter/material.dart';

import 'app-color.dart';

class AppTheme {
  get darkTheme => ThemeData(
        primaryColor: AppColors.primaryDark,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.textGrey),
          labelStyle: TextStyle(color: AppColors.white),
        ),
        brightness: Brightness.dark, //text color
        canvasColor: AppColors.darkBackground, //background
        accentColor: AppColors.white,
        accentColorBrightness: Brightness.dark,
        accentIconTheme: IconThemeData(color: Colors.white),
      );

  get lightTheme => ThemeData(
        primaryColor: AppColors.secondaryColor,
        canvasColor: AppColors.lightBackground, //backgroun
        appBarTheme: AppBarTheme(brightness: Brightness.light),
      );
}

const lightTextStyle = TextStyle(color: Colors.black);
