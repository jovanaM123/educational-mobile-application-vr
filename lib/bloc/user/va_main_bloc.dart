import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/repository/child_repository.dart';
import 'package:meta/meta.dart';

part 'va_main_event.dart';
part 'va_main_state.dart';

class VaMainBloc extends Bloc<VaMainEvent, VaMainState> {
  ChildRepository _childRepository;

  VaMainBloc({@required ChildRepository childRepository})
      : assert(childRepository != null),
        _childRepository = childRepository , super(null);

  @override
  VaMainState get initialState => VaMainInitial();



  @override
  Stream<VaMainState> mapEventToState(
      VaMainEvent event,
      ) async* {
    if (event is AddChildInformation) {
      yield* _mapAddInfo(event.name, event.dateOfBirth, event.gender);
    }
  }

  Stream<VaMainState> _mapAddInfo(String name, String dateOfBirth, String gender) async* {
    yield Loading();
    try {
      await _childRepository.addInfo(name, dateOfBirth, gender);
      yield Success();
    } catch (_) {
      yield Failure();
    }
  }

}
