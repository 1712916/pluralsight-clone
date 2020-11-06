import 'package:app/ulti/data.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  Author _author;

  AuthorDetail(this._author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.0,
            ),
            Text(_author.name),
            Text('Pluralsight Author'),
            RaisedButton(onPressed: (){}, child: Text('FOLLOW'),),
            Text('Follow t be notified when new courses are published.'),
            //description
            //Link
            //3 cai icon
            //Title Course
            //Tat ca khoa hoc cua author

          ],
        ),
      ),
    );
  }
}
