part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}


class EmailChangedReg extends RegisterEvent {
  final String email;

  EmailChangedReg(this.email);

}

class PasswordChangedReg extends RegisterEvent {
  final String password;

  PasswordChangedReg(this.password);

}

class SubmittedReg extends RegisterEvent {
  final String email;
  final String password;
  final int type;

  SubmittedReg({@required this.email, @required this.password, @required this.type});
}