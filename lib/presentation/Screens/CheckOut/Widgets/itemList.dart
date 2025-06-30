import 'package:ecomapp/presentation/Bloc/CartBloc/cart_bloc.dart';
import 'package:ecomapp/presentation/Bloc/CartBloc/cart_state.dart';
import 'package:ecomapp/presentation/Screens/CheckOut/Widgets/addressCard.dart';
import 'package:ecomapp/presentation/Screens/CheckOut/Widgets/cardItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartItemsCard extends StatelessWidget {
  const CartItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CartLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Addresscard(),
                  const SizedBox(height: 16),
                  Text(
                    'Shopping List',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    itemCount: state.cartItems.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return GestureDetector(
                        onTap: () {
                          context.push("/placeorder", extra: item);
                        },
                        child: ItemCard(cartItem: item),
                      );
                    },
                  ),
                ],
              );
            } else if (state is CartError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
