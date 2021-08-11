import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc
    extends Bloc<UserAuthEvent, UserAuthState> {
  final UserRepository _userRepository;

  UserAuthBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(null);

  UserAuthState get initialState => UserAuthInitial();

  @override
  Stream<UserAuthState> mapEventToState(UserAuthEvent event) async*{

    if(event is AppStarted) {
      final isSignIn = await _userRepository.isSignedIn();

      if(isSignIn) {
        yield UserAuthenticated();
      } else {
        yield UserUnauthenticated();
      }
    }

    if(event is LoggedIn) {
      yield UserAuthenticated();
    }

    if(event is LoggedOut) {
      yield UserUnauthenticated();
      _userRepository.signOut();
    }

  }
}