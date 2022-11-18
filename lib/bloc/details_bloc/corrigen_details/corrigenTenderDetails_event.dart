import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CorrigenTenderDetailsEvent extends Equatable {
  const CorrigenTenderDetailsEvent();
}

class CorrigenTenderDetailsLoadEvent extends CorrigenTenderDetailsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
