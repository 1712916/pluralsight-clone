import 'package:flutter/material.dart';
import 'package:app/strings/string-us.dart';

Widget diconnectTypeA() {
  return Center(
    child: Column(
      children: [
        Icon(Icons.warning_rounded),
        Text(sorry),
        Text(unexpectedHappened),
        SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child: Text(tryAgain),
        ),
        OutlineButton(
            onPressed: () {},
            child: Text(contactUs),
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
        Text(youAreOffline),
        Text(tryConnectInternet),
        SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child: Text(tryAgain),
        ),
      ],
    ),
  );
}
