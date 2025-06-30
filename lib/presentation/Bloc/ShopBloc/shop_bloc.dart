import 'package:bloc/bloc.dart';
import 'package:ecomapp/data/Models/trendingProducts.dart';
import 'package:ecomapp/domain/Repository/cartRepository.dart';
import 'package:ecomapp/domain/Usecases/cartUsecase.dart';
import 'package:meta/meta.dart';

part 'shop_event.dart';

part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopProductDetailInitial()) {
    on<Shop_LoadProductDetail>((event, emit) async {
      emit(ShopProductDetailLoading());
      try {
        emit(ShopProductDetailLoaded(
            product: event.Selected_product, selectedSize: "6"));
      } catch (e) {
        emit(ProductDetailError(message: 'Failed to load product'));
      }
    });

    on<SelectSize>((event, emit) {
      if (state is ShopProductDetailLoaded) {
        final currentState = state as ShopProductDetailLoaded;
        emit(currentState.copyWith(selectedSize: event.size));
      }
    });

    // on<Shop_AddToCartEvent>((event, emit) async {
    //   if (state is ShopProductDetailLoaded) {
    //     try {
    //      // await CartRepositoryImpl().addToCart(event.product, event.size);
    //      // emit(ProductAddedToCart());
    //       emit(ShopProductDetailInitial());
    //     } catch (e) {
    //       emit(ProductDetailError(message: 'Failed to add to cart'));
    //     }
    //   }
    // });
  }
}
