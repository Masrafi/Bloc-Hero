import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/registration_repo/categoryGroup_repo.dart';
import 'categoryGroup_event.dart';
import 'categoryGroup_state.dart';

class CategoryGroupBloc extends Bloc<CategoryGroupEvent, CategoryGroupState> {
  final RepositoryCategoryGroup _repository;

  CategoryGroupBloc(this._repository) : super(CategoryGroupLoadingState()) {
    on<CategoryGroupLoadEvent>((event, emit) async {
      emit(CategoryGroupLoadingState());
      try {
        final user = await _repository.getCategoryGroupData();
        emit(CategoryGroupLoadedState(user));
      } catch (e) {
        emit(CategoryGroupErrorState(e.toString()));
      }
    });
  }
}
