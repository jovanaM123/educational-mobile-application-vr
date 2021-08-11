
import 'package:edu_app/screens/psyhologists/psyh_confirm_apoiment.dart';
import 'package:edu_app/screens/psyhologists/psyh_contact_screen.dart';
import 'package:edu_app/screens/psyhologists/psyh_home_screen.dart';
import 'package:edu_app/screens/psyhologists/video_call_psyh.dart';
import 'package:flutter/material.dart';

class PsyhNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Builder(builder: (BuildContext context) {
      return BottomAppBar(
        color: Colors.orangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home_outlined), onPressed: () {
              Navigator.of(context).pushNamed(PsyhHomeScreen.routeName);
            }),
            IconButton(icon: Icon(Icons.calendar_today_outlined), onPressed: () {
              Navigator.of(context).pushNamed(PsyhConfirmApoiment.routeName);
            }),
            IconButton(icon: Icon(Icons.list_alt), onPressed: () {
              Navigator.of(context).pushNamed(PsyhContactScreen.routeName);
            }),
          ],
        ),
      );
    },);
  }
}
