import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/user/child_act_bloc.dart';
import 'package:edu_app/repository/child_activities_repository.dart';
import 'package:edu_app/widgets/add_child_act_form.dart';
import 'package:edu_app/widgets/user_nav.dart';

class InsertSensoryActivites extends StatefulWidget {
  static const routeName = "/sensory-act-ins";
  final ChildActivitiesRepository _childActivitiesRepository = new ChildActivitiesRepository();

  @override
  _InsertSensoryActivitesState createState() => _InsertSensoryActivitesState();
}

class _InsertSensoryActivitesState extends State<InsertSensoryActivites> {
  ChildActivitiesRepository get actRep => widget._childActivitiesRepository;
  ChildActBloc _childActbloc;

  @override
  void initState() {
    super.initState();
    _childActbloc = ChildActBloc(childActivitiesRepository: actRep);
  }

  @override
  void dispose() {
    _childActbloc.close();
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
                    BlocProvider<ChildActBloc>(
                      create: (context) => _childActbloc,
                      child: AddChildActForm(),
                    )
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

