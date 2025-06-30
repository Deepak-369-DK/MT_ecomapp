part of 'shop_bloc.dart';

abstract class ShopState {}

class ShopProductDetailInitial extends ShopState {}

class ShopProductDetailLoading extends ShopState {}

class ShopProductDetailLoaded extends ShopState {
  final TrendingProducts product;
  final String selectedSize;

  ShopProductDetailLoaded({
    required this.product,
    required this.selectedSize,
  });

  ShopProductDetailLoaded copyWith({String? selectedSize}) {
    return ShopProductDetailLoaded(
      product: product,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}

class ProductAddedToCart extends ShopState {}

class ProductDetailError extends ShopState {
  final String message;

  ProductDetailError({required this.message});
}
