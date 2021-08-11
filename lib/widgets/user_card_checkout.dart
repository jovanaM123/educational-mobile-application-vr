
import 'package:edu_app/screens/psyhologists/psyh_login_screen.dart';
import 'package:edu_app/screens/users/user_login_screen.dart';
import 'package:flutter/material.dart';


class UserCardCheckout extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String imageUrl;
  final String title;
  final bool isUser;


  const UserCardCheckout(
    this.color1,
    this.color2,
    this.imageUrl,
    this.title,
    this.isUser
  );

  @override
  Widget build(BuildContext context) {

    void _navigateToLoginPage() {
      if(isUser) {
        Navigator.of(context).pushNamed(UserLoginScreen.routeName);
      } else {
        Navigator.of(context).pushNamed(PsyhLoginScreen.routeName);
      }
    }


    return InkWell(
      onTap: _navigateToLoginPage,
      child: Card(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [color1, color2])
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(imageUrl, width: 150, height: 150,),
              Text(title, style: TextStyle(fontSize: 20, color: Colors.white70),),
            ],
          ),
        ),
      ),
    );
  }
}
