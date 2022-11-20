import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/details_repo/liveTenderDetails_repo.dart';
import 'liveTenderDetails_event.dart';
import 'liveTenderDetails_state.dart';

class LiveTenderDetailsBloc
    extends Bloc<LiveTenderDetailsEvent, LiveTenderDetailsState> {
  final RepositoryLiveTenderDetails _repository;

  LiveTenderDetailsBloc(this._repository)
      : super(LiveTenderDetailsLoadingState()) {
    on<LiveTenderDetailsLoadEvent>((event, emit) async {
      emit(LiveTenderDetailsLoadingState());
      try {
        final user = await _repository.getLiveTenderDetailsData();
        emit(LiveTenderDetailsLoadedState(user));
      } catch (e) {
        emit(LiveTenderDetailsErrorState(e.toString()));
      }
    });
  }
}
