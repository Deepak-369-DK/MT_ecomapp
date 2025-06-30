import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:ecomapp/domain/Repository/cartRepository.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cartmodel> cartItems;

  CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object> get props => [message];
}
