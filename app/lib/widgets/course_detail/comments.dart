import 'package:app/widgets/customs/rating-star.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemComment extends StatefulWidget {
  String imgUrl;
  String name;
  String userType;
  String content;
  int rating;
  DateTime dateUpdate;

  ItemComment(
      {this.imgUrl,
      this.name,
      this.userType,
      this.content,
      this.rating,
      this.dateUpdate});

  @override
  _ItemCommentState createState() => _ItemCommentState();
}

class _ItemCommentState extends State<ItemComment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.imgUrl),
                  radius: 20,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTextHeader((widget.name ?? "Unknown") +
                        " (${widget.userType.split('.').last})"),
                    SubTitle(
                        DateFormat('yyyy-MM-dd').format(widget.dateUpdate)),
                    RatingStar(
                      rateNumber: widget.rating,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 56),
              child: TextTitle(widget.content),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 2,
              color: Colors.white38,
            )
          ],
        ),
      ),
    );
  }
}
