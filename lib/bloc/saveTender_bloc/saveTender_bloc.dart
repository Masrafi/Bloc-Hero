import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../utils/config.dart';
import 'saveTender_event.dart';
import 'saveTender_state.dart';

class SaveTenderBloc extends Bloc<SaveTenderEvent, SaveTenderState> {
  SaveTenderBloc() : super(SaveTenderInitialState()) {
    on<SaveTenderSubmittedEvent>(
      (event, emit) async {
        emit(SaveTenderLoadingState());
        var endPoint = Config.SAVE_TENDER;
        Response response = await post(Uri.parse(endPoint), body: {
          "Email": event.email,
          "tendercode": event.tenderCode,
        });
        if (jsonDecode(response.body) == "Success") {
          emit(SaveTenderSuccessState());
        } else {
          emit(SaveTenderFailState());
        }
      },
    );
  }
}
