part of 'user_appoinment_bloc.dart';

@immutable
abstract class UserAppoinmentState {}

class UserAppoinmentInitial extends UserAppoinmentState {}


class Loading extends UserAppoinmentState {}

class Success extends UserAppoinmentState {
  final List<Appoinment> listOfApp;
  Success(this.listOfApp);
}

class Failure extends UserAppoinmentState {}
