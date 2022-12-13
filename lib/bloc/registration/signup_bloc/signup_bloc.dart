import 'package:bdtender_bloc/repository/registration_repo/signup_repo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RepositorySignUp repositorySignUp;
  SignUpBloc(this.repositorySignUp) : super(SignUpInitialState()) {
    on<SignUpTextSubmitEvent>((event, emit) async {
      emit(SignUpLoadingState());
      final message = await repositorySignUp.getSignUpData(
        name: event.name,
        designation: event.designation,
        organization: event.organization,
        email: event.email,
        phone: event.phone,
        pass: event.password,
        group: event.group,
        cat: event.category,
      );
      Future.delayed(Duration(seconds: 3));
      emit(SignUpSuccessState());
    });
  }
}
