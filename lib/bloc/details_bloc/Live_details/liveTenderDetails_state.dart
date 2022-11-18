import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/details_model/live111TenderDetails.dart';

@immutable
abstract class LiveTenderDetailsState extends Equatable {}

//data loading state
class LiveTenderDetailsLoadingState extends LiveTenderDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LiveTenderDetailsLoadedState extends LiveTenderDetailsState {
  LiveTenderDetailsLoadedState(this.users);
  List<LiveTenderDetailsModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class LiveTenderDetailsErrorState extends LiveTenderDetailsState {
  LiveTenderDetailsErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
