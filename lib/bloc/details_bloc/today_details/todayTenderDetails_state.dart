import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/details_model/todayTenderDetails.dart';

@immutable
abstract class TodayTenderDetailsState extends Equatable {}

//data loading state
class TodayTenderDetailsLoadingState extends TodayTenderDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodayTenderDetailsLoadedState extends TodayTenderDetailsState {
  TodayTenderDetailsLoadedState(this.users);
  List<TodayTenderDetailsModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class TodayTenderDetailsErrorState extends TodayTenderDetailsState {
  TodayTenderDetailsErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
