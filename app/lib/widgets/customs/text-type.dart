import 'package:app/provider/theme-provider.dart';
import 'package:app/utils/app-color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
TextStyle headerStyle1() {
  return TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
  );
}
TextStyle headerStyle() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle titleStyle(BuildContext context){
  final themeNotifier = Provider.of<ThemeProvider>(context);

  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ((){
        return themeNotifier.getThemeMode()==ThemeMode.dark?AppColors.darkTextTitle:AppColors.lightTextTitle;
      })()

  );
}
TextStyle subTitleStyle(BuildContext context){
  final themeNotifier = Provider.of<ThemeProvider>(context);

  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ((){
      return themeNotifier.getThemeMode()==ThemeMode.dark?AppColors.darkTextSubTitle:AppColors.lightTextSubTitle;
    })()

  );
}

TextStyle success() {
  return TextStyle(

    fontWeight: FontWeight.w400,
    color:  AppColors.success
  );
}
TextStyle failure() {
  return TextStyle(

      fontWeight: FontWeight.w400,
      color:  AppColors.error
  );
}

TextStyle error() {
  return TextStyle(

      fontWeight: FontWeight.w400,
      color: AppColors.error
  );
}


class TextTitle extends StatelessWidget {
  String text;
  TextTitle(this.text);
  @override
  Widget build(BuildContext context) {
    if(text==null){
      text="";
    }
    return Text(
      text,
      style: titleStyle(context),

    );
  }
}
class SubTitle extends StatelessWidget {
  String text;
  SubTitle(this.text);
  @override
  Widget build(BuildContext context) {
    if(text==null){
      text="";
    }
    return Text(
      text,
      style: subTitleStyle(context),

    );
  }
}




Widget buildTextHeader(String text){
  if(text==null){
    text="";
  }
  return Text(
    text,
    style: headerStyle(),
  );
}
Widget buildTextHeader1(String text){
  if(text==null){
    text="";
  }
  return Text(
    text,
    style: headerStyle1(),
  );
}

Widget failureText(String text){
  return Text(
    text,
    style: failure(),
  );
}

Widget successText(String text){
  return Text(
    text,
    style: success(),
  );
}
Widget errorText(String text){
  return Text(
    text,
    style: error(),
  );
}





