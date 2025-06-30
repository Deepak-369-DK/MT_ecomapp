import 'package:ecomapp/domain/Usecases/cartUsecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCartItems>((event, emit) async {
      emit(CartLoading());
      try {
        final items = await CartUseCase().getCartItems();
        emit(CartLoaded(items));
      } catch (e) {
        emit(CartError("Unable to fetch data"));
      }
    });
  }
}
