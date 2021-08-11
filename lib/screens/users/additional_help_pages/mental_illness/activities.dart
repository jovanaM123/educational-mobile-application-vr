import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/brush_teeth.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/dressing.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/eating.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/footwear.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/handshaking.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/washing_hands.dart';
import 'package:edu_app/widgets/mental_illness_list_btn.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ah_main.dart';
import 'mental_illness_main.dart';

class Activities extends StatelessWidget {
  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {

    void goTo1() {
    Navigator.of(context).pushNamed(BrushTeeth.routeName);
  }

  void goTo2() {
    Navigator.of(context).pushNamed(Footwear.routeName);
  }

  void goTo3() {
    Navigator.of(context).pushNamed(Dressing.routeName);
  }

  void goTo4() {
    Navigator.of(context).pushNamed(WashingHands.routeName);
  }

  void goTo5() {
    Navigator.of(context).pushNamed(HandShaking.routeName);
  }

  void goTo6() {
    Navigator.of(context).pushNamed(Eating.routeName);
  }
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 90.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(children: <Widget>[
                        MentalIllnessListBtn(goTo1, Colors.pink, Colors.orangeAccent, 'Pranje zuba'),
                        MentalIllnessListBtn(goTo2, Colors.blue, Colors.green, 'Obuvanje obuće'),
                        MentalIllnessListBtn(goTo3, Colors.deepPurple, Colors.purpleAccent, 'Oblačenje odeće'),
                        MentalIllnessListBtn(goTo4, Colors.red, Colors.blue, 'Pranje ruku'),
                        MentalIllnessListBtn(goTo5, Colors.yellow, Colors.orange, 'Rukovanje'),
                        MentalIllnessListBtn(goTo6, Colors.lightGreenAccent, Colors.green, 'Jedenje'),
                      ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        Navigator.of(context).pushNamed(MentalIllnessMain.routeName);
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
                        Navigator.of(context).pushNamed('/');
                      },
                    )),
              ])
        ],
      ),
    );
  }
}
