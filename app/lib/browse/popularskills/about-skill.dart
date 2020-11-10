import 'package:app/browse/paths/path-item.dart';
import 'package:app/browse/paths/path-row.dart';
import 'package:app/browse/topauthors/author-item.dart';
import 'package:app/browse/topauthors/author-list.dart';
import 'package:app/home/builderlist.dart';
import 'package:app/home/item.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';

class AboutSkill extends StatelessWidget {
  static String routName='/about-skill';
  Skill  skill;
  List<Path> paths=Paths;
  List<Course> newCourses=Courses;
  List<Course> trendingCourses=Courses;
  List<Author> authors=Authors;


  AboutSkill({this.skill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.skill.name),
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildTextHeader('Paths in ${this.skill.name}'),
            ),

            SizedBox(height: 8,),
            buildRowPaths(paths),


           BuilderList(category: Category(title:'New in ${this.skill.name}' ),
           data: newCourses,),
            BuilderList(category: Category(title:'Trending in ${this.skill.name}' ),
              data: trendingCourses,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildTextHeader('Top authors in ${this.skill.name}'),
            ),
            SizedBox(height: 8,),
            buildRowAuthors(authors),

          ],
        ),
      ),
    );
  }
}
