import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:flutter/material.dart';

class Orderpaymentdetails extends StatelessWidget {
  Cartmodel product;

  Orderpaymentdetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Payment Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        _paymentDetailRow(
            'Order Amounts', '₹ ${product.price.toStringAsFixed(2)}'),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Convenience'),
            Row(
              children: [
                Text(
                  'Know More',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 20),
                Text(
                  'Apply Coupon',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 6),
        _paymentDetailRow('Delivery Fee', 'Free', isRed: true),
      ],
    );
  }

  Widget _paymentDetailRow(String title, String value, {bool isRed = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(
            color: isRed ? Colors.red : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
