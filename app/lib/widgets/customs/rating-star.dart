import 'package:flutter/material.dart';


class RatingStar extends StatelessWidget {
  final int rateNumber;
  static const int MAX_STAR = 5;
  final double size=11;

  RatingStar({this.rateNumber});

  List<Widget> renderStar() {
     int starNumber;
    List<Widget> result = [];
    print("here: $rateNumber");

    if(rateNumber==null){
       result.add(Container());
       return result;
    }else{
      if (rateNumber <= 0 ) {
        starNumber = 0;
        result.add(Container());
        return result;
      }
      if (rateNumber > MAX_STAR) {
        starNumber = MAX_STAR;
      }else{
        starNumber=rateNumber;
      }

      for (int i = 0; i < starNumber; i++) {
        result.add(starUnitEnable());
      }
      for (int i = starNumber; i < MAX_STAR; i++) {
        result.add(starUnitDisable());
      }
    }

    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: this.renderStar(),
      ),
    );
  }

  Widget starUnitEnable() {
    return Icon(
      Icons.star,
      color: Colors.yellow[500],
      size: this.size,
    );
  }

  Widget starUnitDisable() {
    return Icon(
      Icons.star_border_outlined,
      color: Colors.yellow[500],
      size:  this.size,
    );
  }
}

