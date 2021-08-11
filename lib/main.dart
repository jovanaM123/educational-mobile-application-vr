import 'package:flutter/material.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:edu_app/screens/main_screen.dart';
import 'package:edu_app/screens/psyhologists/psyh_confirm_apoiment.dart';
import 'package:edu_app/screens/psyhologists/psyh_contact_screen.dart';
import 'package:edu_app/screens/psyhologists/psyh_home_screen.dart';
import 'package:edu_app/screens/psyhologists/psyh_login_screen.dart';
import 'package:edu_app/screens/psyhologists/psyh_register_screen.dart';
import 'package:edu_app/screens/users/add_help_quiz.dart';
import 'package:edu_app/screens/users/additional_help.dart';
import 'package:edu_app/screens/users/additional_help_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/Autism_activities.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/autism_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/letters/letters_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/animals/separate_animals.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/letters/match_letters_with_object.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/numbers/numbers_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/numbers/count/count.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/numbers/separate_numbers/separate_number.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/seasons/guess_season.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/seasons/match_season.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/seasons/seasons_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/first_room.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/sensory_room_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/social_video/social_video_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/vegetables/guess_veg.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/vegetables/separate_veg.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/vegetables/vegetables_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/words/guess_word.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/words/learn_word.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/words/words_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/animals.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/down_activities.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/down_syndrome_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/numbers.dart';
import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/objects.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/activities.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/brush_teeth.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/brush_teeth_images.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/dressing.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/dressing_image.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/eating.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/eating_image.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/footwear.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/footwear_image.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/handshaking.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/handshaking_image.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/mental_illness_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/washing_hands.dart';
import 'package:edu_app/screens/users/additional_help_pages/mental_illness/washing_hands_image.dart';
import 'package:edu_app/screens/users/ah_main.dart';
import 'package:edu_app/screens/users/user_home_screen.dart';
import 'package:edu_app/screens/users/list_of_app.dart';
import 'package:edu_app/screens/users/user_login_screen.dart';
import 'package:edu_app/screens/users/user_psyh_list.dart';
import 'package:edu_app/screens/users/user_register_screen.dart';
import 'package:edu_app/widgets/psyh_profile_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/animals/animals_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/animals/guess_animal.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/moods/moods_main.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/moods/guess_mood.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/sensory_activities.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/insert_act.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/sensory_room/all_act.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository _userRep = new UserRepository();
  UserAuthBloc _authBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authBloc = UserAuthBloc(userRepository: _userRep);
    _authBloc.add(AppStarted());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _authBloc.close();
    super.dispose();
  }

  Future<int> _getType() async {
    await _userRep.isAuthicated();
    return _userRep.type;
  }

  Future type() async {
    int type = await _getType();
    return type == 1 ? UserHomeScreen() : PsyhHomeScreen();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: MaterialApp(
          title: 'Educational App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlocBuilder(
            bloc: _authBloc,
            builder: (context, state) {
              if (state is UserAuthInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is UserAuthenticated) {
                type();
              }

              return MainScreen();
            },
          ),
          routes: {
            PsyhLoginScreen.routeName: (ctx) => PsyhLoginScreen(),
            UserLoginScreen.routeName: (ctx) => UserLoginScreen(),
            UserHomeScreen.routeName: (ctx) => UserHomeScreen(),
            PsyhHomeScreen.routeName: (ctx) => PsyhHomeScreen(),
            PsyhRegisterScreen.routeName: (ctx) => PsyhRegisterScreen(_userRep),
            UserRegisterScreen.routeName: (ctx) => UserRegisterScreen(_userRep),
            UserPsyhList.routeName: (ctx) => UserPsyhList(),
            AdditionalHelp.routeName: (ctx) => AdditionalHelp(),
            PsyhConfirmApoiment.routeName: (ctx) => PsyhConfirmApoiment(),
            PsyhContactScreen.routeName: (ctx) => PsyhContactScreen(),
            PsyhProfileInfo.routeName: (ctx) => PsyhProfileInfo(),
            AdditionalHelpQuiz.routeName: (ctx) => AdditionalHelpQuiz(),
            AhMain.routeName: (ctx) => AhMain(),
            MentalIllnessMain.routeName: (ctx) => MentalIllnessMain(),
            AutismMain.routeName: (ctx) => AutismMain(),
            DownSyndromeMain.routeName: (ctx) => DownSyndromeMain(),
            Activities.routeName: (ctx) => Activities(),
            AdditionalHelpMain.routeName: (ctx) => AdditionalHelpMain(),
            Footwear.routeName: (ctx) => Footwear(),
            Dressing.routeName: (ctx) => Dressing(),
            Eating.routeName: (ctx) => Eating(),
            WashingHands.routeName: (ctx) => WashingHands(),
            HandShaking.routeName: (ctx) => HandShaking(),
            WashingHands.routeName: (ctx) => WashingHands(),
            BrushTeeth.routeName: (ctx) => BrushTeeth(),
            BrushTeethImages.routeName: (ctx) => BrushTeethImages(),
            DressingImage.routeName: (ctx) => DressingImage(),
            FootwearImage.routeName: (ctx) => FootwearImage(),
            EatingImage.routeName: (ctx) => EatingImage(),
            WashingHandsImage.routeName: (ctx) => WashingHandsImage(),
            HandshakingImage.routeName: (ctx) => HandshakingImage(),
            AutismActivities.routeName: (ctx) => AutismActivities(),
            DaunActivities.routeName: (ctx) => DaunActivities(),
            NumbersMain.routeName: (ctx) => NumbersMain(),
            VegetablesMain.routeName: (ctx) => VegetablesMain(),
            GuessVeg.routeName: (ctx) => GuessVeg(),
            MatchLettersWithObject.routeName: (ctx) => MatchLettersWithObject(),
            LettersMain.routeName: (ctx) => LettersMain(),
            LearnWord.routeName: (ctx) => LearnWord(),
            WordsMain.routeName: (ctx) => WordsMain(),
            GuessWord.routeName: (ctx) => GuessWord(),
            GuessAnimal.routeName: (ctx) => GuessAnimal(),
            AnimalsMain.routeName: (ctx) => AnimalsMain(),
            MoodsMain.routeName: (ctx) => MoodsMain(),
            GuessMood.routeName: (ctx) => GuessMood(),
            SeasonsMain.routeName: (ctx) => SeasonsMain(),
            GuessSeasons.routeName: (ctx) => GuessSeasons(),
            SocialVideoMain.routeName: (ctx) => SocialVideoMain(),
            Animals.routeName: (ctx) => Animals(),
            Numbers.routeName: (ctx) => Numbers(),
            Objects.routeName: (ctx) => Objects(),
            MatchSeason.routeName: (ctx) => MatchSeason(),
            SeparateAnimals.routeName: (ctx) => SeparateAnimals(),
            SeparateVeg.routeName: (ctx) => SeparateVeg(),
            Count.routeName: (ctx) => Count(),
            ListOfApp.routeName: (ctx) => ListOfApp(),
            SeparateNumbers.routeName: (ctx) => SeparateNumbers(),
            SensoryRoomMain.routeName: (ctx) => SensoryRoomMain(),
            FirstRoom.routeName: (ctx) => FirstRoom(),
            SensoryActivites.routeName: (ctx) => SensoryActivites(),
            InsertSensoryActivites.routeName: (ctx) => InsertSensoryActivites(),
            AllSensoryActivites.routeName: (ctx) => AllSensoryActivites(),
          }),
    );
  }
}


