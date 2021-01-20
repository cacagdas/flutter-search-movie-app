import 'package:flutter/material.dart';
import 'package:search_movie_app/ui/widgets/text.dart';
import 'package:search_movie_app/values/colors.dart' as colors;

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final bool transparent;
  final IconData icon;

  final double _elevation = 3;

  const ButtonWidget(
      {Key key,
      this.label,
      this.onPress,
      this.disabled,
      this.transparent,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkModeEnabled() {
      var brightness = MediaQuery.of(context).platformBrightness;
      bool darkModeOn = brightness == Brightness.dark;
      //return darkModeOn;
      return false; //dark mode is unused
    }

    //final action = disabled == true ? null : onPress;
    final action = onPress;

    Color backgroundColor = colors.backgroundColor;
    Color borderColor = colors.backgroundColor;
    Color textColor = Colors.white;

    if (transparent == true) {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.accentLightColor;
      textColor = colors.accentLightColor;
    } else {
      backgroundColor = disabled
          ? colors.disabledTextColor
          : (_isDarkModeEnabled() ? colors.accentColor : colors.accentColor);
      borderColor = disabled
          ? colors.disabledTextColor
          : (_isDarkModeEnabled() ? colors.accentColor : colors.accentColor);
      textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 45.0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(20)),
          onPressed: action,
          elevation: _elevation,
          color: backgroundColor,
          child: TextWidget(
              text: label.toUpperCase() ?? "Label",
              small: true,
              color: textColor)),
    );
  }
}
