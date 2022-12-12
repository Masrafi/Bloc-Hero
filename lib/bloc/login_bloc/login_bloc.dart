import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../repository/login_repo.dart';
import '../../utils/config.dart';
import 'login_event.dart';
import 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LoginRepo loginRepo;
  LogInBloc(this.loginRepo) : super(LogInInitialState()) {
    on<LogInTextChangeEvent>(
      (event, emit) {
        if (EmailValidator.validate(event.emailValue) == false) {
          emit(LogInErrorState("Please enter a valid email"));
        } else if (event.passwordValue.length <= 7) {
          emit(LogInErrorState("Please enter a valiod password"));
        } else {
          emit(LogInValidState());
        }
      },
    );

    on<LogInSubmittedEvent>(
      (event, emit) async {
        emit(LogInLoadingState());
        final message = await loginRepo.login(event.email, event.password);

        if (message == "Success") {
          emit(LogInSuccessState());
        } else {
          emit(LogInFailState());
        }
      },
    );
  }
}
