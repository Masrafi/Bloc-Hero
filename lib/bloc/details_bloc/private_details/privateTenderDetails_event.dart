import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class PrivateTenderDetailsEvent extends Equatable {
  const PrivateTenderDetailsEvent();
}

class PrivateTenderDetailsLoadEvent extends PrivateTenderDetailsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
