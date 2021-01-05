import 'dart:convert';

import 'package:app/models/exercise-question-response-model.dart' as question;
import 'package:app/models/exercise-question-response-model.dart';
import 'package:app/models/exercise-response-model.dart';
import 'package:app/provider/answer-provider.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/provider/video-provider.dart';
import 'package:app/services/exercise-student-services.dart';
import 'package:app/widgets/customs/text-stepper.dart';
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
                    SubTitle(
                        double.parse((hours).toStringAsFixed(3)).toString() +
                            " h")
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
                widget.lesson.videoUrl !=
                        Provider.of<VideoProvider>(context).videoUrl
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
              SubTitle(double.parse((widget.lesson.hours).toStringAsFixed(3))
                      .toString() +
                  " h"),
              SizedBox(
                width: 8,
              ),
              FutureBuilder<Response>(
                  future: ExerciseServices.getListExerciseOfALesson(
                      token: Provider.of<LoginProvider>(context, listen: false)
                          .userResponseModel
                          .token,
                      lessonId: widget.lesson.id),
                  builder:
                      (BuildContext context, AsyncSnapshot<Response> snapshot) {
                    if (snapshot.hasData) {

                      if (snapshot.data.statusCode == 200) {
                          if(exerciseResponseModelFromJson(
                              snapshot.data.body)
                              .payload
                              .exercises.isNotEmpty){
                            return IconButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExercisePage(
                                            exercises:
                                            exerciseResponseModelFromJson(
                                                snapshot.data.body)
                                                .payload
                                                .exercises)));
                              },
                              icon: Icon(
                                Icons.assignment,
                              ),
                            );
                          }

                      }
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ExercisePage extends StatefulWidget {
  List<Exercise> exercises;
  ExercisePage({this.exercises});
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text("Danh sách bài tập"),
            Expanded(
              child: ListView.builder(
                  itemCount: this.widget.exercises.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        var response =
                            await ExerciseServices.getExerciseQuestion(
                                exerciseId: this.widget.exercises[index].id,
                                token: Provider.of<LoginProvider>(context,
                                        listen: false)
                                    .userResponseModel
                                    .token);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Practice(
                                      exercises:
                                          exerciseQuestionResponseModelFromJson(
                                                  response.body)
                                              .payload
                                              .exercises,
                                    )));
                      },
                      subtitle: SubTitle(
                          "Số câu hỏi ${this.widget.exercises[index].numberQuestion}"),
                      leading: Text("${index + 1}"),
                      title: TextTitle(this.widget.exercises[index].title),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// class ExerciseCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Conta,
//     );
//   }
// }
class Practice extends StatelessWidget {
  Exercises exercises;
  Practice({this.exercises});
  @override
  Widget build(BuildContext context) {
    Provider.of<AnswerProvider>(context).initAnswers(exercises.exercisesQuestions.length);
      return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: TextStepper(
          buildBody: buildQuestionBody,
          stepper: this.exercises.exercisesQuestions,
          doneFunction: () async {

            List<List<int>> answerFromProvider=Provider.of<AnswerProvider>(context).answers;
           List<Submit> submits=[];
           for(int i=0;i<this.exercises.exercisesQuestions.length;i++){
             submits.add(Submit(id: this.exercises.exercisesQuestions[i].id,answers: ((){
               List<String> answers=[];
               for(int j=0;j<answerFromProvider[i].length;j++){
                 answers.add(this.exercises.exercisesQuestions[i].exercisesAnswers[answerFromProvider[i][j]].id);
               }
              return answers;
             })()));

           }
            print("token: ${Provider.of<LoginProvider>(context).userResponseModel.token}");
           print("id: ${this.exercises.id}");
            print("submit: ${jsonEncode(submits)}");
          Response response=await ExerciseServices.submitExercise(token: Provider.of<LoginProvider>(context).userResponseModel.token,exerciseId: this.exercises.id,submits: submits );
           print("trả lời submit: ${response.body}");
           await Future.delayed(Duration(seconds: 1));
          },
        ),
      ),
    );
  }
}

Widget buildQuestionBody(question.ExercisesQuestion exercisesQuestion, int indexQuestion) {
  if (exercisesQuestion.isMultipleChoice) {
    return MultipleChoice(exercisesQuestion,indexQuestion);
  } else {
    return SingleChoice(exercisesQuestion,indexQuestion);
  }
}

class SingleChoice extends StatefulWidget {
  question.ExercisesQuestion exercisesQuestion;
  int indexQuestion;
  SingleChoice(this.exercisesQuestion,this.indexQuestion);
  @override
  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  int currentChoice=-1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    var currentChoiceFromProvider=Provider.of<AnswerProvider>(context).answers[this.widget.indexQuestion];
    if(currentChoiceFromProvider.isNotEmpty){
      currentChoice= currentChoiceFromProvider[0];
    }else{
      currentChoice = -1;
    }
    return Column(
      children: [
       Text("Câu hỏi: ${this.widget.exercisesQuestion.content}"),
        Expanded(
          child: ListView.builder(
              itemCount: this.widget.exercisesQuestion.exercisesAnswers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      currentChoice = index;
                      Provider.of<AnswerProvider>(context).updateProvider(this.widget.indexQuestion, false, currentChoice);
                    });
                  },
                  leading: index == currentChoice
                      ? Icon(Icons.radio_button_checked_rounded)
                      : Icon(Icons.radio_button_unchecked_rounded),
                  title: Text(this
                      .widget
                      .exercisesQuestion
                      .exercisesAnswers[index]
                      .content),
                );
              }),
        ),
      ],
    );
  }
}

class MultipleChoice extends StatefulWidget {
  question.ExercisesQuestion exercisesQuestion;
  int indexQuestion;
  MultipleChoice(this.exercisesQuestion,this.indexQuestion);

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  List<bool> currentChoice=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<this.widget.exercisesQuestion.exercisesAnswers.length;i++){
      currentChoice.add(false);
    }
  }
  @override
  Widget build(BuildContext context) {

    var currentChoiceFromProvider=Provider.of<AnswerProvider>(context).answers[this.widget.indexQuestion];
    if(currentChoiceFromProvider.isNotEmpty){
      for(int i=0;i<currentChoiceFromProvider.length;i++){
         setState(() {
           currentChoice[currentChoiceFromProvider[i]]=true;
         });
      }
    }
    return Column(
      children: [
        Container(
          child: Text("Câu hỏi: ${this.widget.exercisesQuestion.content}"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: this.widget.exercisesQuestion.exercisesAnswers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      currentChoice[index]=!currentChoice[index];
                      Provider.of<AnswerProvider>(context).updateProvider(this.widget.indexQuestion, true, index);
                    });
                  },
                  leading:  currentChoice[index]
                      ? Icon(Icons.check_box_rounded)
                      : Icon(Icons.check_box_outline_blank_rounded),
                  title: Text(this
                      .widget
                      .exercisesQuestion
                      .exercisesAnswers[index]
                      .content),
                );
              }),
        ),
      ],

    );
  }
}
