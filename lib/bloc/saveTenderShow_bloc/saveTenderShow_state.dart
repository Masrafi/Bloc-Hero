import 'package:bdtender_bloc/model/saveTender_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SaveTenderShowState extends Equatable {}

//data loading state
class SaveTenderShowLoadingState extends SaveTenderShowState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SaveTenderShowLoadedState extends SaveTenderShowState {
  SaveTenderShowLoadedState(this.users);
  final List<SaveTenderShow> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class SaveTenderShowErrorState extends SaveTenderShowState {
  SaveTenderShowErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
