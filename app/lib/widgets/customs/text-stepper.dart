import 'package:app/provider/answer-provider.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/services/exercise-student-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextStepper extends StatefulWidget {
  List<dynamic> stepper;
  Function buildBody;
  Function doneFunction;

  TextStepper({this.stepper, this.buildBody,this.doneFunction});

  @override
  _TextStepperState createState() => _TextStepperState();
}

class _TextStepperState extends State<TextStepper> {
  int currentStep;
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentStep = 0;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentStep == 0
                ? Container()
                : TextButton(
                    onPressed: () {
                      setState(() {
                        currentStep--;
                      });
                    },
                    child: Text("Prev")),
            Text("${currentStep + 1}/${this.widget.stepper.length}"),
            currentStep == this.widget.stepper.length - 1
                ? (isLoading?TextButton(child: circleLoading()):TextButton(onPressed: () async {
                  setState(() {
                    isLoading=true;
                  });
                  //submit code here
                   await this.widget.doneFunction();

                  setState(() {
                    isLoading=false;
                  });


            }, child: Text("Done")))
                : TextButton(
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                    },
                    child: Text("Next")),
          ],
        ),
        Divider(),
        Expanded(
            child: this
                .widget
                .buildBody(this.widget.stepper[currentStep], currentStep))
      ],
    );
  }
}
