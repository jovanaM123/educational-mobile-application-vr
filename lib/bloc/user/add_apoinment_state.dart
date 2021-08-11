part of 'add_apoinment_bloc.dart';

@immutable
abstract class AddApoinmentState {}

class AddApoinmentInitial extends AddApoinmentState {}

class Loading extends AddApoinmentState {}

class Reserved extends AddApoinmentState {}

class Success extends AddApoinmentState {}

class Failure extends AddApoinmentState {}