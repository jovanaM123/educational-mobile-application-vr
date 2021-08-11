part of 'add_apoinment_bloc.dart';

@immutable
abstract class AddApoinmentEvent {}

class AddUserApoinment extends AddApoinmentEvent {
  final String email;
  final String date;

  AddUserApoinment({
    @required this.email,
    @required this.date,});


}
