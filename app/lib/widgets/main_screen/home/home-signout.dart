import 'package:app/strings/string-us.dart';
import 'package:app/widgets/customs/custom-appbar.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';

class HomeSignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Home'),
      body: RefreshIndicator(
        onRefresh: () async{},
        child: ListView(

          children: [
            SizedBox(height: 72,),
            Center(child: buildTextHeader1(get_started_in_home_logout)),
            SizedBox(height: 72,),
            GestureDetector(
              onTap: (){
                //navigate to browse

              },
              child: Icon(Icons.apps_sharp),
            ),
            SizedBox(height: 36,),
            Center(child: buildTextTitle(browse_intro_in_home_logout)),
            SizedBox(height: 72,),
            GestureDetector(
              onTap: (){
                //navigate to search
              },
              child: Icon(Icons.search),
            ),
            SizedBox(height: 36,),
            Center(child: buildTextTitle(search_in_home_logout)),

          ],
        ),
      ),
    );
  }
}
