import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/details_repo/privateTenderDetails_repo.dart';
import 'privateTenderDetails_event.dart';
import 'privateTenderDetails_state.dart';

class PrivateTenderDetailsBloc
    extends Bloc<PrivateTenderDetailsEvent, PrivateTenderDetailsState> {
  final RepositoryPrivateTenderDetails _repository;

  PrivateTenderDetailsBloc(this._repository)
      : super(PrivateTenderDetailsLoadingState()) {
    on<PrivateTenderDetailsLoadEvent>((event, emit) async {
      emit(PrivateTenderDetailsLoadingState());
      try {
        final user = await _repository.getPrivateTenderDetailsData();
        emit(PrivateTenderDetailsLoadedState(user));
      } catch (e) {
        emit(PrivateTenderDetailsErrorState(e.toString()));
      }
    });
  }
}
