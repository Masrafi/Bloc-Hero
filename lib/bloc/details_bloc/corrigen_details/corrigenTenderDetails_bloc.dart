import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/details_repo/corrigenTenderDetails_repo.dart';
import 'corrigenTenderDetails_event.dart';
import 'corrigenTenderDetails_state.dart';

class CorrigenTenderDetailsBloc
    extends Bloc<CorrigenTenderDetailsEvent, CorrigenTenderDetailsState> {
  final RepositoryCorrigenTenderDetails _repository;

  CorrigenTenderDetailsBloc(this._repository)
      : super(CorrigenTenderDetailsLoadingState()) {
    on<CorrigenTenderDetailsLoadEvent>((event, emit) async {
      emit(CorrigenTenderDetailsLoadingState());
      try {
        final user = await _repository.getCorrigenTenderDetailsData();
        emit(CorrigenTenderDetailsLoadedState(user));
      } catch (e) {
        print("This is error: ${e.toString()}");
        emit(CorrigenTenderDetailsErrorState(e.toString()));
      }
    });
  }
}
