import 'package:flutter/material.dart';
import 'package:search_movie_app/values/colors.dart' as colors;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Movies',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite, color: Colors.white,),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: colors.accentColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
