import 'package:bdtender_bloc/repository/corrigen_repo.dart';
import 'package:bdtender_bloc/repository/saveTenderShow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/today_repo.dart';
import 'saveTenderShow_event.dart';
import 'saveTenderShow_state.dart';

class SaveTenderShowBloc extends Bloc<SaveTenderShowEvent, SaveTenderShowState> {
  final RepositorySaveTenderShow _repository;

  SaveTenderShowBloc(this._repository) : super(SaveTenderShowLoadingState()) {
    on<SaveTenderShowLoadEvent>((event, emit) async {
      emit(SaveTenderShowLoadingState());
      try {
        final user = await _repository.getSaveTendewrShowCountData();
        emit(SaveTenderShowLoadedState(user));
      } catch (e) {
        emit(SaveTenderShowErrorState(e.toString()));
      }
    });
  }
}
