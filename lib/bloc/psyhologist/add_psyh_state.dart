part of 'add_psyh_bloc.dart';

@immutable
abstract class AddPsyhState {}

class AddPsyhInitial extends AddPsyhState {}

class Loading extends AddPsyhState {}

class Success extends AddPsyhState {}

class Failure extends AddPsyhState {}
