
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/psyhologist/list_of_appionment_bloc.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:edu_app/screens/psyhologists/psyh_lis_appoinment.dart';
import 'package:edu_app/widgets/psyh_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PsyhConfirmApoiment extends StatefulWidget {
  static const routeName = '/psyh-confirm';
  AddApoinmentyRepository _addApoinmentyRepository = new AddApoinmentyRepository();

  @override
  _PsyhConfirmApoimentState createState() => _PsyhConfirmApoimentState();
}

class _PsyhConfirmApoimentState extends State<PsyhConfirmApoiment> {
  ListOfAppionmentBloc _listOfAppionmentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listOfAppionmentBloc = new ListOfAppionmentBloc(addApoinmentyRepository: widget._addApoinmentyRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _listOfAppionmentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: PsyhNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget> [BlocProvider<ListOfAppionmentBloc>(
          create: (context) => _listOfAppionmentBloc,
          child:  Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(children: <Widget>[
              Text(
                'Zakazani pregledi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              PsyhListAppoiinment()
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
