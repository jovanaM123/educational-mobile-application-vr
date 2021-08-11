part of 'list_of_appionment_bloc.dart';

@immutable
abstract class ListOfAppionmentEvent {}

class ShowListOfPsyhApp extends ListOfAppionmentEvent {
  final int ac;

  ShowListOfPsyhApp({
    @required this.ac,
  });
}

class ManageApp extends ListOfAppionmentEvent {
  final String id;
  final int type;
  final int ac;

  ManageApp({
    @required this.id,
    @required this.type,
    @required this.ac,
  });
}
