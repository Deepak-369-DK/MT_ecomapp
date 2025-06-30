part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<TrendingProducts> products;
  final List<TrendingProducts> filteredProducts;
  final String sortOption;

  WishlistLoaded({
    required this.products,
    required this.filteredProducts,
    this.sortOption = 'None',
  });

  @override
  List<Object> get props => [products, filteredProducts, sortOption];

  WishlistLoaded copyWith({
    List<TrendingProducts>? products,
    List<TrendingProducts>? filteredProducts,
    String? sortOption,
  }) {
    return WishlistLoaded(
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      sortOption: sortOption ?? this.sortOption,
    );
  }
}
