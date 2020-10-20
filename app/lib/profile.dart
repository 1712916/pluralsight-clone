import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avt.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0,),
                Text('Kieu Phong', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(width: 20.0,),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Activity insights (last 30 days)',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'TOTAL ACTIVE DAYS',
              style: TextStyle(
                color: Colors.grey[500],

              ),
            ),
            SizedBox(height: 5.0,),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Text(
                    '0 day streak',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 20.0,
            ),
            Text(
              'MOST ACTIVE TIME OF DAY',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              '10:00 PM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'MOST VIEWED SUBJECT',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              'Python',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

