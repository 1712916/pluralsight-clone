import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/widgets/customs/custom-appbar.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                Provider.of<CurrentBottomNavigatorProvider>(context).update(2);

              },
              child: Icon(Icons.apps_sharp,size: 30,),
            ),
            SizedBox(height: 36,),
            Center(child: buildTextTitle(browse_intro_in_home_logout)),
            SizedBox(height: 72,),
            GestureDetector(
              onTap: (){
                //navigate to search
                //navigate to browse
                Provider.of<CurrentBottomNavigatorProvider>(context).update(3);
              },
              child: Icon(Icons.search,
              size: 30,),
            ),
            SizedBox(height: 36,),
            Center(child: buildTextTitle(search_in_home_logout)),

          ],
        ),
      ),
    );
  }
}
