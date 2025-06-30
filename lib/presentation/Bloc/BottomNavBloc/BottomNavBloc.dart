import 'package:ecomapp/data/Models/trendingProducts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvent { home, wishlist, shop, search, settings }

class NavigationState {
  final NavigationEvent selectedItem;

  NavigationState({required this.selectedItem});
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(NavigationState(selectedItem: NavigationEvent.home)) {
    on<NavigationEvent>((event, emit) {
      emit(NavigationState(selectedItem: event));
    });
  }
}
