import 'package:bdtender_bloc/repository/saveTender_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'saveTender_event.dart';
import 'saveTender_state.dart';

class SaveTenderBloc extends Bloc<SaveTenderEvent, SaveTenderState> {
  SafeTenderRepo safeTenderRepo;
  SaveTenderBloc(this.safeTenderRepo) : super(SaveTenderInitialState()) {
    on<SaveTenderSubmittedEvent>(
      (event, emit) async {
        emit(SaveTenderLoadingState());
        final message =
            await safeTenderRepo.safeTender(event.email, event.tenderCode);
        if (message == "Success") {
          emit(SaveTenderSuccessState());
        } else {
          emit(SaveTenderFailState());
        }
      },
    );
  }
}
