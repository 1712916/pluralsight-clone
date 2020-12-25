import 'package:app/models/categories-response-model.dart';
import 'package:app/services/category-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'button.dart';

class GridButton extends StatefulWidget {
  @override
  _GridButtonState createState() => _GridButtonState();
}

class _GridButtonState extends State<GridButton> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    /*24 is for notification bar on Android*/

    return   FutureBuilder<Response>(
      future: CategoryServices.getAllCategory(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
        if(snapshot.hasData){
          return Container(
              height: 170,
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.horizontal,
                childAspectRatio: 0.5,
                children: categoriesResponseModelFromJson(snapshot.data.body).payload.map((e) => Padding(
                  padding: const EdgeInsets.only(right: 5, bottom: 5),
                  child: MyButton(
                    title: e.name,
                    categoryId:e.id,
                    route: 'widget.home',
                    type: "CATEGORY",
                  ),
                ),).toList(),

              ));
        }
        return circleLoading();
      }
    );
  }
}
