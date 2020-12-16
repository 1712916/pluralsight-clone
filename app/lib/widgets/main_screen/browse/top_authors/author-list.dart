
import 'package:app/models/instructors-response-model.dart';
import 'package:app/services/instructor-services.dart';
import 'package:app/utils/constraints.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'author-item.dart';

class AuthorList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // List<Author> authors=Provider.of<AuthorProvider>(context).authors;
    return FutureBuilder<Response>(
      future: InstructorServices.getInstructors(),
      builder: (BuildContext context,  AsyncSnapshot<Response> snapshot){
        if(snapshot.hasData){
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    child: Text(
                      'Top authors',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  height: authorRowHeight,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: instructorsResponseModelFromJson(snapshot.data.body).payload.map((author) => Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: AuthorItem(author.id),
                      )).toList()),
                )
              ],
            ),
          );
        }else if (snapshot.hasError) {
          return Center(
            child: Text("Lỗi rồi man"),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circleLoading(),
              SizedBox(
                height: 16,
              ),
              Text("Please wait for loading..")
            ],
          ),
        );

      }

    );
  }
}

Widget buildRowAuthors(List<AuthorApart> authors){
  return      Container(
      height: authorRowHeight,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: authors.map((author) => Padding(
            padding: EdgeInsets.only(left: 16),
            child: AuthorItem(author.id),
          )).toList()),
    );
}
