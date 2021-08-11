import 'package:flutter/material.dart';

class ChildActivities {
  final String id;
  final String users_email;
  final int type;
  final DateTime date_added;
  final int minute_spend;
  final int grade;

  ChildActivities({
    @required this.id,
    @required this.users_email,
    @required this.type,
    @required this.date_added,
    @required this.minute_spend,
    @required this.grade
  });

}