part of 'list_of_appionment_bloc.dart';

@immutable
abstract class ListOfAppionmentState {}

class ListOfAppionmentInitial extends ListOfAppionmentState {}

class Loading extends ListOfAppionmentState {}

class Success extends ListOfAppionmentState {
  final List<Appoinment> listOfApp;
  Success(this.listOfApp);
}

class SuccessManage extends ListOfAppionmentState{
  final String succ;
  SuccessManage(this.succ);
}

class Failure extends ListOfAppionmentState {}
