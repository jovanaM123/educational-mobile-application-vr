part of 'child_act_bloc.dart';

@immutable
abstract class ChildActState {}

class ChildActInitial extends ChildActState {}

class Loading extends ChildActState {}

class Success extends ChildActState {}

class Failure extends ChildActState {}
