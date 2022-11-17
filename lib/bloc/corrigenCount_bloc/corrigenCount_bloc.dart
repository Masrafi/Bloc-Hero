import 'package:bdtender_bloc/repository/corrigen_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/today_repo.dart';
import 'corrigenCount_event.dart';
import 'corrigenCount_state.dart';

class CorrigenCountBloc extends Bloc<CorrigenCountEvent, CorrigenCountState> {
  final RepositoryCorrigen _repository;

  CorrigenCountBloc(this._repository) : super(CorrigenCountLoadingState()) {
    on<CorrigenCountLoadEvent>((event, emit) async {
      emit(CorrigenCountLoadingState());
      try {
        final user = await _repository.getTodayCountData();
        emit(CorrigenCountLoadedState(user));
      } catch (e) {
        emit(CorrigenCountErrorState(e.toString()));
      }
    });
  }
}
