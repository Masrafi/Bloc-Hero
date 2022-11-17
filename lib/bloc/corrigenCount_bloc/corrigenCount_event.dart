import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CorrigenCountEvent extends Equatable {
  const CorrigenCountEvent();
}

class CorrigenCountLoadEvent extends CorrigenCountEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
