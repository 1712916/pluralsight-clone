import 'package:app/browse/paths/path-list.dart';
import 'package:app/browse/popularskills/popular-skills.dart';
import 'package:app/browse/topauthors//author-list.dart';
import 'package:flutter/material.dart';

import 'topauthors//author-item.dart';
import 'button.dart';
class Browse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Browse'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10,0),
        child: SingleChildScrollView(
          child: Container(
            child:  Column(
              children: [
                MyButton(title: 'NEW\nRELEASES',route: 'hello',),
                SizedBox(height: 10,),
                MyButton(title: 'RECOMMENDED\nFOR YOU',route: 'hello',),
                PopularSkills(),
                PathList(),
                AuthorList(),
                AuthorList(),
                AuthorList(),
                AuthorList(),
              ],
            ),
          ),
        )

      ),
    );
  }
}
