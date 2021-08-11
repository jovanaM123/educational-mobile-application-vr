import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/user/va_main_bloc.dart';
import 'package:edu_app/repository/child_repository.dart';
import 'package:edu_app/widgets/add_form.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionalHelpQuiz extends StatefulWidget {
  static const routeName = '/user-help-quiz';
  ChildRepository _childRepository = new ChildRepository();

  @override
  _AdditionalHelpQuizState createState() => _AdditionalHelpQuizState();
}

class _AdditionalHelpQuizState extends State<AdditionalHelpQuiz> {
  VaMainBloc _vaMainBloc;

  ChildRepository get childRepository => widget._childRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vaMainBloc = VaMainBloc(childRepository: childRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _vaMainBloc.close();
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
          BlocProvider<VaMainBloc>(
            create: (context) => _vaMainBloc,
            child: Container(
              child: AddForm(),
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
