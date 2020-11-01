import 'package:app/ulti/data.dart';
import 'package:flutter/material.dart';

import '../custom-appbar.dart';
import 'item.dart';

class Downloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Downloads'),
      body: DownloadsPage(),
    );
  }
}

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  List<Course> _downloads = getCourses();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          print('Hello');
          return;
        },
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_downloads.length} courses',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(onPressed: () {}, child: Text('REMOVE ALL'))
              ],
            ),
            Column(
              children: _downloads
                  .map((course) => Padding(
                        padding: EdgeInsets.all(8),
                        child: ItemTypeII(course: course),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
