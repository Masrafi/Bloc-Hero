import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class TodayCountState extends Equatable {}

//data loading state
class TodayCountLoadingState extends TodayCountState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodayCountLoadedState extends TodayCountState {
  TodayCountLoadedState(this.users);
  final List<TodayCountModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class TodayCountErrorState extends TodayCountState {
  TodayCountErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
