import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/autism_main.dart';
import 'package:edu_app/widgets/ah_main_image.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutismActivities extends StatelessWidget {
  static const routeName = '/autism-activities';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      AhMainImage('Brojevi', 'assets/images/brojevi.png',
                          Colors.white, Colors.white, 1, 3),
                      AhMainImage('Voće i povrće', 'assets/images/voceipovrce.png',
                          Colors.white, Colors.white, 2, 3),
                      AhMainImage('Slova', 'assets/images/slovo.png',
                          Colors.white, Colors.white, 3, 3),
                      AhMainImage('Reči', 'assets/images/reci.png',
                          Colors.white, Colors.white, 4, 3),
                      AhMainImage('Životinje', 'assets/images/zivotinje.png',
                          Colors.white, Colors.white, 5, 3),
                      AhMainImage('Godišnja doba', 'assets/images/goddoba.png',
                          Colors.white, Colors.white, 6, 3),
                      AhMainImage('Raspoloženja', 'assets/images/moods.png',
                          Colors.white, Colors.white, 7, 3),
                      AhMainImage('Učenje reakcija', 'assets/images/videi.png',
                          Colors.white, Colors.white, 8, 3),
                      AhMainImage('Senzorna soba', 'assets/images/senzorna.jpg',
                          Colors.white, Colors.white, 9, 3),
                    ],
                  ),
                ),
              ],
            ),
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
                        Navigator.of(context).pushNamed(AutismMain.routeName);
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
