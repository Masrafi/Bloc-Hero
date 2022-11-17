import 'package:bdtender_bloc/repository/live_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/today_repo.dart';
import 'liveCount_event.dart';
import 'liveCount_state.dart';

class LiveCountBloc extends Bloc<LiveCountEvent, LiveCountState> {
  final RepositoryLive _repository;

  LiveCountBloc(this._repository) : super(LiveCountLoadingState()) {
    on<LiveCountLoadEvent>((event, emit) async {
      emit(LiveCountLoadingState());
      try {
        final user = await _repository.getTodayCountData();
        emit(LiveCountLoadedState(user));
      } catch (e) {
        emit(LiveCountErrorState(e.toString()));
      }
    });
  }
}
