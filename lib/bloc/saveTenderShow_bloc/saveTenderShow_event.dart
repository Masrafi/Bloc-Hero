import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SaveTenderShowEvent extends Equatable {
  const SaveTenderShowEvent();
}

class SaveTenderShowLoadEvent extends SaveTenderShowEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
