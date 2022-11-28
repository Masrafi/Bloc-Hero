import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/registration_model/relatedCategory_model.dart';

@immutable
abstract class RelatedCategoryState extends Equatable {}

//data loading state
class RelatedCategoryLoadingState extends RelatedCategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RelatedCategoryLoadedState extends RelatedCategoryState {
  RelatedCategoryLoadedState(this.users);
  final List<RelatedCategoryModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class RelatedCategoryErrorState extends RelatedCategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
