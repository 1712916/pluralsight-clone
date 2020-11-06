import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  double _rating;

  RatingStar(this._rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow[500],
            size: 15,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
            size: 15,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
            size: 15,
          ),
          Icon(
            Icons.star_half_outlined,
            color: Colors.yellow[500],
            size: 15,
          ),
          Icon(
            Icons.star_border_outlined,
            color: Colors.yellow[500],
            size: 15,
          ),
        ],
      ),
    );
  }
}

