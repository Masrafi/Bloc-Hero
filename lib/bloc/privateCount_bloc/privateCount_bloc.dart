import 'package:bdtender_bloc/repository/private_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/today_repo.dart';
import 'privateCount_event.dart';
import 'privateCount_state.dart';

class PrivateCountBloc extends Bloc<PrivateCountEvent, PrivateCountState> {
  final RepositoryPrivate _repository;

  PrivateCountBloc(this._repository) : super(PrivateCountLoadingState()) {
    on<PrivateCountLoadEvent>((event, emit) async {
      emit(PrivateCountLoadingState());
      try {
        final user = await _repository.getPrivateCountData();
        emit(PrivateCountLoadedState(user));
      } catch (e) {
        emit(PrivateCountErrorState(e.toString()));
      }
    });
  }
}
