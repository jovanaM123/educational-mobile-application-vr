import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/activities_info.dart';

class AllSensoryActivites extends StatefulWidget {
  static const routeName = "/sensory-act-all";

  @override
  _AllSensoryActivitesState createState() => _AllSensoryActivitesState();
}

class _AllSensoryActivitesState extends State<AllSensoryActivites> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          ActivitiesInfo(),
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

