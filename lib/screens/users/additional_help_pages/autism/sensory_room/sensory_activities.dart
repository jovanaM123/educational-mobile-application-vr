import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/insert_act.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/all_act.dart';

class SensoryActivites extends StatelessWidget {
  static const routeName = "/sensory-act";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(InsertSensoryActivites.routeName);
                    },
                    child: Text(
                      'Unesite aktivnosti vašeg deteta',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.pink, fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AllSensoryActivites.routeName);
                    },
                    child: Text(
                      'Aktivnosti vašeg deteta',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.blue, fontSize: 24),
                    ),
                  ),
                ]),
          ),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  BlocProvider.of<UserAuthBloc>(context).add(
                    LoggedOut(),
                  );
                  Navigator.of(context).pushNamed('/');
                },
              ))
        ],
      ),
    );  }
}

