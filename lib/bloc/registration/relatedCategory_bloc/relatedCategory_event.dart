import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RelatedCategoryEvent extends Equatable {
  const RelatedCategoryEvent();
}

class RelatedCategorySubmittedEvent extends RelatedCategoryEvent {
  final String ghCode;
  RelatedCategorySubmittedEvent({required this.ghCode});

  @override
  // TODO: implement props
  List<Object?> get props => [ghCode];
}
