import 'package:app/browse/topauthors/author-detail.dart';
import 'package:app/ulti/data.dart';
import 'package:app/widget/TextType.dart';
import 'package:flutter/material.dart';
class AuthorItem extends StatelessWidget {
  Author _author;
  AuthorItem(this._author);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorDetail(this._author)),
        );
      },
      child: Container(

        child:Padding(
          padding: EdgeInsets.all(5),
          child:  Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(this._author.avt),
                radius: 40.0,
              ),
              Text(this._author.name
                ,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),)
            ],
          ),
        )

      ),
    );
  }
}

class AuthorItemB extends StatelessWidget {
  Author _author;
  AuthorItemB(this._author);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorDetail(this._author)),
        );
      },
      child: Container(

          child:Row(
            children: [
              SizedBox(width: 32,),
              CircleAvatar(
                backgroundImage: NetworkImage(this._author.avt),
                radius: 30.0,
              ),
              SizedBox(width: 32,),
              Column(
                children: [
                  buildTextTitle(this._author.name),
                  SizedBox(height: 8,),
                  buildSubTextTitle('15 courses')
                ],
              )
             
            ],
          )

      ),
    );
  }
}
