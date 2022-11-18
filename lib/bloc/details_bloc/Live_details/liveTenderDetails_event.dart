import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LiveTenderDetailsEvent extends Equatable {
  const LiveTenderDetailsEvent();
}

class LiveTenderDetailsLoadEvent extends LiveTenderDetailsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
