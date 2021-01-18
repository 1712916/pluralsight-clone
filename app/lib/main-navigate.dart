 import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/provider/bookmark-provider.dart';
import 'package:app/provider/login-provider.dart';
 import 'package:app/services/user-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/main_screen/browse/browse.dart';
import 'package:app/widgets/main_screen/downloads/downloads.dart';
import 'package:app/widgets/main_screen/home/home.dart';
import 'package:app/widgets/main_screen/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user-response-model.dart';
import 'widgets/authenticate/sign-in.dart';

 import 'package:flutter_localizations/flutter_localizations.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainNavigate extends StatefulWidget {
  MainNavigate({Key key}) : super(key: key);
  @override
  _MainNavigateState createState() => _MainNavigateState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainNavigateState extends State<MainNavigate> {
  bool isLoading=true;
  int _selectedIndex;
  var  currentBottomNavigatorProvider;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),

   Downloads(),
    Browse(),
     SupperSearch()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLoading=true;
     loadAccount(context);



  }
  @override
  Widget build(BuildContext context) {
    currentBottomNavigatorProvider= Provider.of<CurrentBottomNavigatorProvider>(context );
    _selectedIndex=currentBottomNavigatorProvider.currentIndex;
    return isLoading?Scaffold(

      body: Center(
        child: circleLoading(),
      ),
    ):
    Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:currentBottomNavigatorProvider.isHidden?null:BottomNavigationBar(
        items:   <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label:  AppLocalizations.of(context).home ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_sharp),
            label:  AppLocalizations.of(context).download,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_sharp),
            label:  AppLocalizations.of(context).browse,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppLocalizations.of(context).search,
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: (index){
          currentBottomNavigatorProvider.update(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
      ),
    );
  }
  void loadAccount(BuildContext context) async {

    final prefs = await SharedPreferences.getInstance();
    final emailKey = 'email';
    final passwordKey = 'password';
    final isLoginKey = 'isLogin';

    String email = prefs.getString(emailKey);

   List<String> password = prefs.getStringList(passwordKey);


    bool isLogin = prefs.getBool(isLoginKey);

    if(isLogin!=null && isLogin ){
      if(email!=null && password!=null && password.isNotEmpty){
        var response = await UserServices.loginService(email: email, password: decodePassword(password));
        if (response.statusCode == 200) {
          var userResponse = userResponseModelFromJson(response.body);

          Provider.of<LoginProvider>(context).setUserResponse(userResponse);
          Provider.of<LoginProvider>(context).changeState();
          String userId= userResponse.userInfo.id;
          Provider.of<BookmarkProvider>(context).userId=userId;
          BookmarkSQL bookmarkSQL=Provider.of<BookmarkProvider>(context).bookmarkSQL;


          List<dynamic> bookmarkFromSqlite=await bookmarkSQL.getData(userId);
          Provider.of<BookmarkProvider>(context).courseIds=bookmarkFromSqlite;
          // Provider.of<BookmarkProvider>(context).courseIds=[];
          // for(int i=0;i<bookmarkFromSqlite.length;i++){
          //   Provider.of<BookmarkProvider>(context).courseIds.add(bookmarkFromSqlite[i].courseId);
          // }
          Provider.of<BookmarkProvider>(context).notifyListeners();
        }
      }
    }

  setState(() {
    isLoading=false;
  });
  }

}

