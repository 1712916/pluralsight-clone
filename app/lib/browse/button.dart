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
      decoration:
      BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
            fit:BoxFit.cover,
          ),
      ),
      child: FlatButton(

        onPressed: (){
          print('Clicked me!');
        },
        child: Text(this.title
          ,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20.0

          ),
          textAlign: TextAlign.center,
        ),

      ),
    );
  }
}
