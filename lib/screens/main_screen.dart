import 'package:edu_app/widgets/user_card_checkout.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            UserCardCheckout(Colors.pink[200], Colors.pink, 'assets/images/users.png', 'Korisnici', true),
            UserCardCheckout(Colors.green[200], Colors.green, 'assets/images/admin.png', 'Doktori', false),
          ],
        ),
      ),
    );
  }
}
