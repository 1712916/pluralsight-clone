import 'package:app/utils/app-color.dart';
import 'package:flutter/material.dart';

Widget myTextField(
    {String labelname, TextEditingController controller, int maxLines}) {
  return TextField(
    minLines: maxLines ?? 1,
    maxLines: maxLines ?? 1,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryColor,
        ),
      ),
      labelStyle: TextStyle(
        color: AppColors.secondaryColor,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.clear,
          color: AppColors.secondaryColor,
        ),
        onPressed: () {
          controller.clear();
        },
      ),
      labelText: labelname,
    ),
  );
}


class HideTextField extends StatefulWidget {
  String labelName;
  TextEditingController controller;
  HideTextField({this.labelName,this.controller});

  @override
  _HideTextFieldState createState() => _HideTextFieldState();
}

class _HideTextFieldState extends State<HideTextField> {
  bool obscureText = true;
  bool validContent=false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (text){
        setState(() {
          validContent=text.length<8;
        });
      },
      decoration: InputDecoration(
        errorText: validContent?"Mật khẩu ít nhất 8 ký tự":null,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.secondaryColor,
            ),
          ),
          labelText: widget.labelName.toUpperCase(),
          labelStyle: TextStyle(
            color: AppColors.secondaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });

            },
            icon: Icon(
              obscureText ? Icons.lock : Icons.lock_open,
              color: AppColors.secondaryColor,
            ),
          )),
      obscureText: obscureText,
    );
  }
}

