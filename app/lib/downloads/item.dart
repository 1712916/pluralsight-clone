import 'package:app/ulti/data.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';
import 'package:app/ulti/constain.dart';

class CourseItemTypeB extends StatelessWidget {
  static List<String> _choices = <String>[
    "Unbookmark",
    "Add to channel",
    "Remove Download"
  ];

  Course course;
  CourseItemTypeB({this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(

          ),
          height: heightItem,
          child: Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                      height: heightItem * 2 / 3,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(course.imgPlaceholder),
                            fit: BoxFit.fitWidth),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextTitle(course.title),
                      course.authors.length == 1
                          ? buildSubTextTitle(course.authors[0])
                          : buildSubTextTitle(course.authors[0] +
                              ', +' +
                              (course.authors.length - 1).toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSubTextTitle(course.level),
                          buildSubTextTitle(course.dateRelease),
                          buildSubTextTitle(course.hourLearning),
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
                          SizedBox(
                            width: 20,
                          ),
                          buildSubTextTitle('(${course.numsVote})')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                  color: Colors.green,
                  offset: Offset(200, 100),
                  tooltip: 'Setting More',
                  onSelected: _select,
                  itemBuilder: (BuildContext context) {
                    return _choices.map((String choice) {
                      return PopupMenuItem<int>(
                        value: _choices.indexOf(choice),
                        child: Text(choice),
                      );
                    }).toList();
                  }),
            ],
          ),
        ));
  }

  void _select(int choiceIndex) {
    switch (choiceIndex) {
      case 0:
        {
          print('Ban da chon: {$choiceIndex}');
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      default:
        {}
        break;
    }
  }
}
