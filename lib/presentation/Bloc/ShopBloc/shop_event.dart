part of 'shop_bloc.dart';

abstract class ShopEvent {}

class Shop_LoadProductDetail extends ShopEvent {
  final TrendingProducts Selected_product;

  Shop_LoadProductDetail({required this.Selected_product});
}

class SelectSize extends ShopEvent {
  final String size;

  SelectSize(this.size);
}

class Shop_AddToCartEvent extends ShopEvent {
  final TrendingProducts product;
  final String size;

  Shop_AddToCartEvent({required this.product, required this.size});
}
