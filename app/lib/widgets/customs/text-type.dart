import 'package:app/utils/app-color.dart';
import 'package:flutter/material.dart';
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

TextStyle titleStyle(){
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
TextStyle subTitleStyle(){
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey
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

Widget buildTextTitle(String text){
  if(text==null){
    text="";
  }
  return Text(
    text,
    style: titleStyle(),

  );
}

Widget buildSubTextTitle(String text){
  if(text==null){
    text="";
  }
  return Text(
    text,
    style: subTitleStyle(),
  );
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





