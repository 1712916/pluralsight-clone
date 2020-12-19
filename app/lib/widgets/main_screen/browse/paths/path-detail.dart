//  import 'package:app/utils/constraints.dart';
// import 'package:app/widgets/customs/expandable.dart';
// import 'package:app/widgets/main_screen/home/course-item.dart';
// import 'package:flutter/material.dart';
// import '../../../customs/text-type.dart';
// import '../../../../models/data.dart';
// const List<String> choices = <String>[
//   "Add to channel",
//   "Share path",
// ];
//
// class PathDetail extends StatelessWidget {
//   static const String routeName = '/path';
//   final Path path;
//   final List<Course> courses = Courses;
//
//   PathDetail({this.path});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(this.path.title),
//         actions: [
//           PopupMenuButton(
//               tooltip: 'Setting More',
//               onSelected: _select,
//               itemBuilder: (context) {
//                 return choices.map((String choice) {
//                   return PopupMenuItem<int>(
//                     value: choices.indexOf(choice),
//                     child: Text(choice),
//                   );
//                 }).toList();
//               })
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 16,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 120,
//                     height: heightItem,
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: 100,
//                       height: heightItem*2/3,
//                       child: Image(
//                         image: NetworkImage(this.path.imgPlaceholder),
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),
//
//                   ),
//                   SizedBox(width: 8,),
//                   Expanded(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildTextHeader1(this.path.title),
//                       SizedBox(height: 8,),
//                       Text(
//                           '${path.numberCourses} courses - ${path.learningTime} hours')
//                     ],
//                   )),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: TextExpandable(this.path.description),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildTextHeader('Your Progress: 0%'),
//                   LinearProgressIndicator(
//                     value: 0,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: buildTextTitle(this.path.title),
//             ),
//             Column(
//               children: courses
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
//         ),
//       ),
//     );
//   }
//
//   void _select(int choiceIndex) {
//     switch (choiceIndex) {
//       case 0:
//         {}
//         break;
//       case 1:
//         {}
//         break;
//       case 2:
//         {}
//         break;
//       default:
//         {}
//         break;
//     }
//   }
// }
