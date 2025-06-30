import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:ecomapp/data/Models/trendingProducts.dart';
import 'package:ecomapp/data/conts/cartItems.dart';
import 'package:ecomapp/domain/Repository/cartRepository.dart';

class CartUseCase implements CartRepository {
  // @override
  // Future<void> addToCart(TrendingProducts product, String size) async {
  //   await Future.delayed(const Duration(milliseconds: 200));
  //   _cartItems.add(CartItem(product: product, selectedSize: size));
  //   print("${_cartItems.length}" );
  // }

  @override
  Future<List<Cartmodel>> getCartItems() async {
    await Future.delayed(const Duration(milliseconds: 200));
    var _cartItems = CartItems.map((e) => Cartmodel.fromMap(e)).toList();
    return _cartItems;
  }
}
