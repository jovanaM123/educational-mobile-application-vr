import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/repository/info_rep.dart';
import 'package:edu_app/widgets/psyh_nav.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:edu_app/widgets/video_call.dart';
import 'package:edu_app/widgets/video_call_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:edu_app/repository/voice_call_info_repository.dart';

class VideoCallPsyh extends StatefulWidget {
  static const routeName = '/psyh-video';
  final String userEmail;
  final String id;
  final int user;
  VideoCallInfoRepository _voiceCallInfoRepository =
      new VideoCallInfoRepository();
  InfoRepository _infoRep = new InfoRepository();

  VideoCallPsyh(this.userEmail, this.id, this.user);

  @override
  _VideoCallPsyhState createState() => _VideoCallPsyhState();
}

class _VideoCallPsyhState extends State<VideoCallPsyh> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int get userType => widget.user;
  ClientRole _role = ClientRole.Broadcaster;
  bool canStart = false;
  bool inserted = false;
  String get txtName => txt();

  void callFunction() {
    if (userType == 2) {
      generateToken(context);
    } else {
      isOkayChannelName();
    }
  }

  String txt() {
    if (userType == 2) {
      return 'Napravi kod';
    } else {
      return 'Verifikujte kod';
    }
  }

  //slanje emaila

  Future<bool> sendEmail(String token) async {
    String username = await _getUsername();
    String password = await _getPassword();

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'App')
      ..recipients.add(widget.userEmail)
      ..subject = 'Imate zakazan video poziv'
      ..text = getEmailBody(token);

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return true;
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code.toString()}: ${p.msg.toString()}');
      }
      return false;
    }
  }

  String getEmailBody(String token) {
    return "Poštovani,"
        "\n"
        "\n"
        "imate zakazan poziv sa doktorom na našoj aplikaciji. Kod za pristup pozivu je: ${token}"
        "\n"
        "\n"
        "Pozdrav.";
  }

  Future<String> _getUsername() async {
    await widget._infoRep.getUsername();
    return widget._infoRep.username;
  }

  Future<String> _getPassword() async {
    await widget._infoRep.getPassword();
    return widget._infoRep.password;
  }

  void generateToken(BuildContext context) {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });

    if (!_channelController.text.isEmpty) {
      String token = _channelController.text;

      try {
        widget._voiceCallInfoRepository
            .addVCInfo(widget.userEmail, widget.id, token);

        setState(() {
          inserted = true;
        });

        FocusScope.of(context).unfocus();
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Uspešno napravljena soba za video poziv.')));
      } catch (error) {
        print('greska ' + error.toString());
      }
    }
  }

  void isOkayChannelName() async {
    // u bazi sacuvaj id, user imejl posle iz baze to vadis
    await widget._voiceCallInfoRepository.getToken(widget.id);
    String tkn = widget._voiceCallInfoRepository.tkn;

    if (tkn == _channelController.text) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Uspešno verifikovan kod. Možete pristupiti pozivu.')));

      setState(() {
        canStart = true;
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
              'Netačan kod! Mejlom je poslat potreban kod od strane doktora.')));
    }
  }

  void sendMail() async {
    String token = _channelController.text;
    if (!_channelController.text.isEmpty && inserted) {
      bool isSend = await sendEmail(token);

      if (isSend) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content:
                Text('Mejl sa potrebnim informacijama je poslat koriniku.')));

        setState(() {
          canStart = true;
        });
      } else {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('Greška! Pokušajte opet!')));
      }
    }
  }

  Future<void> onJoin() async {
    if (userType == 1) {
      _role = ClientRole.Audience;
    }

    if (canStart) {
      //get permission for cam and micr
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCall(_channelController.text, ClientRole.Broadcaster),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: userType == 2 ? PsyhNav() : UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Builder(
                      builder: (context) => Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Text(
                          userType == 2
                              ? 'Napravite kod za razgovor'
                              : 'Razgovor',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                            controller: _channelController,
                            decoration: InputDecoration(
                              errorText: _validateError
                                  ? 'Ime koda je obavezno'
                                  : null,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              hintText: 'Ime koda za razgovor',
                            ),
                          )),
                        ],
                      ),
                    ),
                    VideoCallButtons(callFunction, txtName),
                    if (userType == 2)
                      VideoCallButtons(sendMail, 'Pošalji korisniku poziv'),
                    VideoCallButtons(onJoin, 'Započni razgovor'),
                  ],
                ),
              ),
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




