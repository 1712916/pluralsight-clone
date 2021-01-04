import 'package:flutter/material.dart';

Widget actionButton(String title, Icon icon, Function function) {
  return Container(
    height: 80,
    child: FlatButton(
      onPressed: () {
        function();
      },
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white38,
            ),
            child: icon, //Icons.bookmark_border
            height: 40,
            width: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget actionButton2(String title, Icon icon, Function function) {
  return FlatButton(
      height: 40,
      padding: EdgeInsets.zero,
      color: Colors.white24,
      onPressed: () {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ));
}

Widget simpleButton({String label, Function doFuction}){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.deepPurple[700],
        borderRadius:
        BorderRadius.all(Radius.circular(4.0))),
    child: FlatButton(
        onPressed: () async {
          doFuction();
        },
        child: Center(
          child: Text(
            label.toUpperCase(),
          ),
        )),
  );
}