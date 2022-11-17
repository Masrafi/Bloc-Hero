import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CorrigenCountState extends Equatable {}

//data loading state
class CorrigenCountLoadingState extends CorrigenCountState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CorrigenCountLoadedState extends CorrigenCountState {
  CorrigenCountLoadedState(this.users);
  final List<TodayCountModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class CorrigenCountErrorState extends CorrigenCountState {
  CorrigenCountErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
