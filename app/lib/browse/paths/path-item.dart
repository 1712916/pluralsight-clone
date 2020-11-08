 
import 'package:app/ulti/app-color.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';
import 'package:app/ulti/data.dart';
class PathItem extends StatelessWidget {
  final Path path;


  PathItem({this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: Image(
                image: NetworkImage(this.path.imgPlaceholder),
              ),
            color: Colors.white24,
            ),
            Container(
              height: 100,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitle(this.path.title),
                  buildSubTextTitle('${this.path.numberCourses} courses')
                ],
              ),
            )
          ],
        ));
  }
}
