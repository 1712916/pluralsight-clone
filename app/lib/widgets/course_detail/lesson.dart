
import 'package:app/provider/login-provider.dart';
import 'package:app/provider/video-provider.dart';
import 'package:app/services/exercise-student-services.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:app/models/course-with-lesson-response-model.dart';
class SectionHeader extends StatelessWidget {
  final int number;
  final String title;
  final double hours;

  SectionHeader({this.number, this.title, this.hours});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 60,
              color: Colors.grey,
              child: Center(
                child: Text("$number"),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: TextTitle(this.title)),
                    SubTitle(double.parse((hours).toStringAsFixed(3)).toString()+" h")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatefulWidget {
  Lesson lesson;
  LessonItem({this.lesson});
  @override
  _LessonItemState createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {

          print("hello: ${widget.lesson.videoUrl}");
          Provider.of<VideoProvider>(context).changeUrl(widget.lesson.videoUrl);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.lesson.videoUrl !=  Provider.of<VideoProvider>(context).videoUrl
                    ? Icons.pause_circle_outline_outlined
                    : Icons.play_circle_filled_rounded,
                size: 10,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(child: SubTitle(this.widget.lesson.name)),
              SizedBox(
                width: 8,
              ),
              SubTitle(double.parse((widget.lesson.hours).toStringAsFixed(3)).toString()+" h"),
              SizedBox(
                width: 8,
              ),
              FutureBuilder<Response>(
                  future: ExerciseServices.getListExcerciseOfALesson(token:Provider.of<LoginProvider>(context,listen: false).userResponseModel.token  ,lessonId:widget.lesson.id  ),
                  builder: (BuildContext context, AsyncSnapshot<Response> snapshot){

                    if(snapshot.hasData){
                      print("Test ${snapshot.data.statusCode}");
                      if(snapshot.data.statusCode==200){
                        return   IconButton(
                          onPressed: () async{
                          },
                          icon: Icon(
                            Icons.assignment,
                          ),
                        );
                      }
                    }
                    return Container();
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}
