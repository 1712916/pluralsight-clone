import 'package:app/browse/paths/path-row.dart';
import 'package:app/ulti/data.dart';
import 'package:flutter/material.dart';

class AllPath extends StatelessWidget {
  static const String routeName = '/all-path';
  List<PathCategory> categories=pathCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paths'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return PathRow(pathCategory: categories[index],paths: Paths,);
        },
      ),
    );
  }
}
