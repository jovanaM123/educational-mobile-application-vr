import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/user/user_appoinment_bloc.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:edu_app/widgets/user_list_of_app.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfApp extends StatefulWidget {
  static const routeName = "/list-of-users-app";

  AddApoinmentyRepository _addApoinmentyRepository =
  new AddApoinmentyRepository();

  @override
  _ListOfAppState createState() =>
      _ListOfAppState();
}

class _ListOfAppState
    extends State<ListOfApp> {
  UserAppoinmentBloc _userAppoinmentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userAppoinmentBloc = new UserAppoinmentBloc(
        addApoinmentyRepository: widget._addApoinmentyRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userAppoinmentBloc.close();
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
          BlocProvider<UserAppoinmentBloc>(
            create: (context) => _userAppoinmentBloc,
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(children: <Widget>[
                Text(
                  'Pregledi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                UserListOfApp()
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
