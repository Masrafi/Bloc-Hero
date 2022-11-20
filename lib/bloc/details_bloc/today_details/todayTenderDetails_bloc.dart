import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todayTenderDetails_event.dart';
import 'todayTenderDetails_state.dart';

class TodayTenderDetailsBloc
    extends Bloc<TodayTenderDetailsEvent, TodayTenderDetailsState> {
  final RepositoryTodayTenderDetails _repository;

  TodayTenderDetailsBloc(this._repository)
      : super(TodayTenderDetailsLoadingState()) {
    on<TodayTenderDetailsLoadEvent>((event, emit) async {
      emit(TodayTenderDetailsLoadingState());
      try {
        final user = await _repository.getTodayTenderDetailsData();
        emit(TodayTenderDetailsLoadedState(user));
      } catch (e) {
        print("This is error: ${e.toString()}");
        emit(TodayTenderDetailsErrorState(e.toString()));
      }
    });
  }
}
