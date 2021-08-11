import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/model/Appoinment.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:meta/meta.dart';

part 'user_appoinment_event.dart';
part 'user_appoinment_state.dart';

class UserAppoinmentBloc extends Bloc<UserAppoinmentEvent, UserAppoinmentState> {
  AddApoinmentyRepository _addApoinmentyRepository;

  UserAppoinmentBloc({@required AddApoinmentyRepository addApoinmentyRepository})
      : assert(addApoinmentyRepository != null),
        _addApoinmentyRepository = addApoinmentyRepository, super(null);

  @override
  UserAppoinmentState get initialState => UserAppoinmentInitial();

  @override
  Stream<UserAppoinmentState> mapEventToState(
      UserAppoinmentEvent event,
      ) async* {
    if (event is ShowListOfUserApp) {
      yield* _mapShowListOfAppoinment();
    }
  }

  Stream<UserAppoinmentState> _mapShowListOfAppoinment() async* {
    yield Loading();
    try {
      List<Appoinment> list = await _addApoinmentyRepository.showAllAppOfUser();
      yield Success(list);
    } catch (_) {
      yield Failure();
    }
  }
}
