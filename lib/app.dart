import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:search_movie_app/ui/pages/home/home.page.dart';
import 'package:search_movie_app/values/theme.dart';

class App extends StatelessWidget {
  bool _isDarkModeEnabled() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    //return darkModeOn;
    return false; //dark mode is unused
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
    ],
    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _isDarkModeEnabled() ? darkTheme : appTheme,
          home: HomePage(),
        ),
  );
}
