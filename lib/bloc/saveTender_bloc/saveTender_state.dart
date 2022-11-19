abstract class SaveTenderState {}

class SaveTenderInitialState extends SaveTenderState {}

class SaveTenderValidState extends SaveTenderState {}

class SaveTenderErrorState extends SaveTenderState {
  final String errorMessage;
  SaveTenderErrorState(this.errorMessage);
}

class SaveTenderLoadingState extends SaveTenderState {}

class SaveTenderSuccessState extends SaveTenderState {}

class SaveTenderFailState extends SaveTenderState {}
