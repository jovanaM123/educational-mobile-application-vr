import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/autism_activities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../autism_page_widget.dart';
import '../../user_nav.dart';

class PickGamesWidget extends StatelessWidget {
  const PickGamesWidget({
    Key key,
    @required this.list,
    @required this.count,
  }) : super(key: key);

  final List<PageAutism> list;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: double.maxFinite,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 20
              ),
              child: ListView.builder(
                itemCount: count,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AutismPageWidget(list[index].func, list[index].imageUrl, list[index].title);
                },
                scrollDirection: Axis.horizontal,
              ),
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
                        Navigator.of(context)
                            .pushNamed(AutismActivities.routeName);
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
