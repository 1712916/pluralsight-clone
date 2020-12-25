import 'dart:convert';

import 'package:app/models/courses-response-model.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/services/user-services.dart';
import 'package:app/widgets/course_detail/rating-page.dart';
import 'package:app/widgets/customs/Expandable.dart';
import 'package:app/widgets/customs/button.dart';
import 'package:app/widgets/customs/chip.dart';
import 'package:app/widgets/customs/rating-star.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'detail.dart';
import 'detail.dart';

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
                this.widget.course.status.toString().split('.').last,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(widget.course.createdAt),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                double.parse((widget.course.totalHours).toStringAsFixed(3)).toString()+" h",
                style: TextStyle(color: Colors.white),
              ),

              SizedBox(
                width: 8,
              ),
              RatingStar(
                rateNumber: widget.course.ratedNumber,
              ),
              // Text(
              //   widget.course.,
              //   style: TextStyle(color: Colors.white),
              // ),
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
            if(widget.course.requirement!=null){
              for (int i = 1; i <= widget.course.requirement.length; i++) {
                content += "$i. ${widget.course.requirement[i - 1]} \n";
              }
            }else{
              content="Không yêu cầu";
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

