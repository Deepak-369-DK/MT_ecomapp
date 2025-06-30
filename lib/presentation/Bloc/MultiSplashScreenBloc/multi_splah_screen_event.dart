part of 'multi_splah_screen_bloc.dart';

abstract class MultiSplahScreenEvent extends Equatable {
  const MultiSplahScreenEvent();

  @override
  List<Object> get props => [];
}

class SplashNextEvent extends MultiSplahScreenEvent {}

class SplashPrevEvent extends MultiSplahScreenEvent {}
