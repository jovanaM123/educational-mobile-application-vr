import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/repository/psyh_details_respiratory.dart';
import 'package:meta/meta.dart';

part 'user_psyh_list_event.dart';
part 'user_psyh_list_state.dart';

class UserPsyhListBloc extends Bloc<UserPsyhListEvent, UserPsyhListState> {
  PsyhDetailsRespiratory _psyhDetailsRespiratory;

  UserPsyhListBloc({@required PsyhDetailsRespiratory userRepository})
      : assert(userRepository != null),
        _psyhDetailsRespiratory = userRepository, super(null);

  @override
  UserPsyhListState get initialState => UserPsyhListInitial();


  @override
  Stream<UserPsyhListState> mapEventToState(
    UserPsyhListEvent event,
  ) async* {
    if (event is ShowList) {
      yield* _mapShowListOfPsyhologist();
    }
  }


  Stream<UserPsyhListState> _mapShowListOfPsyhologist() async* {
    yield Loading();
    try {
      await _psyhDetailsRespiratory.showAllPsyh();
      yield Success();
    } catch (_) {
      yield Failure();
    }
  }
}
