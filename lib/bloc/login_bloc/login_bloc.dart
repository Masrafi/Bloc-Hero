import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitialState()) {
    on<LogInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(LogInErrorState("Please enter a valid email"));
      } else if (event.passwordValue.length <= 7) {
        emit(LogInErrorState("Please enter a valiod password"));
      } else {
        emit(LogInValidState());
      }
    });

    on<LogInSubmittedEvent>((event, emit) {
      emit(LogInLoadingState());
      if (event.email != null && event.password != null) {
        print("This is navigation screen");
      }
    });
  }
}
