part of 'child_act_bloc.dart';

@immutable
abstract class ChildActEvent {}

class AddChildAct extends ChildActEvent {
  final int minuteSpend;
  final int grade;
  final int type;

  AddChildAct({
    @required this.minuteSpend,
    @required this.grade,
    @required this.type,
   });

}
