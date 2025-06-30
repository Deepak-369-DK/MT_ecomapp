import 'package:ecomapp/presentation/CommonWidgets/elevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bottomwidget extends StatelessWidget {
  BuildContext context;
  double price;

  Bottomwidget({required this.context, required this.price});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(0, -1),
                blurRadius: 12,
              ),
            ],
          ),
          child: Center(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹ ${price.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'View Details',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onpress: () {
                      context.push("/shipping", extra: price);
                    },
                    label: 'Proceed to Payment',
                    circleRadius: 5,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
