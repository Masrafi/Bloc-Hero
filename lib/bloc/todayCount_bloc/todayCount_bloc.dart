import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/today_repo.dart';
import 'todayCount_event.dart';
import 'todayCount_state.dart';

class TodayCountBloc extends Bloc<TodayCountEvent, TodayCountState> {
  final RepositoryToday _repository;

  TodayCountBloc(this._repository) : super(TodayCountLoadingState()) {
    on<TodayCountLoadEvent>((event, emit) async {
      emit(TodayCountLoadingState());
      try {
        print("This is try");
        final user = await _repository.getTodayCountData();
        emit(TodayCountLoadedState(user));
      } catch (e) {
        print("This is catch: ${e.toString()}");
        emit(TodayCountErrorState(e.toString()));
      }
    });
  }
}
