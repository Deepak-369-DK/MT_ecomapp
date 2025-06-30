import 'package:ecomapp/data/Models/cartModel.dart';

abstract class CartRepository {
  // Future<void> addToCart(TrendingProducts product, String size);
  Future<List<Cartmodel>> getCartItems();
}
