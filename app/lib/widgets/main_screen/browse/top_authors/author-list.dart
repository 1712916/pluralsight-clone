import 'package:app/models/author-provider.dart';
import 'package:app/models/author.dart';
import 'package:app/utils/constain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'author-item.dart';

class AuthorList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Author> authors=Provider.of<AuthorProvider>(context).authors;
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
                children: authors.map((author) => Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: AuthorItem(author),
                    )).toList()),
          )
        ],
      ),
    );
  }
}

Widget buildRowAuthors(List<Author> authors){
  return      Container(
      height: authorRowHeight,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: authors.map((author) => Padding(
            padding: EdgeInsets.only(left: 16),
            child: AuthorItem(author),
          )).toList()),
    );
}
