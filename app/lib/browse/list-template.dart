import 'package:app/browse/item.dart';
import 'package:flutter/material.dart';
    
class ListTemplate extends StatelessWidget {
  String title;
  List data;
  Item item;
  Function onPress;

  ListTemplate(this.title, this.data, this.item, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                padding: EdgeInsets.only(left: 5),
              ),
              SizedBox(
                height: item.height,
                child: Container(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:  this.data.length,
                      itemBuilder:
                          (BuildContext context, int index){
                        return this.item;
                      }),
                ),

              ),

            ],
          ),
        ));
  }
}
