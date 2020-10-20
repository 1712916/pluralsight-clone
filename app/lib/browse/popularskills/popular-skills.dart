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
          Row(
            children: [InputChip(
              onPressed: () {},
              label: Semantics(
                button: true,
                child: Text('My Input Chip'),
              ),
            ),
              InputChip(
                onPressed: () {},
                label: Semantics(
                  button: true,
                  child: Text('My Input Chip'),
                ),
              ),
              InputChip(
                onPressed: () {},
                label: Semantics(
                  button: true,
                  child: Text('My Input Chip'),
                ),
              ),],
          ),
        ],
      )

    );
  }
}
