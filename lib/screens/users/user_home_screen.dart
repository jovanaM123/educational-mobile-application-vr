import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHomeScreen extends StatelessWidget {
  static const routeName = '/user-home';

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
                  Text(
                    'Dobro došli',
                    style: TextStyle(fontSize: 25, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/pocetna.png',
                    fit: BoxFit.cover,
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
    );
  }
}
