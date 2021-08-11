import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/helper/validators.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository, super(null);

  @override
  LoginState get initialState => LoginState.empty();


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email, state);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password, state);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }


  Stream<LoginState> _mapEmailChangedToState(String email, LoginState currentState) async* {
    yield LoginState.empty();
    bool validateEmail = await Validators.isValidEmail(email);

    yield currentState.update(
      isEmailValid: validateEmail,
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password, LoginState currentState) async* {
    yield LoginState.empty();
    bool validatePass = await Validators.isValidPassword(password);

    yield currentState.update(
      isPasswordValid: validatePass,
    );
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWIthCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}