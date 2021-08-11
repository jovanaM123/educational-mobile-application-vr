import 'package:audioplayers/audioplayers.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/widgets/ah_button.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ah_main.dart';

class MentalIllnesMainPage extends StatefulWidget {
  final VoidCallback _goTo;
  final String audioLink;
  final int type;

  MentalIllnesMainPage(this._goTo, this.audioLink, this.type);

  @override
  _MentalIllnesMainPageState createState() => _MentalIllnesMainPageState();
}

class _MentalIllnesMainPageState extends State<MentalIllnesMainPage> {
  final player = AudioPlayer();
  String title;

  void play() {
    player.play(widget.audioLink);
  }

  @override
  void initState() {
    // TODO: implement initState
   title = widget.type == 1 ? "Dalje" : "Počni";
    super.initState();
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
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: AhButton(widget._goTo, 1, title, player),
                  ),
                ]),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () {
                        BlocProvider.of<UserAuthBloc>(context).add(
                          LoggedOut(),
                        );
                        player.stop();
                        Navigator.of(context).pushNamed(AhMain.routeName);
                      },
                    )),
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
                    )),
              ])
        ],
      ),
    );
  }
}
