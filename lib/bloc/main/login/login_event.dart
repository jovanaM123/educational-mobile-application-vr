part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Submitted extends LoginEvent {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password});

}


class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({@required this.email, @required this.password});

}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password});
}