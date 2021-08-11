part of 'add_psyh_bloc.dart';

@immutable
abstract class AddPsyhEvent {}

class SubmitPsyh extends AddPsyhEvent {
  final String firstname;
  final String lastname;
  final String description;
  final String imageUrl;

  SubmitPsyh({
  @required this.firstname,
  @required this.lastname,
  @required this.description,
  @required this.imageUrl,
  });

}
