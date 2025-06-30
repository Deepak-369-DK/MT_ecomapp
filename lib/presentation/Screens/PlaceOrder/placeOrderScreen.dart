import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:ecomapp/presentation/CommonWidgets/appbar.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/bottomNavbar.dart';
import 'package:ecomapp/presentation/Screens/PlaceOrder/Widgets/applyCoupon.dart';
import 'package:ecomapp/presentation/Screens/PlaceOrder/Widgets/bottomwidget.dart';
import 'package:ecomapp/presentation/Screens/PlaceOrder/Widgets/orderPaymentDetails.dart';
import 'package:ecomapp/presentation/Screens/PlaceOrder/Widgets/orderTotalSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Placeorderscreen extends StatelessWidget {
  Cartmodel? cartData;

  Placeorderscreen(this.cartData);

  final List<String> sizes = ['40', '41', '42', '43', '44'];
  final List<int> quantities = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.NormalAppbar(
          centerTitle: "Shopping Bag",
          rightWidget: Icon(Icons.favorite_border),
          leadingOnPress: () => context.pop()),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Img_CartItem + cartData!.imgPath,
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartData!.productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 6),
                      Text(
                        cartData!.description,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text('Size'),
                          SizedBox(width: 6),
                          DropdownButton<String>(
                            value: cartData!.size,
                            items: sizes
                                .map(
                                  (s) => DropdownMenuItem(
                                    child: Text(s),
                                    value: s,
                                  ),
                                )
                                .toList(),
                            onChanged: (newSize) {
                              if (newSize != null) {
                                // context.read<ShoppingBagBloc>().add(UpdateSize(newSize));
                              }
                            },
                          ),
                          SizedBox(width: 6),
                          Text('Qty'),
                          SizedBox(width: 6),
                          DropdownButton<int>(
                            value: int.parse(cartData!.qty.toString()),
                            items: quantities
                                .map(
                                  (q) => DropdownMenuItem(
                                    child: Text(q.toString()),
                                    value: q,
                                  ),
                                )
                                .toList(),
                            onChanged: (newQty) {
                              if (newQty != null) {
                                //   context.read<ShoppingBagBloc>().add(UpdateQuantity(newQty));
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          text: 'Delivery by ',
                          style: TextStyle(color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: '10 May 2XXX',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Applycoupon(),
            SizedBox(height: 30),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            Orderpaymentdetails(
              product: cartData!,
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            Ordertotalsection(
              product: cartData!,
            ),
            SizedBox(height: 30),
            Bottomwidget(context: context, price: cartData!.price),
          ],
        ),
      ),
    );
  }
}
