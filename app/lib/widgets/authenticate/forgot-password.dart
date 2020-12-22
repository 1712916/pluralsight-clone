import 'package:app/services/user-services.dart';
import 'package:app/strings/string-us.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController;
  int responseStatus;
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    responseStatus = -1;
    isLoading=false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forgotRequestTitle),
            SizedBox(
              height: 16,
            ),
            myTextField(labelname: "email",controller: _emailController),
            SizedBox(
              height: 16,
            ),
            isLoading?Center(
              child: Container(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor:
                  AlwaysStoppedAnimation(AppColors.accent),
                ),
              ),
            ):Container(),
            responseStatus == -1
                ? Container()
                : Container(
              child: ((){
                if(responseStatus==200){
                  return successText(succeedRequestedForgotPassword);
                }
                if(responseStatus==400){
                  return failureText(failedRequestedForgotPassword);
                }
                return errorText(responseError);
              })(),
            ),

            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.deepPurple[700],
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: FlatButton(
                  onPressed: () async {
                    setState(() {
                      isLoading=true;
                      responseStatus=-1;
                    });

                    var response = await UserServices.forgotPasswordService(email:_emailController.text);

                    setState(() {
                      responseStatus = response.statusCode;
                      print("hello: $responseStatus");

                      isLoading=false;
                    });
                  },
                  child: Center(
                    child: Text(
                      buttonForgotRequest,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
