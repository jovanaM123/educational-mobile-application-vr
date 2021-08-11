import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/helper/validators.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository, super(null);

  @override
  RegisterState get initialState => RegisterState.empty();


  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailChangedReg) {
      yield* _mapEmailChangedToState(event.email, state);
    } else if (event is PasswordChangedReg) {
      yield* _mapPasswordChangedToState(event.password, state);
    } else if (event is SubmittedReg) {
      yield* _mapFormSubmittedToState(event.email, event.password, event.type);
    }
  }


  Stream<RegisterState> _mapEmailChangedToState(String email, RegisterState currentState) async* {
    yield RegisterState.empty();
    bool validateEmail = await Validators.isValidEmail(email);

    yield currentState.update(
     isEmailValid: validateEmail,
   );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password, RegisterState currentState) async* {
    yield RegisterState.empty();
    bool validatePass = await Validators.isValidPassword(password);

    yield currentState.update(
      isPasswordValid: validatePass,
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
      String email,
      String password,
      int type
      ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password, type);
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
