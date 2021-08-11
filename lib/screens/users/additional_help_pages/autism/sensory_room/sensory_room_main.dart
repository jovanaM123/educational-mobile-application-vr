import 'package:audioplayers/audioplayers.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/first_room.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/sensory_activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SensoryRoomMain extends StatefulWidget {
  static const routeName = "/sensory-room-main";

  @override
  _SensoryRoomMainState createState() => _SensoryRoomMainState();
}

class _SensoryRoomMainState extends State<SensoryRoomMain> {
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
                      Navigator.of(context).pushNamed(FirstRoom.routeName);
                    },
                    child: Text(
                      'Senzorna soba',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.pink, fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      player.stop();
                      Navigator.of(context).pushNamed(SensoryActivites.routeName);
                    },
                    child: Text(
                      'Pratite aktivnosti vašeg deteta',
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
                  player.stop();
                  Navigator.of(context).pushNamed('/');
                },
              ))
        ],
      ),
    );
  }
}