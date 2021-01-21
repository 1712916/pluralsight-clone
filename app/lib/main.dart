 import 'package:app/models/current-bottom-navigator.dart';
import 'package:app/provider/answer-provider.dart';
import 'package:app/provider/bookmark-provider.dart';
import 'package:app/provider/download-proivder.dart';
import 'package:app/provider/theme-provider.dart';
import 'package:app/provider/video-provider.dart';
 import 'package:app/utils/app-theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main-navigate.dart';
import 'provider/login-provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';

import 'utils/constraints.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  prefs.then((value) {
    runApp(
      ChangeNotifierProvider<ThemeProvider>(
        create: (BuildContext context) {
          String theme = value.getString(Constants.APP_THEME);
          if (theme == null ||
              theme == "" ||
              theme == Constants.SYSTEM_DEFAULT) {
            value.setString(Constants.APP_THEME, Constants.SYSTEM_DEFAULT);
            return ThemeProvider(ThemeMode.system);
          }
          return ThemeProvider(
              theme == Constants.DARK ? ThemeMode.dark : ThemeMode.light);
        },
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    // var bookmarkProvider=BookmarkProvider();
    // (() async {
    //   await bookmarkProvider.bookmarkSQL.open();
    // })();
    return MaterialApp(

      title: 'Meow sight',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeNotifier.getThemeMode(), //Change theme here
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('vi', ''), // Arabic, no country code
      ],
      home:
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>LoginProvider()),
            ChangeNotifierProvider(create: (context)=>VideoProvider()),
            ChangeNotifierProvider(create: (context)=>CurrentBottomNavigatorProvider()),
            ChangeNotifierProvider(create: (context)=>BookmarkProvider()),
            ChangeNotifierProvider(create: (context)=>DownloadProvider()),
            Provider(create: (context)=>AnswerProvider())
          ],
          child: MainNavigate(),
        ),

      debugShowCheckedModeBanner: false,

    );
  }
}
