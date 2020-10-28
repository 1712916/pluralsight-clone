import 'package:flutter/material.dart';

AppBar CustomAppBar(title) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: Icon(Icons.account_circle),
        tooltip: 'Profile',
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.more_vert),
        tooltip: 'Setting',
        onPressed: () {},
      ),
    ],
  );
}
