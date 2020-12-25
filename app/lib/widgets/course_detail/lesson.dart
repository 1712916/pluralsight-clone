// import 'dart:convert';
//
// import 'package:app/models/login-provider.dart';
// import 'package:app/services/payment-services.dart';
// import 'package:app/widgets/customs/loading-process.dart';
// import 'package:app/widgets/customs/text-type.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:provider/provider.dart';
//
// class Lesson extends StatefulWidget {
//   String courseId;
//   Lesson({this.courseId});
//   @override
//   _LessonState createState() => _LessonState();
// }
//
// class _LessonState extends State<Lesson> {
//   bool isBought=false;
//   bool isLoading=false;
//   int buyStatus=-1;
//
//
//   @override
//   Widget build(BuildContext context) {
//     String token=Provider.of<LoginProvider>(context).userResponseModel.token;
//     (() async {
//
//       Response res= await PaymentServices.getCourseInfo(token: token,courseId: this.widget.courseId);
//       if(res.statusCode==200){
//         bool isBoughtStatus=jsonDecode(res.body)["didUserBuyCourse"];
//         if(isBoughtStatus){
//           setState(() {
//             isBought=true;
//           });
//         }
//       }
//
//     })();
//
//
//     return isBought?Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ((){
//               if(buyStatus==-1){
//                 return Container();
//               }
//
//               if(buyStatus==400){
//                 return errorText("Người dùng đã từng đăng ký khóa học này hoặc khóa học này không miễn phí");
//               }else{
//                 return errorText("Đã xảy ra lỗi!");
//               }
//
//             })(),
//
//             RaisedButton(onPressed: ()  async {
//               setState(() {
//                 isLoading=true;
//               });
//               Response res= await PaymentServices.getFreeCourses(token: token,courseId: this.widget.courseId);
//               if(res.statusCode==200){
//                 setState(() {
//                   isBought=true;
//                 });
//               }else if(res.statusCode==400){
//                 setState(() {
//                   buyStatus=400;
//                 });
//               }
//               buyStatus=res.statusCode;
//               setState(() {
//                 isLoading=false;
//               });
//             },child: isLoading? Center(
//               child: circleLoading(),
//             ) :Text(((){
//               if(buyStatus==-1){
//                 return "Đăng ký khóa học";
//               }
//               return "Thử lại";
//             })() ),),
//           ],
//         ),
//       ),
//     ):DefaultTabController(
//       length: 2,
//
//       child:  // SliverPadding(
//       //   padding: EdgeInsets.all(16),
//       //   sliver: SliverAppBar(
//       //     elevation: 0,
//       //     backgroundColor: AppColors.backgroundItemTypeA,
//       //     pinned: true,
//       //     toolbarHeight: 0,
//       //     bottom: TabBar(
//       //       tabs: [
//       //         Tab(text: "CONTENTS"),
//       //         Tab(text: "TRANSCRIPTS"),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//
//       Container(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: TabBarView(
//             children: [
//               Container(
//                 child: ListView(
//                   children: [
//                     Container(height: 40, color: Colors.grey),
//                     Container(height: 40, color: Colors.green),
//                     Container(height: 40, color: Colors.pinkAccent),
//                     Container(height: 40, color: Colors.blue),
//                     Container(height: 40, color: Colors.grey),
//                     Container(height: 40, color: Colors.green),
//                     Container(height: 40, color: Colors.pinkAccent),
//                     Container(height: 40, color: Colors.blue),
//                     Container(height: 40, color: Colors.grey),
//                     Container(height: 40, color: Colors.green),
//                     Container(height: 40, color: Colors.pinkAccent),
//                     Container(height: 40, color: Colors.blue)
//                   ],
//                 ),
//               ),
//               Container(height: 40, color: Colors.grey)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
