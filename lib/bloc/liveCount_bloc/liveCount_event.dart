import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LiveCountEvent extends Equatable {
  const LiveCountEvent();
}

class LiveCountLoadEvent extends LiveCountEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
