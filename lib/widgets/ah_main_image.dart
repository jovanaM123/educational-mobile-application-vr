import 'package:edu_app/screens/users/additional_help_pages/autism/animals/animals_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/moods/moods_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/autism_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/letters/letters_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/numbers/numbers_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/seasons/seasons_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/sensory_room_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/social_video/social_video_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/vegetables/vegetables_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/words/words_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/animals.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/down_syndrome_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/numbers.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/objects.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/mental_illness_main.dart';
import 'package:flutter/material.dart';

import 'games/autism/video_player.dart';

class AhMainImage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color color1;
  final Color color2;
  final int page;
  final int type;

  AhMainImage(this.title, this.imageUrl, this.color1, this.color2, this.page,
      this.type);

  @override
  Widget build(BuildContext context) {
    Color color = type != 1 ? Colors.black54 : Colors.white70;

    void _navigateToThePage() {
      if (type == 1) {
        //MAIN PAGES
        if (page == 1) {
          Navigator.of(context).pushNamed(MentalIllnessMain.routeName);
        } else if (page == 2) {
          Navigator.of(context).pushNamed(AutismMain.routeName);
        } else {
          Navigator.of(context).pushNamed(DownSyndromeMain.routeName);
        }
      } else if (type == 2) {
        //DAUN
        if (page == 1) {
          Navigator.of(context).pushNamed(Numbers.routeName);
        } else if (page == 2) {
          Navigator.of(context).pushNamed(Animals.routeName);
        } else if (page == 3) {
          Navigator.of(context).pushNamed(Objects.routeName);
        }
      } else if (type == 3) {
        //AUTISM
        if (page == 1) {
          Navigator.of(context).pushNamed(NumbersMain.routeName);
        } else if (page == 2) {
          Navigator.of(context).pushNamed(VegetablesMain.routeName);
        } else if (page == 3) {
          Navigator.of(context).pushNamed(LettersMain.routeName);
        } else if (page == 4) {
          Navigator.of(context).pushNamed(WordsMain.routeName);
        } else if (page == 5) {
          Navigator.of(context).pushNamed(AnimalsMain.routeName);
        } else if (page == 6) {
          Navigator.of(context).pushNamed(SeasonsMain.routeName);
        } else if (page == 7) {
          Navigator.of(context).pushNamed(MoodsMain.routeName);
        } else if (page == 8) {
          Navigator.of(context).pushNamed(SocialVideoMain.routeName);
        } else if (page == 9) {
          Navigator.of(context).pushNamed(SensoryRoomMain.routeName);
        }
      } else if (type == 4) {
        //social video
        if (page == 1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPlayerWidget(
                  "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fmaska.mp4?alt=media&token=7aaf4e5e-18b7-4031-be29-c53ed0efbc0f")));
        } else if (page == 2) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPlayerWidget(
                  "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Figra.mp4?alt=media&token=410abefb-4df2-43da-b8d8-dd87c8e5e64b")));

        } else if (page == 3) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPlayerWidget(
                  "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fudaranje.mp4?alt=media&token=0df58c90-a768-4b3a-aa5c-52e962402a0b")));
        } else if (page == 4) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPlayerWidget(
          "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fsenzornasoba.mp4?alt=media&token=649610bd-efa8-44b4-bc45-c66e5ca50db8")));

        }
      }
    }

    return InkWell(
      onTap: _navigateToThePage,
      child: Card(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [color1, color2])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                imageUrl,
                width: 130,
                height: 130,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
