import 'package:flutter/material.dart';
class AuthorItem extends StatelessWidget {

  final String authorName;
  final String imageUrl;

  const AuthorItem({Key key, this.authorName, this.imageUrl}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(

      child:Padding(
        padding: EdgeInsets.all(5),
        child:  Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(this.imageUrl),
              radius: 40.0,
            ),
            Text(this.authorName
              ,style: TextStyle(
                color: Colors.white,
                fontSize: 20,

              ),)
          ],
        ),
      )

    );
  }
}
