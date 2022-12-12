import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/registration_repo/relatedCategory_repo.dart';
import 'relatedCategory_event.dart';
import 'relatedCategory_state.dart';

class RelatedCategoryBloc
    extends Bloc<RelatedCategoryEvent, RelatedCategoryState> {
  final RepositoryRelatedCategory _repository;

  RelatedCategoryBloc(this._repository)
      : super(RelatedCategoryNotSearchState()) {
    on<RelatedCategorySubmittedEvent>(
      (event, emit) async {
        if (event is RelatedCategorySubmittedEvent) {
          emit(RelatedCategoryLoadingState());
          try {
            print("This is try");
            final user = await _repository.getRelatedCategoryData(event.ghCode);
            emit(RelatedCategoryLoadedState(user));
          } catch (e) {
            print("This is error: ${e.toString()}");
            emit(RelatedCategoryErrorState());
          }
        } else {
          emit(RelatedCategoryNotSearchState());
        }
      },
    );
  }
}
