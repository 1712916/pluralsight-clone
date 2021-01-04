import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line

class DiconnectTypeA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.warning_rounded),
          Text(AppLocalizations.of(context).sorry),
          Text(AppLocalizations.of(context).unexpectedHappened),
          SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context).tryAgain),
          ),
          OutlineButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context).contactUs),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(4.0)))
        ],
      ),
    );
  }
}

class DiconnectTypeB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.warning_rounded),
          Text(AppLocalizations.of(context).youAreOffline),
          Text(AppLocalizations.of(context).tryConnectInternet),
          SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context).tryAgain),
          ),
        ],
      ),
    );
  }
}
