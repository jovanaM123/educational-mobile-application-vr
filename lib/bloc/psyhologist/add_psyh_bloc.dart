import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/repository/psyh_details_respiratory.dart';
import 'package:meta/meta.dart';

part 'add_psyh_event.dart';
part 'add_psyh_state.dart';

class AddPsyhBloc extends Bloc<AddPsyhEvent, AddPsyhState> {
  PsyhDetailsRespiratory _psyhDetailsRespiratory;

  AddPsyhBloc({@required PsyhDetailsRespiratory userRepository})
      : assert(userRepository != null),
        _psyhDetailsRespiratory = userRepository, super(null);

  @override
  AddPsyhState get initialState => AddPsyhInitial();

  @override
  Stream<AddPsyhState> mapEventToState(AddPsyhEvent event,) async* {
    if (event is SubmitPsyh) {
      yield* _mapLoginWithCredentialsPressedToState(
        firstname: event.firstname,
        lastname: event.lastname,
        description: event.description,
        imageUrl: event.imageUrl,
      );
    }
  }


  Stream<AddPsyhState> _mapLoginWithCredentialsPressedToState({
    String firstname,
    String lastname,
    String description,
    String imageUrl,
  }) async* {
    yield Loading();
    try {
      await _psyhDetailsRespiratory.createAccount(firstname, lastname, description, imageUrl);
      yield Success();
    } catch (_) {
      yield Failure();
    }
  }

}
