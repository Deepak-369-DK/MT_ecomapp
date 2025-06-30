import 'package:ecomapp/presentation/Bloc/WishListBloc/wishlist_bloc.dart';
import 'package:ecomapp/presentation/Screens/WishList/widgets/wishlistCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (_, state) {
        if (state is WishlistLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WishlistLoaded) {
          final products = state.filteredProducts;

          return CustomWaterfall(products.length, products);
        }
        return Container();
      },
    );
  }
}
