import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';
class GridButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*24 is for notification bar on Android*/

    return
      Container(
        height: 170,

        child: GridView.count(crossAxisCount: 2,
          scrollDirection: Axis.horizontal,
          childAspectRatio:  0.5,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,bottom: 5),
              child: MyButton (title:'Hello 1',route:'widget.home'),
            ),

          ],
      ) );

        }
  }


