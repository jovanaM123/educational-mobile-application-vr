import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/repository/psyh_details_respiratory.dart';
import 'package:edu_app/widgets/psyh_nav.dart';
import 'package:edu_app/widgets/psyh_profile_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PsyhHomeScreen extends StatefulWidget {
  static const routeName = '/psyh-home';
  PsyhDetailsRespiratory _psyhDetailsRespiratory = new PsyhDetailsRespiratory();

  @override
  _PsyhHomeScreenState createState() => _PsyhHomeScreenState();
}

class _PsyhHomeScreenState extends State<PsyhHomeScreen> {
  PsyhDetailsRespiratory get _psyhDetails => widget._psyhDetailsRespiratory;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: PsyhNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 120),
              child: Column(children: <Widget>[
                Text(
                  'Dobro došli na sajt',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  '*Napomena ukoliko niste korisnik aplikacije! Da biste postali korisnik aplikacije potrebno je da unesete informacije o sebi kreiranjem naloga.',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PsyhProfileInfo.routeName);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.green, Colors.blue]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 88.0,
                          minHeight: 36.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Kreiraj nalog',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
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
