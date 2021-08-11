import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edu_app/model/Appoinment.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:meta/meta.dart';

part 'list_of_appionment_event.dart';
part 'list_of_appionment_state.dart';

class ListOfAppionmentBloc extends Bloc<ListOfAppionmentEvent, ListOfAppionmentState> {
  AddApoinmentyRepository _addApoinmentyRepository;

  ListOfAppionmentBloc({@required AddApoinmentyRepository addApoinmentyRepository})
      : assert(addApoinmentyRepository != null),
        _addApoinmentyRepository = addApoinmentyRepository, super(null);

  @override
  ListOfAppionmentState get initialState => ListOfAppionmentInitial();

  @override
  Stream<ListOfAppionmentState> mapEventToState(
    ListOfAppionmentEvent event,
  ) async* {
    if (event is ShowListOfPsyhApp) {
      yield* _mapShowListOfAppoinment(event.ac);
    } else if (event is ManageApp) {
      yield* _mapManageAppoinment(event.id, event.type, event.ac);
    }
  }

  Stream<ListOfAppionmentState> _mapShowListOfAppoinment(int ac) async* {
    yield Loading();
    try {
      List<Appoinment> list = await _addApoinmentyRepository.showAllApp(ac);
      yield Success(list);
    } catch (_) {
      yield Failure();
    }
  }

  Stream<ListOfAppionmentState> _mapManageAppoinment(String id, int type, int ac) async* {
    yield Loading();
    try {
      await _addApoinmentyRepository.manageApoinment(id, type);

      var mess = '';

      if(type == 1) {
       mess = "Usepešno ste potvrdili termin zakazanog pregleda.";
     } else {
        mess = "Usepešno ste odbili termin zakazanog pregleda.";
      }
      yield SuccessManage(mess);
      List<Appoinment> list = await _addApoinmentyRepository.showAllApp(ac);
      yield Success(list);
    } catch (_) {
      yield Failure();
    }
  }
}
