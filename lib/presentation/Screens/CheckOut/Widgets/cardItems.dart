import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:ecomapp/presentation/Bloc/CartBloc/cart_bloc.dart';
import 'package:ecomapp/presentation/Bloc/CartBloc/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemCard extends StatelessWidget {
  final Cartmodel cartItem;

  const ItemCard({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final variationWidgets = ["black", "red"]
        .map(
          (variation) => Container(
            margin: EdgeInsets.only(right: 6),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade400),
              color: Colors.white,
            ),
            child: Text(variation),
          ),
        )
        .toList();

    return Card(
      color: AppTheme().white,
      elevation: 2,
      shadowColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "$Img_CartItem${cartItem.imgPath}",
                    width: 120,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.productName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Variations: ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        ...variationWidgets,
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(cartItem.rating.toString()),
                        SizedBox(width: 6),
                        Text('(${cartItem.reviews})',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 80,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text('\$${cartItem.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              'upto ${cartItem.discPer}% off',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '\$${cartItem.oldPrice}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )),
                SizedBox(width: 8),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Total Order (1)   :"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$ ${cartItem.price}.00'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
