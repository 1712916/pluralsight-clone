
import 'package:app/utils/app-color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circleLoading(){
  return Container(
    height: 15,
    width: 15,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      valueColor:
      AlwaysStoppedAnimation(AppColors.accent),
    ),
  );
}