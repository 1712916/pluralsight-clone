import 'package:app/models/instructor-detail-response-model.dart';
import 'package:app/models/instructors-response-model.dart';
import 'package:app/services/instructor-services.dart';
import 'package:app/utils/future-template.dart';
import '../../../customs/text-type.dart';
import 'author-detail.dart';
import 'package:flutter/material.dart';

class AuthorItem extends StatelessWidget {
  final String authorId;
  AuthorItem(this.authorId);
  Widget buildContent(AsyncSnapshot snapshot,BuildContext context){
    Author author=instructorDetailResponseModelFromJson(snapshot.data.body).author;
    return   GestureDetector(
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorDetail(author)),
        );
      },
      child: Container(

          child:Padding(
            padding: EdgeInsets.all(5),
            child:  Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(author.avatar),
                  radius: 40.0,
                ),
                Text(((){
                  if(author.name==null){
                    return "unknown";
                  }
                  return author.name;
                })()
                  ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,

                  ),)
              ],
            ),
          )

      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: InstructorServices.getInstructorById(instructorId: authorId),
      builder: (BuildContext context, AsyncSnapshot snapshot ){
        return processFutureBuild(snapshot: snapshot,child: buildContent,context: context);
      },

    );
  }
}

class AuthorItemB extends AuthorItem {

  AuthorItemB(String authorId):super(authorId);


  @override
  Widget buildContent(AsyncSnapshot snapshot, BuildContext context) {
    Author author=instructorDetailResponseModelFromJson(snapshot.data.body).author;
    return  GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorDetail(author)),
        );
      },
      child: Container(

          child:Row(
            children: [
              SizedBox(width: 32,),
              CircleAvatar(
                backgroundImage: NetworkImage(author.avatar),
                radius: 30.0,
              ),
              SizedBox(width: 32,),
              Column(
                children: [
                  buildTextTitle(author.name),
                  SizedBox(height: 8,),
                  buildSubTextTitle('15 courses')
                ],
              )

            ],
          )

      ),
    );
  }


}
