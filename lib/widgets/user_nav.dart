
import 'package:edu_app/screens/users/additional_help.dart';
import 'package:edu_app/screens/users/user_home_screen.dart';
import 'package:edu_app/screens/users/user_psyh_list.dart';
import 'package:edu_app/screens/users/list_of_app.dart';
import 'package:flutter/material.dart';

class UserNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return BottomAppBar(
        color: Colors.orangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home_outlined), onPressed: () {
              Navigator.of(context).pushNamed(UserHomeScreen.routeName);
            }),
            IconButton(icon: Icon(Icons.psychology_outlined), onPressed: () {
              Navigator.of(context).pushNamed(UserPsyhList.routeName);
            }),
            IconButton(icon: Icon(Icons.calendar_today_outlined), onPressed: () {
              Navigator.of(context).pushNamed(ListOfApp.routeName);
            }),
            IconButton(icon: Icon(Icons.help_outline), onPressed: () {
              Navigator.of(context).pushNamed(AdditionalHelp.routeName);
            }),
          ],
        ),
      );
    },);
  }
}
