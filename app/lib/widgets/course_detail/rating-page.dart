import 'package:app/services/course-services.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/rating-star.dart';
import 'package:app/widgets/customs/text-field.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';

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
              TextTitle("Điểm hình thức"),
              SizedBox(
                height: 16,
              ),
              choiceStar1,
              SizedBox(
                height: 16,
              ),

              TextTitle("Điểm nội dung"),
              SizedBox(
                height: 16,
              ),
              choiceStar2,
              SizedBox(
                height: 16,
              ),

              TextTitle("Điểm trình bày"),
              SizedBox(
                height: 16,
              ),
              choiceStar3,
              SizedBox(
                height: 16,
              ),

              TextTitle("Nhập đánh giá"),
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
