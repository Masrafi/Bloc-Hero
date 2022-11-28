import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CategoryGroupEvent extends Equatable {
  const CategoryGroupEvent();
}

class CategoryGroupLoadEvent extends CategoryGroupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
