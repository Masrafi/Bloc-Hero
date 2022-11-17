import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TodayCountEvent extends Equatable {
  const TodayCountEvent();
}

class TodayCountLoadEvent extends TodayCountEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
