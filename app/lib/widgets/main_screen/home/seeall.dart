// import 'package:app/models/course-provider.dart';
// import 'package:app/models/course.dart';
// import 'package:app/widgets/main_screen/home/course-item.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../customs/text-type.dart';
//
// class ListCourse extends StatelessWidget {
//   static const String routeName='/see-all';
//
//   final String categoryId;
//   final String categoryName;
//
//   ListCourse({this.categoryId,this.categoryName});
//
//   @override
//   Widget build(BuildContext context) {
//     List<Course> courses;
//     if(categoryName!="Bookmarks"){
//      courses=Provider.of<CourseProvider>(context).findCourseByCategoryId(categoryId, -1);
//     }else{
//       courses=Provider.of<BookmarkProvider>(context).courses;
//     }
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Container(
//               padding: EdgeInsets.all(16),
//               height: 70,
//               child: buildTextHeader1(categoryName),
//             ),
//             Expanded(child: ListView(
//               children: courses
//                   .map((course) => Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   children: [
//                     HorizontalCourseItem(course: course),
//
//                     Divider(
//
//                       color: Colors.grey,
//                     )
//                   ],
//                 ),
//               ))
//                   .toList(),
//             ), )
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
