import 'package:flutter/material.dart';
import 'package:app/string/string-us.dart';

Widget diconnectTypeA() {
  return Center(
    child: Column(
      children: [
        Icon(Icons.warning_rounded),
        Text(dicconnectTitleA),
        Text(dicconnectSubTitleA),
        SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child: Text(tryAgain),
        ),
        OutlineButton(
            onPressed: () {},
            child: Text(contact),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(4.0)))
      ],
    ),
  );
}

Widget diconnectTypeB() {
  return Center(
    child: Column(
      children: [
        Icon(Icons.warning_rounded),
        Text(dicconnectTitleB),
        Text(dicconnectSubTitleB),
        SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child: Text(tryAgain),
        ),
      ],
    ),
  );
}
