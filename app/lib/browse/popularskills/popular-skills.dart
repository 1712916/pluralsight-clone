import 'package:app/browse/popularskills/about-skill.dart';
import 'package:app/ulti/data.dart';
import 'package:flutter/material.dart';

class PopularSkills extends StatelessWidget {
  List<String> skills = [
    'Python',
    'C++',
    'Javascript',
    'Dart',
    'Java',
    'R',
    'C',
    'C#',
    'Assembly',
    'PHP'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Text(
              'Populars skills',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 8,),

        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: skills
                .map(
                  (skill) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InputChip(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context)=> AboutSkill(skill:   Skill(name: skill),)));

                      },
                      label: Semantics(
                        button: true,
                        child: Text(skill),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 32,)
      ],
    ));
  }
}
