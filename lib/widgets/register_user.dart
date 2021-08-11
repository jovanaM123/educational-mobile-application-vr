
import 'package:edu_app/screens/psyhologists/psyh_register_screen.dart';
import 'package:edu_app/screens/users/user_register_screen.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatelessWidget {
  final int type;

  RegisterUser(this.type);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if(type == 1) {
          Navigator.of(context).pushNamed(UserRegisterScreen.routeName);
        } else {
          Navigator.of(context).pushNamed(PsyhRegisterScreen.routeName);
        }
      },
      child: Text('Kreiraj novog korisnika', style: TextStyle(color: type == 1 ? Colors.pink : Colors.green, fontSize: 16),),
    );
  }
}
