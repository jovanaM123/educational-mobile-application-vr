part of 'user_psyh_list_bloc.dart';

@immutable
abstract class UserPsyhListState {}

class UserPsyhListInitial extends UserPsyhListState {}

class Loading extends UserPsyhListState {}

class Success extends UserPsyhListState {}

class Failure extends UserPsyhListState {}