import 'package:bdtender_bloc/model/registration_model/categoryGroup_model.dart';
import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/details_model/todayTenderDetails.dart';

@immutable
abstract class CategoryGroupState extends Equatable {}

//data loading state
class CategoryGroupLoadingState extends CategoryGroupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryGroupLoadedState extends CategoryGroupState {
  CategoryGroupLoadedState(this.users);
  List<CategoryGroupModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class CategoryGroupErrorState extends CategoryGroupState {
  CategoryGroupErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
