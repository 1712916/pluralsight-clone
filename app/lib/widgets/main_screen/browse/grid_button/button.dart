import 'package:app/models/courses-response-model.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:app/widgets/main_screen/home/course-item.dart';
import 'package:app/widgets/main_screen/home/seeall.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  final String title;
  final String route;
  final String type;
  const MyButton({Key key, this.title, this.route,this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SuggestionCourse(title: title,type: type,), ));
        },
        child: Text(
          this.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}


class SuggestionCourse extends StatefulWidget {
  final String title;
  final String type;

  SuggestionCourse({this.title, this.type});

  @override
  _SuggestionCourseState createState() => _SuggestionCourseState();
}

class _SuggestionCourseState extends State<SuggestionCourse> {
  List<Course> data=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Future future;
    if(widget.type=="CATEGORY"){
      future=CourseServicesFactory.dictonary[widget.title](limit: 20,page:1);
    }else if(widget.type=="RECOMMEND"){
      print("id :${Provider.of<LoginProvider>(context).userResponseModel.userInfo.id}");
      future=CourseServicesFactory.dictonary2[widget.title](limit:20,offset:1,id:Provider.of<LoginProvider>(context).userResponseModel.userInfo.id);
    }
    // future.then((value) =>
    //     setState(() {
    //       data=coursesResponseModelFromJson(value.body).courses;
    //       print("data: $data");
    //     })
    // );


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
            children: [
              Container(height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SafeArea(child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context);})),
              Container(
                  height: 160,
                  child: Center(child: buildTextHeader1(widget.title))),

            ],

            ),
            data==null?Center(
              child: circleLoading(),
            ):FutureBuilder<Response>(
                future: future,
                builder: (BuildContext context,AsyncSnapshot<Response> snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: coursesResponseModelFromJson(snapshot.data.body).courses.map((e) => Column(
                          children: [
                            HorizontalCourseItem(course: e,),
                            Divider(
                              color: Colors.grey,
                            )
                          ],
                        ) ).toList(),
                      ),
                    );

                  }
                  return Center(
                    child: circleLoading(),
                 );
                })
             //build list
          ],
        ),
      )
    );
  }
}
