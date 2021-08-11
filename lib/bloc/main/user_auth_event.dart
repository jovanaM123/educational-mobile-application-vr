part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthEvent {}

class AppStarted extends UserAuthEvent {}

class LoggedIn extends UserAuthEvent {}

class LoggedOut extends UserAuthEvent {}