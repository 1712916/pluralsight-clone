import 'package:app/models/author.dart';
import 'package:app/models/course.dart';
import 'package:app/models/data.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:app/widgets/main_screen/browse/paths/path-row.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-list.dart';
import 'package:app/widgets/main_screen/home/builderlist.dart';
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


           BuilderList(category: CourseCategory(title:'New in ${this.skill.name}' ),
           courses: newCourses,),
            BuilderList(category: CourseCategory(title:'Trending in ${this.skill.name}' ),
              courses: trendingCourses,),

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
