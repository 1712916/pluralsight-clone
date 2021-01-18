import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/validate-password.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/provider/theme-provider.dart';
import 'package:app/services/user-services.dart';
import 'package:app/utils/app-color.dart';
import 'package:app/utils/constraints.dart';
import 'package:app/widgets/authenticate/sign-in.dart';
import 'package:app/widgets/customs/button.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/customs/text-field.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  static const String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    var loginState = Provider.of<LoginProvider>(context);
    var userInfo;
    if (loginState.isLogin) {
      userInfo = loginState.userResponseModel.userInfo;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).setting),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              loginState.isLogin
                  ? Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userInfo.avatar),
                          radius: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: userInfo.name != null
                                  ? buildTextHeader1(
                                      userInfo.name,
                                    )
                                  : Text(userInfo.email),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChangePassword(
                                                id: loginState.userResponseModel
                                                    .userInfo.id,
                                                token: loginState
                                                    .userResponseModel.token,
                                              )));
                                },
                                child: Text(AppLocalizations.of(context)
                                    .changePassword))
                          ],
                        )
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 16,
              ),

              GestureDetector(
                child: buildTextHeader(AppLocalizations.of(context).notification),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DownloadDirectionSetting()));
                },
                child: buildTextHeader(AppLocalizations.of(context).downloadDirection),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThemeSetting()));
                },
                child: buildTextHeader(AppLocalizations.of(context).themes),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextHeader(AppLocalizations.of(context).appVersion),
                    SizedBox(
                      height: 8,
                    ),
                    SubTitle('2.40.0')
                  ],
                ),
              ),
              SizedBox(height: 16),
              loginState.isLogin
                  ? FlatButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Provider.of<LoginProvider>(context).changeState();
                        //  Navigator.of(context).popUntil((route) => route.isFirst);

                        (() async {
                          final prefs = await SharedPreferences.getInstance();
                          final isLoginKey = 'isLogin';
                          prefs.setBool(isLoginKey, false);
                        })();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignIn(requiredSavePassword: false)));
                      },
                      child: Text(
                        AppLocalizations.of(context).signOut,
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: AppColors.secondaryColor)),
                    )
                  : FlatButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignIn(
                                      requiredSavePassword: false,
                                    )));
                      },
                      child: Text(
                        AppLocalizations.of(context).signIn,
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: AppColors.secondaryColor)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadDirectionSetting extends StatefulWidget {
  @override
  _DownloadDirectionSettingState createState() => _DownloadDirectionSettingState();
}

class _DownloadDirectionSettingState extends State<DownloadDirectionSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Các video được lưu trữ tại: /download/meowsight"),
        ),
      ),
    );
  }
}


class ChangePassword extends StatefulWidget {
  String id;
  String token;
  ChangePassword({this.id, this.token});
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassController, newPassController;
  bool isLoading = false;
  int responseStatus = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldPassController = TextEditingController();
    newPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).changePassword),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HideTextField(
                labelName: AppLocalizations.of(context).oldPassword,
                controller: oldPassController),
            SizedBox(
              height: 16,
            ),
            HideTextField(
                labelName: AppLocalizations.of(context).newPassword,
                controller: newPassController),
            SizedBox(
              height: 16,
            ),
            isLoading
                ? Center(
                    child: circleLoading(),
                  )
                : SizedBox(),
            (() {
              if (responseStatus == -1) {
                return SizedBox();
              } else if (responseStatus == 0) {
                return errorText(AppLocalizations.of(context).requestField);
              } else if (responseStatus == 2) {
                return errorText(AppLocalizations.of(context).validField);
              } else if (responseStatus == 3) {
                return errorText(AppLocalizations.of(context).validField);
              } else if (responseStatus == 200) {
                return successText(
                    AppLocalizations.of(context).successChangePassword);
              } else if (responseStatus == 400) {
                return errorText(
                    AppLocalizations.of(context).warningChangePassword);
              }
              return errorText(
                  AppLocalizations.of(context).errorChangePassword);
            })(),
            SizedBox(
              height: 16,
            ),
            simpleButton(
                label: AppLocalizations.of(context).changePassword,
                doFuction: () async {
                  setState(() {
                    isLoading = true;
                    responseStatus = -1;
                  });
                  String oldPassword = oldPassController.text;
                  String newPassword = newPassController.text;
                  if (oldPassword.isEmpty || newPassword.isEmpty) {
                    setState(() {
                      isLoading = false;
                      responseStatus = 0;
                    });
                  } else {
                    var validOldPass = ValidatePassword(content: oldPassword);
                    var validNewPass = ValidatePassword(content: newPassword);
                    if (!validNewPass.checkLength()) {
                      setState(() {
                        isLoading = false;
                        responseStatus = 2;
                      });
                      return;
                    }
                    if (!validOldPass.checkLength()) {
                      setState(() {
                        isLoading = false;
                        responseStatus = 3;
                      });
                      return;
                    }
                    var response = await UserServices.changePassword(
                        id: widget.id,
                        newPass: newPassword,
                        oldPass: oldPassword,
                        token: widget.token);
                    setState(() {
                      isLoading = false;
                      responseStatus = response.statusCode;
                    });
                  }
                }),
          ],
        )),
      ),
    );
  }
}

class ThemeSetting extends StatefulWidget {
  @override
  _ThemeSettingState createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  int _selectedPosition = 0;
  var isDarkTheme;
  List themes = Constants.themes;
  SharedPreferences prefs;
  ThemeProvider themeNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getSavedTheme();
    });
  }

  _getSavedTheme() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPosition = themes.indexOf(
          prefs.getString(Constants.APP_THEME) ?? Constants.SYSTEM_DEFAULT);
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    themeNotifier = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.SETTING),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return _createList(context, themes[position], position);
          },
          itemCount: themes.length,
        ),
      ),
    );
  }

  _createList(context, item, position) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        _updateState(position);
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Radio(
            value: _selectedPosition,
            groupValue: position,
            activeColor:
                isDarkTheme ? AppColors.secondaryColor : AppColors.textBlack,
            onChanged: (_) {
              _updateState(position);
            },
          ),
          Text(item),
        ],
      ),
    );
  }

  _updateState(int position) {
    setState(() {
      _selectedPosition = position;
    });
    onThemeChanged(themes[position]);
  }

  void onThemeChanged(String value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value == Constants.SYSTEM_DEFAULT) {
      themeNotifier.setThemeMode(ThemeMode.system);
    } else if (value == Constants.DARK) {
      themeNotifier.setThemeMode(ThemeMode.dark);
    } else {
      themeNotifier.setThemeMode(ThemeMode.light);
    }
    prefs.setString(Constants.APP_THEME, value);
  }
}
