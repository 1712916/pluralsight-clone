// import 'package:app/utils/constraints.dart';
// import 'package:app/widgets/customs/text-type.dart';
// import 'package:app/widgets/main_screen/browse/paths/path-detail.dart';
// import 'package:flutter/material.dart';
// import '../../../../models/data.dart';
// class PathItem extends StatelessWidget {
//   final Path path;
//
//
//   PathItem({this.path});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (
//         context)=> PathDetail(path: this.path,)));
//       },
//       child: Container(
//           width: 200,
//           child: Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 child: Image(
//                   image: NetworkImage(this.path.imgPlaceholder),
//                 ),
//               color: Colors.white24,
//               ),
//               Container(
//                 height: 100,
//                 color: Theme.of(context).primaryColor,
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     buildTextTitle(this.path.title),
//                     buildSubTextTitle('${this.path.numberCourses} courses')
//                   ],
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
//
//
// class PathItemB extends StatelessWidget {
//   final Path path;
//
//   PathItemB({this.path});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (
//             context)=> PathDetail(path: this.path,)));
//       },
//       child: Container(
//           height: heightItem,
//           child: Row(
//             children: [
//               Container(
//                 height: heightItem*2/3,
//                 width: 100,
//                 child: Image(
//                   image: NetworkImage(this.path.imgPlaceholder),
//                 ),
//               ),
//               Container(
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     buildTextTitle(this.path.title),
//                     SizedBox(height: 8,),
//                     buildSubTextTitle('${this.path.numberCourses} courses')
//                   ],
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }