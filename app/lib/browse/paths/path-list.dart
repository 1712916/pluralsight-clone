import 'package:app/browse/paths/path-item.dart';
import 'package:flutter/material.dart';

class PathList extends StatelessWidget {
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
          Row(
            children: [PathItem(), PathItem(), PathItem()],
          ),

        ],
      ),
    ));
  }
}
