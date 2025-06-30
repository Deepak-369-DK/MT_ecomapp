import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:flutter/material.dart';

class Ordertotalsection extends StatelessWidget {
  Cartmodel product;

  Ordertotalsection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Order Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Spacer(),
            Text(
              '₹ ${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('EMI Available'),
                SizedBox(width: 10),
                Text(
                  'Details',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
