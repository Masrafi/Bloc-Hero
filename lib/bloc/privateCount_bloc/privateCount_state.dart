import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PrivateCountState extends Equatable {}

//data loading state
class PrivateCountLoadingState extends PrivateCountState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PrivateCountLoadedState extends PrivateCountState {
  PrivateCountLoadedState(this.users);
  final List<TodayCountModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class PrivateCountErrorState extends PrivateCountState {
  PrivateCountErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
