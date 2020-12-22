import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rateNumber;
  static const int MAX_STAR = 5;
  final double size = 11;

  RatingStar({this.rateNumber});

  List<Widget> renderStar() {
    int starNumber;
    List<Widget> result = [];
    print("here: $rateNumber");

    if (rateNumber == null) {
      result.add(Container());
      return result;
    } else {
      if (rateNumber <= 0) {
        starNumber = 0;
        result.add(Container());
        return result;
      }
      if (rateNumber > MAX_STAR) {
        starNumber = MAX_STAR;
      } else {
        starNumber = rateNumber;
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
      size: this.size,
    );
  }
}

class ChoiceStar extends StatefulWidget {
  double size;
  double rateNumber;

  ChoiceStar({this.size});
  @override
  ChoiceStarState createState() => ChoiceStarState();
}

class ChoiceStarState extends State<ChoiceStar> {

  List<bool> rateNumber = [false, false, false, false, false];
  static const int MAX_STAR = 5;
  static const List<List<bool>> starTemplate = [
    [true, false, false, false, false],
    [true, true, false, false, false],
    [true, true, true, false, false],
    [true, true, true, true, false],
    [true, true, true, true, true],
  ];
  double size = 11.0;

  ChoiceStarState({this.size});

  int getRatePoint(){
    for(int i=0;i<MAX_STAR;i++){
      if(rateNumber[i]){
        return i+1;
      }
    }
    return 0;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    size = widget.size ?? 11.0;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: size,
      child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: (() {
            List<Widget> result = [];
            for (int i = 0; i < MAX_STAR; i++) {
              result.add(GestureDetector(
                child: rateNumber[i] ? starUnitEnable() : starUnitDisable(),
                onTap: () {
                   widget.rateNumber=(i+1).toDouble();

                  setState(() {
                    rateNumber = starTemplate[i];
                  });
                },
              ));
            }
            return result;
          })()),
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
      size: this.size,
    );
  }
}
