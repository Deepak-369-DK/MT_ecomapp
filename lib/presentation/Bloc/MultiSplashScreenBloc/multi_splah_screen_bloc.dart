import 'package:bloc/bloc.dart';
import 'package:ecomapp/data/Models/multiSplashModel.dart';
import 'package:ecomapp/data/conts/multiSplashScreenData.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'multi_splah_screen_event.dart';

part 'multi_splah_screen_state.dart';

class MultiSplahScreenBloc
    extends Bloc<MultiSplahScreenEvent, MultiSplahScreenState> {
  MultiSplahScreenBloc()
      : super(MultiSplahScreenState(
            currentPage: 0, currentSplashPage: splashPages[0])) {
    on<SplashNextEvent>((event, emit) {
      final nextIndex = (state.currentPage + 1) < splashPages.length
          ? state.currentPage + 1
          : state.currentPage;
      emit(MultiSplahScreenState(
          currentPage: nextIndex, currentSplashPage: splashPages[nextIndex]));
    });

    on<SplashPrevEvent>((event, emit) {
      final prevIndex = (state.currentPage - 1) >= 0
          ? state.currentPage - 1
          : state.currentPage;
      emit(MultiSplahScreenState(
          currentPage: prevIndex, currentSplashPage: splashPages[prevIndex]));
    });
  }
}
