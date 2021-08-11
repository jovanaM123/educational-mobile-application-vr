part of 'va_main_bloc.dart';

@immutable
abstract class VaMainEvent {}

class AddChildInformation extends VaMainEvent {
  final String name;
  final String dateOfBirth;
  final String gender;

  AddChildInformation({
    @required this.name,
    @required this.dateOfBirth,
    @required this.gender,});


}