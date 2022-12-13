import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class OptionEvent extends Equatable {
  const OptionEvent();
}

class OptionSubmittedEvent extends OptionEvent {
  List ghCode;
  OptionSubmittedEvent({required this.ghCode});

  @override
  // TODO: implement props
  List<Object?> get props => [ghCode];
}
