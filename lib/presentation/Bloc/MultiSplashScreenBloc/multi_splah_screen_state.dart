part of 'multi_splah_screen_bloc.dart';

class MultiSplahScreenState extends Equatable {
  final int currentPage;
  final Multisplashmodel currentSplashPage;

  MultiSplahScreenState(
      {required this.currentPage, required this.currentSplashPage});

  @override
  List<Object> get props => [currentPage, currentSplashPage];
}
