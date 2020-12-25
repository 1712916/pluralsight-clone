

import 'package:app/models/instructor-detail-response-model.dart';
import 'package:app/services/instructor-services.dart';
import 'package:app/widgets/main_screen/browse/top_authors/author-detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'loading-process.dart';

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

