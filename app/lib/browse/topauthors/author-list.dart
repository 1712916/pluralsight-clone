import 'package:flutter/material.dart';

import 'author-item.dart';
class AuthorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('Top authors'
              ,style: TextStyle(
                color: Colors.white,
                fontSize: 20,

              ),
          ),
          padding: EdgeInsets.only(left: 5),

          ),
          Row(
            children: [ AuthorItem(authorName: 'My coal',imageUrl: 'assets/avt.jpg',),
              AuthorItem(authorName: 'My coal',imageUrl: 'assets/avt.jpg',),
              AuthorItem(authorName: 'My coal',imageUrl: 'assets/avt.jpg',)],
          )

        ],
      ),
    );
  }
}
