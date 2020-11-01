import 'package:app/ulti/data.dart';
import 'package:flutter/material.dart';
import 'package:app/ulti/constain.dart';

class ItemTypeII extends StatelessWidget {
  Course course;
  ItemTypeII({this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          height: heightItem,
          child: Center(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: heightItem,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(course.imgPlaceholder),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.title),
                        course.authors.length == 1
                            ? Text(course.authors[0])
                            : Text(course.authors[0] +
                                ', +' +
                                (course.authors.length - 1).toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(course.level),
                            Text(course.dateRelease),
                            Text(course.hourLearning),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[500],
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[500],
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[500],
                              size: 15,
                            ),
                            Icon(
                              Icons.star_half_outlined,
                              color: Colors.yellow[500],
                              size: 15,
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              color: Colors.yellow[500],
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ));
  }
}
