import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:flutter/material.dart';

class Addresscard extends StatelessWidget {
  const Addresscard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme().white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(0, 2),
                          blurRadius: 2),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('216 St Paul\'s Rd, London N1 2LL, UK'),
                    SizedBox(height: 4),
                    Text('Contact : +44-784232'),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Container(
          height: 90,
          width: 72,
          decoration: BoxDecoration(
              color: AppTheme().white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300)),
          child: Icon(Icons.add, size: 32),
        ),
      ],
    );
  }
}
