import 'package:app/models/course.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final String route;

  const MyButton({Key key, this.title, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SuggesionCourse(getRecommended())));
        },
        child: Text(
          this.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

List<Course> getRecommended() {
  return [];
}

class SuggesionCourse extends StatelessWidget {
  List<Course> data;

  SuggesionCourse(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
            children: [
              Container(height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SafeArea(child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context);}))
            ],
            ),
             //build list
          ],
        ),
      )
    );
  }
}
