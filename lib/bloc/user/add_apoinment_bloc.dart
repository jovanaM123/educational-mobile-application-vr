import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:meta/meta.dart';

part 'add_apoinment_event.dart';
part 'add_apoinment_state.dart';

class AddApoinmentBloc extends Bloc<AddApoinmentEvent, AddApoinmentState> {
  AddApoinmentyRepository _addApoinmentyRepository;

  AddApoinmentBloc({@required AddApoinmentyRepository addApoinmentyRepository})
      : assert(addApoinmentyRepository != null),
        _addApoinmentyRepository = addApoinmentyRepository, super(null);

  @override
  AddApoinmentState get initialState => AddApoinmentInitial();



  @override
  Stream<AddApoinmentState> mapEventToState(
    AddApoinmentEvent event,
  ) async* {
    if (event is AddUserApoinment) {
      yield* _mapAddApoinment(event.email, event.date);
    }
  }

  Stream<AddApoinmentState> _mapAddApoinment(String drEmail, String dateOfAp) async* {
    yield Loading();
    try {
      bool isReserved = await _addApoinmentyRepository.isReserved(dateOfAp, drEmail);

      if(!isReserved) {
        await _addApoinmentyRepository.addApoinment(drEmail, dateOfAp);
        yield Success();
      } else {
        yield Reserved();
      }

    } catch (_) {
      yield Failure();
    }
  }
}
