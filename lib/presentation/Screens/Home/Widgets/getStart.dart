import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/presentation/CommonWidgets/elevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/getStart.png"), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            color: Colors.transparent
                .withValues(red: -100, blue: -100, alpha: 0.2, green: -100),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: Text(
                "You want Authentic, here you go!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppTheme().white,
                    fontSize: 40,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              "Find it here, buy it now!",
              style: TextStyle(color: AppTheme().white, fontSize: 20),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomElevatedButton(
                  label: "Get Started",
                  circleRadius: 5,
                  onpress: () => context.go("/home"),
                ),
              )),
        ],
      ),
    );
  }
}
