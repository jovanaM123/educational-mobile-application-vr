
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/psyhologist/add_psyh_bloc.dart';
import 'package:edu_app/repository/psyh_details_respiratory.dart';
import 'package:edu_app/widgets/psyh_nav.dart';
import 'package:edu_app/widgets/psyh_user_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PsyhProfileInfo extends StatefulWidget {
  static const routeName = '/psyh-add';
  final PsyhDetailsRespiratory _addPsyhRes = new PsyhDetailsRespiratory();

  @override
  _PsyhProfileInfoState createState() => _PsyhProfileInfoState();
}

class _PsyhProfileInfoState extends State<PsyhProfileInfo> {
  AddPsyhBloc _psyhBloc;
  PsyhDetailsRespiratory get userRep => widget._addPsyhRes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _psyhBloc = AddPsyhBloc(userRepository: userRep);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _psyhBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: PsyhNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          BlocProvider<AddPsyhBloc>(
            create: (context) => _psyhBloc,
            child: PsyhUserForrm(),
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
