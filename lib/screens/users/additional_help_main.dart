import 'package:audioplayers/audioplayers.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ah_main.dart';

class AdditionalHelpMain extends StatefulWidget {
  static const routeName = 'additional-help-main';

  @override
  _AdditionalHelpMainState createState() => _AdditionalHelpMainState();
}

class _AdditionalHelpMainState extends State<AdditionalHelpMain> {
  AudioPlayer player = AudioPlayer();

  void play() {
    player.play('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/uvod.wav?alt=media&token=7c59480c-5c19-43e7-9564-0e2244df3b30');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.stop();
    super.dispose();
  }

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
                  Ink.image(
                    image: AssetImage('assets/images/a1.png'),
                    fit: BoxFit.cover,
                    width: 200.0,
                    height: 200.0,
                    child: InkWell(
                        onTap: play,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Text('-Klikni na sliku za zvuk-',
                                style: TextStyle(
                                    color: Colors.black54)),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      player.stop();
                      Navigator.of(context).pushNamed(AhMain.routeName);
                    },
                    child: Text(
                      'Preskoči korak',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.pink, fontSize: 24),
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
                  player.stop();
                  Navigator.of(context).pushNamed('/');
                },
              ))
        ],
      ),
    );
  }
}
