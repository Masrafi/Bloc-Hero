import 'package:bdtender_bloc/model/registration_model/option_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../../../model/registration_model/relatedCategory_model.dart';

@immutable
abstract class OptionState extends Equatable {}

//data loading state
class OptionLoadingState extends OptionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OptionInitialState extends OptionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OptionLoadedState extends OptionState {
  OptionLoadedState(this.users);
  final List<OptionModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class OptionErrorState extends OptionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OptionNotSearchState extends OptionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
