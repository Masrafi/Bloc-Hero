import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TodayTenderDetailsEvent extends Equatable {
  const TodayTenderDetailsEvent();
}

class TodayTenderDetailsLoadEvent extends TodayTenderDetailsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
