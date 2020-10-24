import 'package:app/browse/gridbutton/grid-button.dart';
import 'package:app/browse/paths/path-list.dart';
import 'package:app/browse/popularskills/popular-skills.dart';
import 'package:app/browse/topauthors//author-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        padding: EdgeInsets.fromLTRB(10, 10, 0,0),
        child: SingleChildScrollView(
          child: Container(
            child:  Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MyButton(title: 'NEW\nRELEASES',route: 'hello',),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child:  MyButton(title: 'RECOMMENDED\nFOR YOU',route: 'hello',),
                ),

                SizedBox(height: 10,),
                GridButton(),
                PopularSkills(),
                PathList(),
                AuthorList(),
              ],
            ),
          ),
        )

      ),
    );
  }
}
