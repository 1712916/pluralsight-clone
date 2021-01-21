 import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/widgets/settings/profile.dart';
import 'file:///C:/Users/DELL/Desktop/2020/mobile%20nang%20cao/pluralsight-clone/app/lib/widgets/settings/settings.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  CustomAppBar(this._title);


  @override
  Widget build(BuildContext context) {
    List<String> choices = <String>[
      AppLocalizations.of(context).setting,
      AppLocalizations.of(context).sendFeedback,
      AppLocalizations.of(context).contactSupport,
    ];
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
            onSelected: (index)=>{
              _select(index,context)
            },
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

  void _select(int choiceIndex, BuildContext context) {
    switch (choiceIndex) {
      case 0:
        {
          Navigator.pushNamed(
            context,
            Settings.routeName,
          );
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
