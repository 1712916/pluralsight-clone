import 'package:app/browse/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PathItem extends Item {
  PathItem(double height) : super(height);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child:Padding(
        padding: EdgeInsets.all(5),
        child: Column(children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/avt.jpg'),
            ),
            color: Colors.blueGrey ,
          )
          ,
          Container(
            height: 100,
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Titleaaaa aaaha haahahajaj ajaja'
                  ,style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),),
                Text('total courses' ,style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                ),),
              ],
            ),
          )
        ],),
      )
      
    );
  }
}
