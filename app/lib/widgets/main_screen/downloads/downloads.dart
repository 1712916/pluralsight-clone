// import 'package:app/models/course.dart';
// import 'package:app/widgets/authenticate/settings.dart';
// import 'package:app/widgets/course_detail/detail.dart';
// import 'package:app/widgets/main_screen/home/course-item.dart';
// import 'package:flutter/material.dart';
// import '../../customs/custom-appbar.dart';
// import '../../authenticate/profile.dart';
//
// class Downloads extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       onGenerateRoute: (RouteSettings settings) {
//         return MaterialPageRoute(
//             settings: settings,
//             builder: (context) {
//               switch (settings.name) {
//                 case '/':
//                   return MyDownloads();
//                 case CourseDetail.routeName:
//                   return CourseDetail(null);
//                 case Profile.routeName:
//                   return Profile();
//                 case Settings.routeName:
//                   return Settings();
//                 default:
//                   return MyDownloads();
//               }
//             });
//       },
//     );
//   }
// }
//
// class MyDownloads extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar('Downloads'),
//       body: DownloadsPage(),
//     );
//   }
// }
//
// class DownloadsPage extends StatefulWidget {
//   @override
//   _DownloadsPageState createState() => _DownloadsPageState();
// }
//
// class _DownloadsPageState extends State<DownloadsPage> {
//   List<Course> _downloads = Courses;
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//         onRefresh: () async {
//           print('Hello');
//           return;
//         },
//         child: ListView(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '${_downloads.length} courses',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   TextButton(onPressed: () {}, child: Text('REMOVE ALL'))
//                 ],
//               ),
//             ),
//             Column(
//               children: _downloads
//                   .map((course) => Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Column(
//                           children: [
//                             HorizontalCourseItem(course: course),
//                             Divider(
//                               color: Colors.grey,
//                             )
//                           ],
//                         ),
//                       ))
//                   .toList(),
//             )
//           ],
//         ));
//   }
// }
