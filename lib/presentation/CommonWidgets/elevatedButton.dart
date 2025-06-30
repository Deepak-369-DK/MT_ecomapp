import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String label;
  double circleRadius;
  void Function()? onpress;

  CustomElevatedButton(
      {required this.label, this.onpress, this.circleRadius = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              AppTheme().red,
            ),
            backgroundColor: WidgetStatePropertyAll(
              AppTheme().red,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(circleRadius)),
            )),
        onPressed: onpress,
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
