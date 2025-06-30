import 'package:bloc/bloc.dart';
import 'package:ecomapp/data/Models/trendingProducts.dart';
import 'package:ecomapp/data/conts/TrendingProductdata.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<SortProducts>(_onSortProducts);
    on<FilterProducts>(_onFilterProducts);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<WishlistState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    List<TrendingProducts> _mockProducts = trendingProducts_data
        .map(
          (e) => TrendingProducts.fromJson(e),
        )
        .toList();

    final products = _mockProducts;
    emit(WishlistLoaded(products: products, filteredProducts: products));
  }

  void _onSortProducts(SortProducts event, Emitter<WishlistState> emit) {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      List<TrendingProducts> sortedList =
          List.from(currentState.filteredProducts);
      if (event.sortBy == 'Price Low to High') {
        sortedList.sort((a, b) => a.price.compareTo(b.price));
      } else if (event.sortBy == 'Price High to Low') {
        sortedList.sort((a, b) => b.price.compareTo(a.price));
      } else if (event.sortBy == 'Rating') {
        sortedList.sort((a, b) => b.rating.compareTo(a.rating));
      } else if (event.sortBy == 'None') {
        sortedList = trendingProducts_data
            .map(
              (e) => TrendingProducts.fromJson(e),
            )
            .toList();
      }
      emit(currentState.copyWith(
          filteredProducts: sortedList, sortOption: event.sortBy));
    }
  }

  void _onFilterProducts(FilterProducts event, Emitter<WishlistState> emit) {}
}
