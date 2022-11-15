import 'package:flutter/cupertino.dart';

@immutable
abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashLoadedState extends SplashState {}
