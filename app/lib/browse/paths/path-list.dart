import 'package:app/browse/paths/path-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathList extends StatelessWidget {
  List<String> products = [
    "Test1",
    "Test2",
    "Test3",
    "Test1",
    "Test2",
    "Test3",
    "Test1",
    "Test2",
    "Test3",
    "Test1",
    "Test2",
    "Test3"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Paths',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            padding: EdgeInsets.only(left: 5),
          ),
          SizedBox(
            height: 210,
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PathItem(100);
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
