import 'package:flutter/material.dart';

class PopularSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Populars skills',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          padding: EdgeInsets.only(left: 5),
        ),
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 5),
                child: InputChip(
                  onPressed: () {},
                  label: Semantics(
                    button: true,
                    child: Text('My Input Chip'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    ));
  }
}
