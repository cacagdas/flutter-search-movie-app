import 'package:flutter/material.dart';
import 'package:search_movie_app/values/colors.dart' as colors;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Movies',
        //style: TextStyle(color: Theme.of(context).primaryColor),
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: colors.accentColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
