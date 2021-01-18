import 'dart:convert';
import 'package:app/models/course-response-all-data.dart';
import 'package:app/models/course-with-lesson-response-model.dart';
import 'package:app/models/courses-response-model.dart';
import 'package:app/provider/bookmark-provider.dart';
import 'package:app/provider/download-proivder.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/services/lesson-services.dart';
import 'package:app/services/user-services.dart';
import 'package:app/sqlite/download-course.dart';
import 'package:app/widgets/course_detail/rating-page.dart';
import 'package:app/widgets/customs/Expandable.dart';
import 'package:app/widgets/customs/button.dart';
import 'package:app/widgets/customs/chip.dart';
import 'package:app/widgets/customs/rating-star.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:app/widgets/main_screen/downloads/download-controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:path/path.dart' as path;
import 'comments.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line
class Information extends StatefulWidget {
  Course course;
  Information({this.course});
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  bool likeStatus = false;
  final _formKey = GlobalKey<FormState>();
  String token = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = Provider.of<LoginProvider>(context, listen: false)
        .userResponseModel
        .token;
    (() async {
      var response = await UserServices.getCourseLikeStatus(
          token: token, courseId: widget.course.id);
      setState(() {
        likeStatus = jsonDecode(response.body)["likeStatus"];
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
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
          SubTitle(widget.course.subtitle),
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
                double.parse((widget.course.totalHours).toStringAsFixed(3))
                        .toString() +
                    " h",
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
          SubTitle(AppLocalizations.of(context).requirement),
          SizedBox(
            height: 8,
          ),
          TextExpandable((() {
            String content = "";
            if (widget.course.requirement != null) {
              for (int i = 1; i <= widget.course.requirement.length; i++) {
                content += "$i. ${widget.course.requirement[i - 1]} \n";
              }
            } else {
              content = AppLocalizations.of(context).haveNotRequirement;
            }

            return content;
          })()),
          SubTitle(AppLocalizations.of(context).learnWhat),
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
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                actionButton(likeStatus ? AppLocalizations.of(context).liked : AppLocalizations.of(context).like,
                    Icon(likeStatus ? Icons.favorite : Icons.favorite_border),
                    ()   {
                  _onLike();
                }),
                actionButton((() {
                  return Provider.of<BookmarkProvider>(context)
                          .isInBookmark(this.widget.course.id)
                      ? AppLocalizations.of(context).unBookmark
                      :  AppLocalizations.of(context).bookmark;
                })(), Icon((() {
                  return Provider.of<BookmarkProvider>(context)
                          .isInBookmark(this.widget.course.id)
                      ? Icons.bookmark
                      : Icons.bookmark_border;
                })()), () {
                  Provider.of<BookmarkProvider>(context)
                      .add(this.widget.course.id);
                }),
                FutureBuilder(
                  future: Provider.of<DownloadProvider>(context).isDownloaded(userId: Provider.of<LoginProvider>(context).userResponseModel.userInfo.id,courseId: this.widget.course.id),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                    if(snapshot.hasData){
                      return  actionButton( snapshot.data? AppLocalizations.of(context).downloaded: AppLocalizations.of(context).download, Icon(snapshot.data?Icons.download_done_outlined:Icons.file_download), () async {

                        if(snapshot.data){

                        }else{
                          _onDownload();
                        }

                      });
                    }

                    return actionButton(  AppLocalizations.of(context).download, Icon( Icons.file_download), () async {
                        _onDownload();

                    });
                  },

                ),

                actionButton( AppLocalizations.of(context).share, Icon(Icons.share), () {
                  _onShare(context);
                }),
                actionButton( AppLocalizations.of(context).comment, Icon(Icons.comment), ()   {
                  _onComment();
                }),
                actionButton(AppLocalizations.of(context).rate, Icon(Icons.star_rate), () {
                  _onRate(context);

                }),
                actionButton(
                    AppLocalizations.of(context).report, Icon(Icons.report_gmailerrorred_outlined), () {
                    _onReport(context);
                }),
                actionButton(AppLocalizations.of(context).note, Icon(Icons.notes), () {}),

              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SubTitle(AppLocalizations.of(context).description),
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
  _onDownload() async{
    final dir = await getDownloadDirectory();
    final isPermissionStatusGranted = await requestPermissions();

    if(isPermissionStatusGranted){
      Provider.of<DownloadProvider>(context,listen: false).changeToLoading();
      await Future.delayed(Duration(seconds: 5));
      Response responseSections=await CourseServices.getDetailWithLesson(token: token, courseId: this.widget.course.id);
      List<Section> sections=courseWithLessonResponseModelFromJson(responseSections.body).payload.section;
      for (var i = 0; i < sections.length; i++) {
        for (var j = 0; j < sections[i].lesson.length; j++) {
          if (sections[i].lesson[j].videoUrl == null) {
            var c=await LessonServices.getVideoProgress(courseId: this.widget.course.id, token: token,lessonId:sections[i].lesson[j].id);

            sections[i].lesson[j].videoUrl=jsonDecode(c.body)["payload"]["videoUrl"];
          }
        }
      }
      var uuid = Uuid();
      String name=uuid.v1();
      final savePath = path.join(dir.path, "meowsight/${name}.mp4");
      await startDownload(this.widget.course.promoVidUrl,savePath);
      this.widget.course.promoVidUrl=savePath;
      for(int i=0;i<sections.length;i++){
        for(int j=0;j<sections[i].lesson.length;j++){
          var uuid = Uuid();
          String name=uuid.v1();
          final savePath = path.join(dir.path, "meowsight/${name}.mp4");

          await startDownload(sections[i].lesson[j].videoUrl,savePath);
          sections[i].lesson[j].videoUrl=savePath;
        }
      }
      Provider.of<DownloadProvider>(context,listen: false).courseSQL.
      insert(
          CourseDownload(id: this.widget.course.id,
              data:  this.widget.course,
              sections:sections,
              userId: Provider.of<LoginProvider>(context,listen: false).userResponseModel.userInfo.id));


      Provider.of<DownloadProvider>(context,listen: false).changeToStop();
    }

  }
_onLike() async {
  var response = await UserServices.likeCourse(
      token: token, courseId: widget.course.id);
  setState(() {
    likeStatus = jsonDecode(response.body)["likeStatus"];
  });
}
  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject();
    String content="Khóa học: ${this.widget.course.title} - ${this.widget.course.instructorUserName}. Giá:  ${this.widget.course.price} VNĐ. Nội dung : ${this.widget.course.learnWhat} ";
    await Share.share(content,
        subject: "MeowSight",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
  _onRate(BuildContext){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserRatingPage(
                token: token, courseId: widget.course.id)));
  }
  _onComment() async{
    var response = await CourseServices.getCourseDetail(
        userId: null, courseId: widget.course.id);
    var listRating = courseResponseAllDataFromJson(response.body)
        .payload
        .ratings
        .ratingList;

    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 400,
              color: Colors.black,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        buildTextHeader1("Comments"),
                        IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                    Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: listRating.length,
                            itemBuilder: (context, index) {
                              return ItemComment(
                                content:
                                listRating[index].content,
                                imgUrl:
                                listRating[index].user.avatar,
                                name: listRating[index].user.name,
                                rating: listRating[index]
                                    .averagePoint
                                    .toInt(),
                                userType: listRating[index]
                                    .user
                                    .type
                                    .toString(),
                                dateUpdate:
                                listRating[index].updatedAt,
                              );
                            }))
                  ],
                ),
              ));
        });
  }
  _onReport(BuildContext context){
    final subjectController = TextEditingController();
    final contentController = TextEditingController();
    String message = "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Report this course"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
              FlatButton(
                  onPressed: () async {
                    var response =
                    await CourseServices.reportCourse(
                        token: token,
                        courseId: widget.course.id,
                        content: contentController.text,
                        subject: subjectController.text);
                    if (response.statusCode == 200) {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: successText(
                                  "Report submitted successfully"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OKE"))
                              ],
                            );
                          });
                    } else {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: errorText(
                                  "Submit failure report"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OKE"))
                              ],
                            );
                          });
                    }
                  },
                  child: Text("Send"))
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
                        padding:
                        EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          controller: subjectController,
                        ),
                      ),
                      Text("Content"),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 8),
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
  }
}
