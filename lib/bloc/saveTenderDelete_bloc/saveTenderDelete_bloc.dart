import 'package:bdtender_bloc/repository/saveTenderDelete_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../utils/config.dart';
import 'saveTenderDelete_event.dart';
import 'saveTenderDelete_state.dart';

class SaveTenderDeleteBloc
    extends Bloc<SaveTenderDeleteEvent, SaveTenderDeleteState> {
  SafeTenderDeleteRepo safeTenderDeleteRepo;
  SaveTenderDeleteBloc(this.safeTenderDeleteRepo)
      : super(SaveTenderDeleteInitialState()) {
    on<SaveTenderDeleteSubmittedEvent>(
      (event, emit) async {
        final message = await safeTenderDeleteRepo.saveTenderDelete(
            event.email, event.tenderCode);
        if (message == "Success") {
          emit(SaveTenderDeleteSuccessState());
        } else {
          emit(SaveTenderDeleteFailState());
        }
      },
    );
  }
}
