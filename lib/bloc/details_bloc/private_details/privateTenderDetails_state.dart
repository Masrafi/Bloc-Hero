import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/details_model/privateTenderDetails.dart';

@immutable
abstract class PrivateTenderDetailsState extends Equatable {}

//data loading state
class PrivateTenderDetailsLoadingState extends PrivateTenderDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PrivateTenderDetailsLoadedState extends PrivateTenderDetailsState {
  PrivateTenderDetailsLoadedState(this.users);
  List<PrivateTenderDetailsModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class PrivateTenderDetailsErrorState extends PrivateTenderDetailsState {
  PrivateTenderDetailsErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
