// import 'package:app/models/author.dart';
// import 'package:app/models/course.dart';
// import 'package:app/models/data.dart';
// import 'package:app/utils/app-color.dart';
// import 'package:app/widgets/main_screen/browse/paths/path-item.dart';
// import 'package:app/widgets/main_screen/browse/top_authors/author-item.dart';
// import 'package:app/widgets/main_screen/home/course-item.dart';
// import 'package:flutter/material.dart';
//
//
// class SearchResult extends StatefulWidget {
//   List<Course> courses = Courses;
//   List<Path> paths = Paths;
//   List<Author> authors = Authors;
//
//   SearchResult({this.courses, this.paths, this.authors});
//
//   _SearchResultState createState() => _SearchResultState();
// }
//
// class _SearchResultState extends State<SearchResult>
//     with TickerProviderStateMixin {
//
//
//   TabController _tabController;
//
//   String dropdownValue = 'Relevance';
//   @override
//   void initState() {
//     super.initState();
//     _tabController = new TabController(vsync: this, length: 4, initialIndex: 0);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               child: TabBar(controller: _tabController, tabs: [
//                 Tab(
//                   child: Text(
//                     'ALL',
//                   ),
//                 ),
//                 Tab(text: "COURSES"),
//                 Tab(text: "PATHS"),
//                 Tab(text: "AUTHORS"),
//               ]),
//             ),
//             Expanded(
//               //Add this to give height
//
//               child: TabBarView(controller: _tabController, children: [
//                 Container(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Column(children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Courses'),
//                                   TextButton(
//                                       onPressed: () {
//                                         _tabController.animateTo(1);
//                                       },
//                                       child:
//                                           Text('${this.widget.courses.length} Results')),
//                                 ],
//                               ),
//                               buildCourseItem(this.widget.courses, 4),
//                             ])),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Paths'),
//                                   TextButton(
//                                       onPressed: () {
//                                         _tabController.animateTo(2);
//                                       },
//                                       child: Text('${this.widget.paths.length} Results')),
//                                 ],
//                               ),
//                               buildPathItem(this.widget.paths, 4),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Authors'),
//                                   TextButton(
//                                       onPressed: () {
//                                         _tabController.animateTo(3);
//                                       },
//                                       child:
//                                           Text('${this.widget.authors.length} Results')),
//                                 ],
//                               ),
//                               buildAuthorItem(this.widget.authors, 4),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 32,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             showDialog(context: context,
//                             builder: (BuildContext context){
//                               return AlertDialog(
//
//                                 backgroundColor: AppColors.backgroundItemTypeA,
//                                 title: Text('hello'),
//                                 content: Container(
//                                   height: 180,
//                                   child: Column(
//                                     children: [
//                                       CheckboxListTile(
//
//                                            title: Text('Hello'),
//                                           value:false, onChanged: (val) {
//
//                                       }),
//                                       CheckboxListTile(
//                                           title: Text('Hello'),
//
//                                           value:true, onChanged: (val) {
//
//                                       }),
//
//                                       CheckboxListTile(
//                                           title: Text('Hello'),
//                                           value:true, onChanged: (val) {
//
//                                       }),
//
//
//                                     ],
//                                   ),
//                                 ),
//                                 actions: [
//                                   TextButton(onPressed: (){
//                                     Navigator.of(context).pop();
//                                   }, child: Text('CANCEL')),
//                                   TextButton(onPressed: (){}, child: Text('APPLY')),
//
//                                 ],
//                               );
//                             });
//                           },
//                           child: Row(
//                             children: [
//                               Text('Skill Levels '),
//                               Icon(Icons.arrow_drop_down_outlined)
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('${this.widget.courses.length} Results'),
//                             DropdownButton(
//                               value: dropdownValue,
//                               items: <String>[
//                                 'Relevance',
//                                 'Newest'
//                               ].map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String newValue) {
//                                 setState(() {
//                                   dropdownValue = newValue;
//                                 });
//                               },
//                             )
//                           ],
//                         ),
//                         Expanded(
//                           child: ListView(
//                             children: [
//                               SingleChildScrollView(
//                                   child: buildCourseItem(
//                                       this.widget.courses, this.widget.courses.length))
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Text('${this.widget.paths.length} Results'),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Expanded(
//                             child: ListView(
//                           children: [
//                             buildPathItem(this.widget.paths, this.widget.paths.length),
//                           ],
//                         ))
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Text('${this.widget.authors.length} Results'),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Expanded(
//                             child: ListView(
//                           children: [
//                             buildAuthorItem(this.widget.authors, this.widget.authors.length),
//                           ],
//                         ))
//                       ],
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget buildCourseItem(List<Course> courses, int length) {
//   List<Widget> list = [];
//
//   for (var i = 0; i < courses.length && i < length; i++) {
//     list.add(HorizontalCourseItem(
//       course: courses[i],
//     ));
//     list.add(Divider(
//       color: Colors.grey,
//     ));
//   }
//   return Column(
//     children: list,
//   );
// }
//
// Widget buildPathItem(List<Path> paths, int length) {
//   List<Widget> list = [];
//
//   for (var i = 0; i < paths.length && i < length; i++) {
//     list.add(PathItemB(path: paths[i]));
//     list.add(Divider(
//       color: Colors.grey,
//     ));
//   }
//   return Column(
//     children: list,
//   );
// }
//
// Widget buildAuthorItem(List<Author> author, int length) {
//   List<Widget> list = [];
//
//   for (var i = 0; i < author.length && i < length; i++) {
//     list.add(AuthorItemB(author[i]));
//     list.add(Divider(
//       color: Colors.grey,
//     ));
//   }
//   return Column(
//     children: list,
//   );
// }
//
// class ItemFactory {
//   String type;
//
//   Widget clone() {}
// }
