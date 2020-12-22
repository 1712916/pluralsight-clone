import 'dart:convert';

import 'package:app/models/courses-response-model.dart';
import 'package:app/models/instructor-detail-response-model.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/instructor-services.dart';
import 'package:app/services/user-services.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/custom-videoplayer.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../customs/rating-star.dart';
import '../customs/text-type.dart';
import '../customs/expandable.dart';

class CourseDetail extends StatefulWidget {
  final Course course;

  CourseDetail(this.course);

  static const routeName = '/course-detail';
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<CourseDetail> {
  //Data here

  @override
  Widget build(BuildContext context) {
    print("Hello: ${widget.course.promoVidUrl}");

    return Scaffold(
      backgroundColor: AppColors.backgroundItemTypeA,
      body: Column(
        children: [
          // Stack(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Colors.blueGrey,
          //       ),
          //       // child: Center(child: Text('Video area')),
          //       child: CustomVideoPlayer(),
          //     ),
          //     // SafeArea(
          //     //     child: IconButton(
          //     //   onPressed: () {
          //     //     Navigator.pop(context);
          //     //   },
          //     //   icon: Icon(Icons.arrow_back_ios),
          //     // ))
          //   ],
          // ),
          // CustomVideoPlayer(url: widget.course.promoVidUrl,),
          DefaultTabController(
            length: 2,
            child: Flexible(
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverList(
                          delegate: SliverChildListDelegate(
                              [Information(course: this.widget.course)])),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverAppBar(
                        elevation: 0,
                        backgroundColor: AppColors.backgroundItemTypeA,
                        pinned: true,
                        toolbarHeight: 0,
                        bottom: TabBar(
                          tabs: [
                            Tab(text: "CONTENTS"),
                            Tab(text: "TRANSCRIPTS"),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBarView(
                      children: [
                        Container(
                          child: ListView(
                            children: [
                              Container(height: 40, color: Colors.grey),
                              Container(height: 40, color: Colors.green),
                              Container(height: 40, color: Colors.pinkAccent),
                              Container(height: 40, color: Colors.blue),
                              Container(height: 40, color: Colors.grey),
                              Container(height: 40, color: Colors.green),
                              Container(height: 40, color: Colors.pinkAccent),
                              Container(height: 40, color: Colors.blue),
                              Container(height: 40, color: Colors.grey),
                              Container(height: 40, color: Colors.green),
                              Container(height: 40, color: Colors.pinkAccent),
                              Container(height: 40, color: Colors.blue)
                            ],
                          ),
                        ),
                        Container(height: 40, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Information extends StatefulWidget {
  Course course;
  Information({this.course});
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  bool likeStatus = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    String token=Provider.of<LoginProvider>(context)
        .userResponseModel
        .token;
    print("Token: $token");
    print("id: ${widget.course.id}");
    UserServices.getCourseLikeStatus(
            token: Provider.of<LoginProvider>(context).userResponseModel.token,
            courseId: widget.course.id)
        .then((value) => setState(() {
              likeStatus = jsonDecode(value.body)["likeStatus"];
            }));

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextHeader1(
            widget.course.title +
                (() {
                  return widget.course.price == 0
                      ? " (FREE)"
                      : " (${widget.course.price} VND)";
                })(),
          ),
          SizedBox(
            height: 8,
          ),
          buildSubTextTitle(widget.course.subtitle),
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                authorChip(
                    authorId: widget.course.instructorId, context: context),
              ],
              //suawr lai thanh buidler
              // children: widget.course
              //     .map((e) => Padding(
              //         padding: EdgeInsets.only(left: 8),
              //         child: authorChip(findAuthorById(e), context)))
              //     .toList(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'Beginner',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'thg 4 16 2019',
                style: TextStyle(color: Colors.white),
              ),
              Center(
                child: Text(
                  '.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                '6,1 h',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 8,
              ),
              RatingStar(
                rateNumber: widget.course.ratedNumber,
              ),
              Text(
                '(1512)',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          buildSubTextTitle("Requirement"),
          SizedBox(
            height: 8,
          ),
          TextExpandable((() {
            String content = "";
            for (int i = 1; i <= widget.course.requirement.length; i++) {
              content += "$i. ${widget.course.requirement[i - 1]} \n";
            }
            return content;
          })()),
          buildSubTextTitle("Learn what?"),
          SizedBox(
            height: 8,
          ),
          TextExpandable((() {
            String content = "";
            for (int i = 1; i <= widget.course.learnWhat.length; i++) {
              content += "$i. ${widget.course.learnWhat[i - 1]} \n";
            }
            return content;
          })()),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: actionButton(
                    likeStatus ? "Liked" : "Like", Icon(Icons.bookmark_border),
                    () async {
                  var response = await UserServices.likeCourse(
                      token: token,
                      courseId: widget.course.id);
                  setState(() {
                    likeStatus = jsonDecode(response.body)["likeStatus"];
                  });
                }),
              ),
              Expanded(
                child: actionButton('Note', Icon(Icons.notes), () {}),
              ),
              Expanded(
                child: actionButton('Rate', Icon(Icons.star_rate), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRatingPage(token: token,courseId:widget.course.id)));
                }),
              ),
              Expanded(
                  child: actionButton(
                      'Report', Icon(Icons.report_gmailerrorred_outlined), () {
                    final subjectController = TextEditingController();
                    final contentController = TextEditingController();
                showDialog(
                    context: context,

                    builder: (BuildContext context) {

                      return AlertDialog(
                        title: Text("Report this course"),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Close")),
                          FlatButton(onPressed: ( ) async{

                            // var response= await CourseServices.reportCourse(token: token,courseId:widget.course.id ,content: contentController.text,subject:subjectController.text );
                            //
                            // if(response.statusCode==200){
                            //   print("Response: $response");
                            //   final snackBar = SnackBar(
                            //     content: Text('Reported!'),
                            //     action: SnackBarAction(
                            //       label: 'Undo',
                            //       onPressed: () {
                            //         // Some code to undo the change.
                            //       },
                            //     ),
                            //   );
                            //   Navigator.pop(context);
                            //   Scaffold.of(context).showSnackBar(snackBar);
                            // final snackBar = SnackBar(
                            //     content: Text('Reported!'),
                            //     action: SnackBarAction(
                            //       label: 'Undo',
                            //       onPressed: () {
                            //         // Some code to undo the change.
                            //       },
                            //     ),
                            //   );
                            // print("Hello: dataa ${contentController.text}");
                            //      Scaffold.of(context).showSnackBar(snackBar);
                            Navigator.pop(context);
                          }, child: Text("Send"))
                        ],
                        content: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Subject"),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: TextFormField(
                                      controller: subjectController,
                                    ),
                                  ),
                                  Text("Content"),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: TextFormField(
                                      controller: contentController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          buildSubTextTitle("Description"),
          SizedBox(
            height: 8,
          ),
          TextExpandable(widget.course.description),
          SizedBox(
            height: 16,
          ),
          actionButton2('Take a learning check', Icon(Icons.done), () {}),
          SizedBox(
            height: 8,
          ),
          actionButton2(
              'View related paths & courses', Icon(Icons.done), () {}),
        ],
      ),
    );
  }
}

class UserRatingPage extends StatefulWidget {
  String token;
  String courseId;
  UserRatingPage({this.token,this.courseId});
  @override
  _UserRatingPageState createState() => _UserRatingPageState();
}

class _UserRatingPageState extends State<UserRatingPage> {
  TextEditingController contentController;

  ChoiceStar choiceStar1= ChoiceStar(size: 36.0,);
  ChoiceStar choiceStar2= ChoiceStar(size: 36.0,);
  ChoiceStar choiceStar3= ChoiceStar(size: 36.0,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    contentController=new TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextTitle("Điểm hình thức"),
              SizedBox(
                height: 16,
              ),
              choiceStar1,
              SizedBox(
                height: 16,
              ),

              buildTextTitle("Điểm nội dung"),
              SizedBox(
                height: 16,
              ),
              choiceStar2,
              SizedBox(
                height: 16,
              ),

              buildTextTitle("Điểm trình bày"),
              SizedBox(
                height: 16,
              ),
              choiceStar3,
              SizedBox(
                height: 16,
              ),

              buildTextTitle("Nhập đánh giá"),
              SizedBox(
                height: 16,
              ),
              Container(
                  height: 100,
                  child: myTextField(controller: contentController, maxLines: 7)),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[700],
                    borderRadius:
                    BorderRadius.all(Radius.circular(4.0))),
                child: FlatButton(
                    onPressed: ()  async {
                      var respone=await CourseServices.ratingCourse(token: widget.token,content: contentController.text??"",courseId: widget.courseId,contentPoint: choiceStar2.rateNumber??0,formalityPoint: choiceStar1.rateNumber??0,presentationPoint: choiceStar3.rateNumber??0);
                      print("Status: ${respone.statusCode}");
                      if(respone.statusCode==200){

                         final snackBar = SnackBar(content: Text('Đánh giá khóa học thành công!'));

                         Scaffold.of(context).showSnackBar(snackBar);
                       }else if(respone.statusCode==400){
                        final snackBar = SnackBar(content: Text('Thất bại!'));

                        Scaffold.of(context).showSnackBar(snackBar);
                      }else{
                        final snackBar = SnackBar(content: Text('Như cức!'));

                        Scaffold.of(context).showSnackBar(snackBar);
                      }

                    },
                    child: Center(
                      child: Text(
                        'GỬI ĐÁNH GIÁ',
                      ),
                    )),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


Widget authorChip({String authorId, BuildContext context}) {
  return FutureBuilder(
    future: InstructorServices.getInstructorById(instructorId: authorId),
    builder: (BuildContextcontext, AsyncSnapshot<Response> snapshot) {
      if (snapshot.hasData) {
        var author =
            instructorDetailResponseModelFromJson(snapshot.data.body).author;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AuthorDetail(author)),
            );
          },
          child: Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 26,
                    width: 26,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(author.avatar),
                      radius: 4.0,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text(author.name,
                    style: TextStyle(fontSize: 14, color: Colors.white))
              ],
            ),
          ),
        );
      }
      return Center(
        child: circleLoading(),
      );
    },
  );
}

Widget actionButton(String title, Icon icon, Function function) {
  return Container(
    height: 80,
    child: FlatButton(
      onPressed: () {
        function();
      },
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white38,
            ),
            child: icon, //Icons.bookmark_border
            height: 40,
            width: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget actionButton2(String title, Icon icon, Function function) {
  return FlatButton(
      height: 40,
      padding: EdgeInsets.zero,
      color: Colors.white24,
      onPressed: () {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ));
}
