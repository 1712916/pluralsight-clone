import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/widgets/authenticate/profile.dart';
import 'package:flutter/material.dart';

const List<String> choices = <String>[
  "Settings",
  "Send feedback",
  "Contact support",
];

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  CustomAppBar(this._title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          tooltip: 'Profile',
          onPressed: () {
            Navigator.pushNamed(
              context,
              Profile.routeName,
            );
          },
        ),
        PopupMenuButton(
            tooltip: 'Setting More',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<int>(
                  value: choices.indexOf(choice),
                  child: Text(choice),
                );
              }).toList();
            })
      ],
    );
  }

  void _select(int choiceIndex) {
    switch (choiceIndex) {
      case 0:
        {

        }
        break;
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      default:
        {}
        break;
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return new Size.fromHeight(AppBar().preferredSize.height);
  }
}
