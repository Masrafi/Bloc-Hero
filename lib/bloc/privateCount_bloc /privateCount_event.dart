import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class PrivateCountEvent extends Equatable {
  const PrivateCountEvent();
}

class PrivateCountLoadEvent extends PrivateCountEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
