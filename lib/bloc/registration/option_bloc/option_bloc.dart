import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/registration_repo/option_repo.dart';
import '../../../repository/registration_repo/relatedCategory_repo.dart';
import 'option_event.dart';
import 'option_state.dart';

class OptionBloc extends Bloc<OptionEvent, OptionState> {
  final RepositoryOption _repository;

  OptionBloc(this._repository) : super(OptionNotSearchState()) {
    on<OptionSubmittedEvent>(
      (event, emit) async {
        if (event is OptionSubmittedEvent) {
          emit(OptionLoadingState());
          try {
            print("This is try");
            final user = await _repository.getOptionData(event.ghCode);
            emit(OptionLoadedState(user));
          } catch (e) {
            print("This is error: ${e.toString()}");
            emit(OptionErrorState());
          }
        } else {
          emit(OptionNotSearchState());
        }
      },
    );
  }
}
