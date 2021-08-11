part of 'user_auth_bloc.dart';


@immutable
abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthenticated extends UserAuthState {}

class UserUnauthenticated extends UserAuthState {}


