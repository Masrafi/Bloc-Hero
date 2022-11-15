import 'package:bdtender_bloc/bloc/spalsh_bloc/splash_event.dart';
import 'package:bdtender_bloc/bloc/spalsh_bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SetSplash>((event, emit) async {
      emit(SplashLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(SplashLoadedState());
    });
  }
}
