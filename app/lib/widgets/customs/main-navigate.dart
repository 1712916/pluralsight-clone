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
  int _selectedIndex=0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Downloads(),
    Browse(),
    Search()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LoginProvider()),
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
          onTap: _onItemTapped,
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
