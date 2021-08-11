part of 'va_main_bloc.dart';

@immutable
abstract class VaMainState {}

class VaMainInitial extends VaMainState {}

class Loading extends VaMainState {}

class Success extends VaMainState {}

class Failure extends VaMainState {}