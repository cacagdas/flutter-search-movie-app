import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData appTheme = ThemeData(
    primaryColor: colors.primaryColor,
    accentColor: colors.accentColor,
    primaryColorLight: colors.accentColor,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: AppBarTheme(
      //color: colors.primaryColor,
        color: Colors.white,
        iconTheme: IconThemeData(color: colors.accentLightColor)
    ),

    textTheme: Typography.blackCupertino,

    buttonTheme: ButtonThemeData(
        buttonColor: colors.accentLightColor,
        disabledColor: colors.primaryColorDark
    ),

);

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    accentColor: colors.accentColor,
    primaryColorDark: Colors.white,
    primaryColorLight: colors.backgroundColorDarkLighter,
    scaffoldBackgroundColor: colors.backgroundColorDark,
    errorColor: Color(0xFFFE6E00),

    textTheme: Typography.whiteCupertino,

    appBarTheme: AppBarTheme(
      //color: colors.primaryColor,
        color: Colors.black,
        iconTheme: IconThemeData(color: colors.accentLightColor)
    ),

    buttonTheme: ButtonThemeData(
        buttonColor: colors.accentLightColor,
        disabledColor: colors.primaryColorDark
    ),

);
