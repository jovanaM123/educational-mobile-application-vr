import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/widgets/ah_main_image.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AhMain extends StatelessWidget {
  static const routeName = '/ah-home';

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
                          'Mentalna retardiranost',
                          'assets/images/mental_illness.png',
                          Colors.pink[200],
                          Colors.pink,
                          1, 1),
                      AhMainImage('Autizam', 'assets/images/autism.png',
                          Colors.green[200], Colors.green, 2, 1),
                      AhMainImage('Daunov sindrom', 'assets/images/down.png',
                          Colors.orange[200], Colors.orange, 3, 1),
                    ],
                  ),
                ),
              ],
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
