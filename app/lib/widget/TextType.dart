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

Widget buildTextTitle(String text){
  return Text(
    text,
    style: titleStyle(),
  );
}

Widget buildSubTextTitle(String text){
  return Text(
    text,
    style: subTitleStyle(),
  );
}

Widget buildTextHeader(String text){
  return Text(
    text,
    style: headerStyle(),
  );
}
Widget buildTextHeader1(String text){
  return Text(
    text,
    style: headerStyle1(),
  );
}

