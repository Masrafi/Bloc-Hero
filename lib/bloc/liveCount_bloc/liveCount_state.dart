import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LiveCountState extends Equatable {}

//data loading state
class LiveCountLoadingState extends LiveCountState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LiveCountLoadedState extends LiveCountState {
  LiveCountLoadedState(this.users);
  final List<TodayCountModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class LiveCountErrorState extends LiveCountState {
  LiveCountErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
