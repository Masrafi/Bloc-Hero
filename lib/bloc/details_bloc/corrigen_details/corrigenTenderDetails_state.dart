import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/details_model/corrigenTenderDetails.dart';

@immutable
abstract class CorrigenTenderDetailsState extends Equatable {}

//data loading state
class CorrigenTenderDetailsLoadingState extends CorrigenTenderDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CorrigenTenderDetailsLoadedState extends CorrigenTenderDetailsState {
  CorrigenTenderDetailsLoadedState(this.users);
  List<CorrigenTenderDetailsModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class CorrigenTenderDetailsErrorState extends CorrigenTenderDetailsState {
  CorrigenTenderDetailsErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
