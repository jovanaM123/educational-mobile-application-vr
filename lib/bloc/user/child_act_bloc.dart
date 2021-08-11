import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/repository/child_activities_repository.dart';
import 'package:meta/meta.dart';

part 'child_act_event.dart';
part 'child_act_state.dart';

class ChildActBloc extends Bloc<ChildActEvent, ChildActState> {
  ChildActivitiesRepository _childActivitiesRepository;

  ChildActBloc({@required ChildActivitiesRepository childActivitiesRepository})
      : assert(childActivitiesRepository != null),
        _childActivitiesRepository = childActivitiesRepository, super(null);

  @override
  ChildActState get initialState => ChildActInitial();


  @override
  Stream<ChildActState> mapEventToState(
    ChildActEvent event,
  ) async* {
    if(event is AddChildAct) {
      yield* _mapAddAd(event.minuteSpend, event.grade, event.type);
    }
  }

  Stream<ChildActState> _mapAddAd(int minuteSp, int gr, int type) async*
  {
    yield Loading();

    try {
      await _childActivitiesRepository.addActivites(minuteSp, gr, type);
      yield Success();
    } catch(_) {
      yield Failure();
    }

  }



}
