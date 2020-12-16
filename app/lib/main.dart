 import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/instructors-response-model.dart';
import 'package:app/services/instructor-services.dart';
import 'package:app/utils/app-theme.dart';
import 'package:app/widgets/main_screen/browse/browse.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'main-navigate.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My app',
//       theme: AppTheme().lightTheme,
//       darkTheme: AppTheme().darkTheme,
//       themeMode: ThemeMode.dark, //Change theme here
//       home: ChangeNotifierProvider(
//           create: (context)=>CurrentBottomNavigatorProvider(),
//           child: MainNavigate()),
//       debugShowCheckedModeBanner: false,
//
//     );
//   }
// }


 class MyApp extends StatelessWidget {

   // This widget is the root of your application.


   @override
   Widget build(BuildContext context) {

     return MaterialApp(
       title: 'My app',
       theme: AppTheme().lightTheme,
       darkTheme: AppTheme().darkTheme,
       themeMode: ThemeMode.dark, //Change theme here
       home: Browse(),
       debugShowCheckedModeBanner: false,

     );
   }
 }