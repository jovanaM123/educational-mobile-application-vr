import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/sensory_room_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';


class FirstRoom extends StatefulWidget {
  static const routeName = "/sensory-room";

  FirstRoom({Key key}) : super(key: key);

  @override
  _FirstRoomState createState() => _FirstRoomState();
}

class _FirstRoomState extends State<FirstRoom>{
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  UnityWidgetController _unityWidgetController;

  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () {
            Navigator.of(context).pushNamed(SensoryRoomMain.routeName);
          },
          child: Container(
            color: Colors.yellow,
            child: UnityWidget(
              onUnityCreated: onUnityCreated,
            ),
          ),
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}