import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/cupertino.dart';

Widget processFutureBuild({AsyncSnapshot snapshot,Function child,BuildContext context}){
  if(snapshot.hasData){
    return child(snapshot,context);
  } else if (snapshot.hasError) {
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