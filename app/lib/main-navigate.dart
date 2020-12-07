import 'package:app/models/author-provider.dart';
import 'package:app/models/course-provider.dart';
import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/models/login-provider.dart';
import 'package:app/widgets/main_screen/browse/browse.dart';
import 'package:app/widgets/main_screen/downloads/downloads.dart';
import 'package:app/widgets/main_screen/home/home.dart';
import 'package:app/widgets/main_screen/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainNavigate extends StatefulWidget {
  MainNavigate({Key key}) : super(key: key);
  @override
  _MainNavigateState createState() => _MainNavigateState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainNavigateState extends State<MainNavigate> {


  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Downloads(),
    Browse(),
    Search()
  ];



  @override
  Widget build(BuildContext context) {
    var  currentBottomNavigatorProvider= Provider.of<CurrentBottomNavigatorProvider>(context);
    int _selectedIndex=currentBottomNavigatorProvider.currentIndex;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LoginProvider()),
        Provider(create: (context)=>CourseProvider(),),
        ChangeNotifierProxyProvider<CourseProvider, BookmarkProvider>(
          create: (context) => BookmarkProvider(),
          update: (context, courseProvider, bookmark) {
            bookmark.courseProvider = courseProvider;
            return bookmark;
          },
        ),
        Provider(create: (context)=>AuthorProvider()),
      ],
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_sharp),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps_sharp),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
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
      ),
    );
  }
}
