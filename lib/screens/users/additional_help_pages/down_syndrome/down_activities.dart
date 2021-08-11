import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/down_syndrome_main.dart';
import 'package:edu_app/widgets/ah_main_image.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaunActivities extends StatelessWidget {
  static const routeName = '/daun-activities';

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
                      AhMainImage(
                          'Brojevi',
                          'assets/images/brojevi.png',
                          Colors.white,
                          Colors.white,
                          1, 2),
                      AhMainImage('Životinje', 'assets/images/zivotinje.png',
                          Colors.white, Colors.white, 2, 2),
                      AhMainImage('Oblici', 'assets/images/oblici.png',
                          Colors.white, Colors.white, 3, 2),
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
                        Navigator.of(context).pushNamed(DownSyndromeMain.routeName);
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
