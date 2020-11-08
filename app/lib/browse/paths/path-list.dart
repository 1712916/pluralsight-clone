import 'package:app/browse/paths/path-item.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';
import 'package:app/ulti/data.dart';

class PathList extends StatelessWidget {
  List<Path> _paths;

  PathList(this._paths);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTextHeader('Paths'),
              TextButton(
                  onPressed: () {
                    // List<Course> data = this.searchAll();
                    // //truyen data vao navigte
                    // //goi navigate here
                    // // Navigator.pushNamed(context, CourseDetail.routeName,
                    // //     arguments: widget.course.title);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ListCourse(
                    //           categoryName: this.category.title,
                    //           courses: data,
                    //         )));
                  },
                  child: Text(
                    'See all >',
                    style: TextStyle(color: Colors.white38),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: paths
                .map((path) => Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: PathItem(
                        path: path,
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    ));
  }
}
