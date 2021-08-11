import 'package:flutter/material.dart';

class Appoinment {
  final String id;
  final String dr_email;
  final String user_email;
  final String date_of_ap;
  int accepted = 0;

  Appoinment({
    @required this.id,
    @required this.dr_email,
    @required this.user_email,
    @required this.date_of_ap,
    this.accepted,
  });

}